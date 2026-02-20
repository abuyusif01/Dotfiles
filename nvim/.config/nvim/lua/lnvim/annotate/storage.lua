local M = {}

M.annotations = {}
M.extmark_to_annotation = {}
M.data_path = vim.fn.stdpath("data") .. "/annotations.json"

-- Load annotations from file
function M.load_annotations()
  local file = io.open(M.data_path, "r")
  if not file then
    return
  end

  local content = file:read("*all")
  file:close()

  if content and content ~= "" then
    local ok, data = pcall(vim.json.decode, content)
    if ok and data then
      M.annotations = data
    end
  end
end

-- Save annotations to file
function M.save_annotations()
  -- Convert annotations to serializable format
  local data = {}
  for _, ann in ipairs(M.annotations) do
    table.insert(data, {
      filepath = ann.filepath,
      start_line = ann.start_line,
      start_col = ann.start_col,
      end_line = ann.end_line,
      end_col = ann.end_col,
      comment = ann.comment,
      selected_text = ann.selected_text,
    })
  end

  local ok, json = pcall(vim.json.encode, data)
  if not ok then
    vim.notify("Failed to encode annotations", vim.log.levels.ERROR)
    return
  end

  local file = io.open(M.data_path, "w")
  if not file then
    vim.notify("Failed to open annotations file for writing", vim.log.levels.ERROR)
    return
  end

  file:write(json)
  file:close()
end

-- Get all annotations
function M.get_annotations()
  return M.annotations
end

-- Add annotation
function M.add_annotation(annotation)
  table.insert(M.annotations, annotation)
  M.extmark_to_annotation[annotation.extmark_id] = annotation
  M.save_annotations()
end

-- Remove annotation
function M.remove_annotation(extmark_id, bufnr)
  for i, ann in ipairs(M.annotations) do
    if ann.extmark_id == extmark_id and ann.bufnr == bufnr then
      table.remove(M.annotations, i)
      M.extmark_to_annotation[extmark_id] = nil
      M.save_annotations()
      return true
    end
  end
  return false
end

-- Clear annotations by buffer or all
function M.clear_annotations_by_buffer(bufnr)
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  local removed_count = 0

  for i = #M.annotations, 1, -1 do
    if M.annotations[i].bufnr == bufnr or M.annotations[i].filepath == filepath then
      M.extmark_to_annotation[M.annotations[i].extmark_id] = nil
      table.remove(M.annotations, i)
      removed_count = removed_count + 1
    end
  end

  M.save_annotations()
  return removed_count
end

-- Clear all annotations
function M.clear_all_annotations()
  local total_count = #M.annotations
  M.annotations = {}
  M.extmark_to_annotation = {}
  M.save_annotations()
  return total_count
end

return M
