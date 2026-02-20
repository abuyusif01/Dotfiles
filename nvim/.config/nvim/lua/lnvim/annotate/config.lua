local M = {}
local storage = require("lnvim.annotate.storage")
local marks = require("lnvim.annotate.marks")

function M.setup()
  -- Set up highlight groups
  vim.api.nvim_set_hl(0, "AnnotationHighlight", { bg = "#3d3d00", underline = true })
  vim.api.nvim_set_hl(0, "AnnotationVirtText", { fg = "#ffcc00", italic = true })

  -- Load saved annotations
  storage.load_annotations()

  -- Set up keymaps for all visual modes
  vim.keymap.set("v", "<leader>a", function()
    marks.annotate_selection()
  end, { desc = "Add annotation to selection" })

  vim.keymap.set("n", "<leader>ad", function()
    marks.delete_annotation_at_cursor()
  end, { desc = "Delete annotation at cursor" })

  -- Right-click context menu support
  vim.keymap.set("v", "<RightMouse>", function()
    vim.cmd("normal! gv")
    vim.ui.select({ "Add Annotation", "Cancel" }, { prompt = "Action:" }, function(choice)
      if choice == "Add Annotation" then
        marks.annotate_selection()
      end
    end)
  end, { desc = "Right-click menu" })

  -- Auto-restore annotations when buffer is loaded
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    callback = function(args)
      marks.restore_annotations(args.buf)
    end,
  })

  -- Auto-save annotations on exit
  vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
    callback = function()
      storage.save_annotations()
    end,
  })

  -- Auto-save periodically (every 30 seconds)
  vim.defer_fn(function()
    local timer = vim.loop.new_timer()
    timer:start(
      30000,
      30000,
      vim.schedule_wrap(function()
        storage.save_annotations()
      end)
    )
  end, 30000)
end

return M
