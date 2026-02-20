local M = {}
local storage = require("lnvim.annotate.storage")

-- Prompt for comment input
function M.prompt_for_comment(callback)
  vim.ui.input({ prompt = "Comment: ", default = "" }, callback)
end

-- View all annotations in a floating window
function M.view_annotations()
  local annotations = storage.get_annotations()

  if #annotations == 0 then
    vim.notify("No annotations found", vim.log.levels.INFO)
    return
  end

  local lines = {}
  table.insert(lines, "=== Annotations ===")
  table.insert(lines, "")

  for i, ann in ipairs(annotations) do
    local file = vim.fn.fnamemodify(ann.filepath, ":~:.")
    table.insert(lines, string.format("%d. [%s:%d:%d]", i, file, ann.start_line + 1, ann.start_col + 1))
    table.insert(lines, string.format('   Text: "%s"', ann.selected_text))
    table.insert(lines, string.format("   💬 %s", ann.comment))
    table.insert(lines, "")
  end

  -- Create a floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")

  local width = 80
  local height = math.min(#lines, 20)
  local _ = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
    title = " Annotations ",
    title_pos = "center",
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<cr>", { noremap = true, silent = true })
end

return M
