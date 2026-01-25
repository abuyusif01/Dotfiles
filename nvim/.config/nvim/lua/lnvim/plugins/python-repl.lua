return {
  "hkupty/iron.nvim",
  config = function()
    local core = require("iron.core")
    local marks = require("iron.marks")
    local view = require("iron.view")
    local common = require("iron.fts.common")
    local visual_send_and_move_down = function()
      core.visual_send()
      vim.cmd("normal! j")
    end
    local line_send_and_move_down = function()
      core.send_line()
      vim.cmd("normal! j")
    end

    vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>", { desc = "Start Repl" })
    vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Restart Repl" })
    vim.keymap.set("n", "<leader>rF", "<cmd>IronFocus<cr>", { desc = "Focus Repl" })
    vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>", { desc = "Hide Repl" })
    vim.keymap.set("n", "<leader>rc", core.send_motion, { desc = "Send motion" })
    vim.keymap.set("n", "<leader>rf", core.send_file, { desc = "Send file" })
    vim.keymap.set("n", "<leader>rl", core.send_line, { desc = "Send line" })
    vim.keymap.set("n", "<leader><CR>", line_send_and_move_down, { desc = "Send line" })
    vim.keymap.set("n", "<leader>rms", core.send_mark, { desc = "Mark send" })
    vim.keymap.set("n", "<leader>rmc", core.mark_motion, { desc = "Mark motion" })
    vim.keymap.set("n", "<leader>rq", core.close_repl, { desc = "Exit" })
    vim.keymap.set("n", "<leader>rmd", marks.drop_last, { desc = "Mark delete" })
    vim.keymap.set("n", "<leader>r<CR>", function()
      core.send(nil, string.char(13))
    end, { desc = "Carriage return" })
    vim.keymap.set("n", "<leader>r<space>", function()
      core.send(nil, string.char(03))
    end, { desc = "Interrupt" })
    vim.keymap.set("n", "<leader>rx", function()
      core.send(nil, string.char(12))
    end, { desc = "Clear" })
    vim.keymap.set("v", "<leader>rc", core.visual_send, { desc = "Send visual" })
    vim.keymap.set("v", "<leader><CR>", visual_send_and_move_down, { desc = "Send visual" })
    vim.keymap.set("v", "<leader>rmc", core.mark_visual, { desc = "Mark visual" })

    core.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { "zsh" },
          },
          python = {
            command = { "ipython" },
            -- format = require("iron.fts.common").bracketed_paste_python,
            format = common.bracketed_paste,
            block_dividers = { "# ..", "#%%" },
          },
        },
        -- repl_open_cmd = require("iron.view").right(90),
        repl_open_cmd = view.split.vertical.botright("30%", {
          winfixwidth = false,
          winfixheight = false,
          number = true,
        }),
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
