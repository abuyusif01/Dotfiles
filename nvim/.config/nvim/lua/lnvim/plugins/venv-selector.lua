return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false,
    -- dap_enabled = true,
  },
  -- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  ft = "python",
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vv", "<cmd>VenvSelect<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
