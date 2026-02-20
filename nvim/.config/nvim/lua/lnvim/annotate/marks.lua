local M = {}
local storage = require("lnvim.annotate.storage")
local ui = require("lnvim.annotate.ui")

M.ns_id = vim.api.nvim_create_namespace("annotations")

-- Get visual selection info
local function get_visual_selection()
  local mode = vim.fn.visualmode()
  if mode == "" then
    mode = vim.fn.mode()
  end

  vim.cmd("normal! gv")
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local bufnr = vim.api.nvim_get_current_buf()

  local start_line = start_pos[2] - 1
  local start_col = start_pos[3] - 1
  local end_line = end_pos[2] - 1
  local end_col = end_pos[3]

  -- Handle different visual modes
  if mode == "V" then
    start_col = 0
    local last_line = vim.api.nvim_buf_get_lines(bufnr, end_line, end_line + 1, false)
    if #last_line > 0 then
      end_col = #last_line[1]
    end
  end

  return {
    bufnr = bufnr,
    start_line = start_line,
    start_col = start_col,
    end_line = end_line,
    end_col = end_col,
    mode = mode,
  }
end

-- Extract selected text
local function get_selected_text(bufnr, start_line, start_col, end_line, end_col)
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)

  if #lines == 0 then
    return nil
  end

  local selected_text = ""

  if #lines == 1 then
    local line = lines[1]
    if start_col < #line then
      selected_text = line:sub(start_col + 1, math.min(end_col, #line))
    end
  else
    local first_line = lines[1]:sub(start_col + 1)
    local last_line = lines[#lines]:sub(1, math.min(end_col, #lines[#lines]))

    if #lines > 2 then
      selected_text = first_line .. "..." .. last_line
    else
      selected_text = first_line .. " " .. last_line
    end
  end

  selected_text = selected_text:gsub("^%s+", ""):gsub("%s+$", "")

  if selected_text == "" then
    return nil
  end

  if #selected_text > 50 then
    selected_text = selected_text:sub(1, 47) .. "..."
  end

  return selected_text
end

-- Create annotation
function M.annotate_selection()
  local selection = get_visual_selection()

  if
    selection.start_line > selection.end_line
    or (selection.start_line == selection.end_line and selection.start_col > selection.end_col)
  then
    vim.notify("Invalid selection", vim.log.levels.WARN)
    return
  end

  local selected_text =
    get_selected_text(selection.bufnr, selection.start_line, selection.start_col, selection.end_line, selection.end_col)

  if not selected_text then
    vim.notify("No text selected", vim.log.levels.WARN)
    return
  end

  local filepath = vim.api.nvim_buf_get_name(selection.bufnr)

  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

  vim.defer_fn(function()
    ui.prompt_for_comment(function(comment)
      if not comment or comment == "" then
        return
      end

      local ok, extmark_id =
        pcall(vim.api.nvim_buf_set_extmark, selection.bufnr, M.ns_id, selection.start_line, selection.start_col, {
          end_line = selection.end_line,
          end_col = selection.end_col,
          hl_group = "AnnotationHighlight",
          virt_text = { { " 💬 " .. comment, "AnnotationVirtText" } },
          virt_text_pos = "eol",
          hl_mode = "combine",
          strict = false,
        })

      if not ok then
        vim.notify("Failed to create annotation: " .. tostring(extmark_id), vim.log.levels.ERROR)
        return
      end

      local annotation = {
        bufnr = selection.bufnr,
        start_line = selection.start_line,
        start_col = selection.start_col,
        end_line = selection.end_line,
        end_col = selection.end_col,
        comment = comment,
        selected_text = selected_text,
        extmark_id = extmark_id,
        filepath = filepath,
      }

      storage.add_annotation(annotation)
      vim.notify("✓ Annotation added and saved", vim.log.levels.INFO)
    end)
  end, 10)
end

-- Delete annotation at cursor
function M.delete_annotation_at_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1] - 1
  local col = cursor[2]

  local extmarks = vim.api.nvim_buf_get_extmarks(bufnr, M.ns_id, 0, -1, { details = true })

  for _, extmark in ipairs(extmarks) do
    local extmark_id = extmark[1]
    local extmark_line = extmark[2]
    local extmark_col = extmark[3]
    local details = extmark[4]

    local end_line = details.end_row or extmark_line
    local end_col = details.end_col or extmark_col

    local in_range = false

    if line == extmark_line and line == end_line then
      if col >= extmark_col and col < end_col then
        in_range = true
      end
    elseif line == extmark_line and line < end_line then
      if col >= extmark_col then
        in_range = true
      end
    elseif line > extmark_line and line < end_line then
      in_range = true
    elseif line == end_line and line > extmark_line then
      if col < end_col then
        in_range = true
      end
    end

    if in_range then
      vim.api.nvim_buf_del_extmark(bufnr, M.ns_id, extmark_id)

      if storage.remove_annotation(extmark_id, bufnr) then
        vim.notify("✓ Annotation deleted and saved", vim.log.levels.INFO)
        return
      end
    end
  end

  vim.notify("No annotation found at cursor", vim.log.levels.WARN)
end

-- Clear annotations
function M.clear_annotations()
  local bufnr = vim.api.nvim_get_current_buf()

  vim.ui.select({ "Current buffer", "All buffers" }, { prompt = "Clear annotations from:" }, function(choice)
    if not choice then
      return
    end

    if choice == "Current buffer" then
      vim.api.nvim_buf_clear_namespace(bufnr, M.ns_id, 0, -1)
      local removed_count = storage.clear_annotations_by_buffer(bufnr)
      vim.notify(string.format("✓ Cleared %d annotation(s) from current buffer", removed_count), vim.log.levels.INFO)
    elseif choice == "All buffers" then
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) then
          vim.api.nvim_buf_clear_namespace(buf, M.ns_id, 0, -1)
        end
      end

      local total_count = storage.clear_all_annotations()
      vim.notify(string.format("✓ Cleared %d annotation(s) from all buffers", total_count), vim.log.levels.INFO)
    end
  end)
end

-- Restore annotations for a buffer
function M.restore_annotations(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local filepath = vim.api.nvim_buf_get_name(bufnr)
  if filepath == "" then
    return
  end

  for _, ann in ipairs(storage.get_annotations()) do
    if ann.filepath == filepath then
      ann.bufnr = bufnr

      if ann.extmark_id then
        local ok, existing = pcall(vim.api.nvim_buf_get_extmark_by_id, bufnr, M.ns_id, ann.extmark_id, {})
        if ok and existing and #existing > 0 then
          goto continue
        end
      end

      local ok, extmark_id = pcall(vim.api.nvim_buf_set_extmark, bufnr, M.ns_id, ann.start_line, ann.start_col, {
        end_line = ann.end_line,
        end_col = ann.end_col,
        hl_group = "AnnotationHighlight",
        virt_text = { { " 💬 " .. ann.comment, "AnnotationVirtText" } },
        virt_text_pos = "eol",
        hl_mode = "combine",
        strict = false,
      })

      if ok then
        ann.extmark_id = extmark_id
        storage.extmark_to_annotation[extmark_id] = ann
      end

      ::continue::
    end
  end
end

return M
