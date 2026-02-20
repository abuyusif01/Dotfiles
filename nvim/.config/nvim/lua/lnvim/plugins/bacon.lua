return {
  {
    "Canop/nvim-bacon",
    config = function()
      require("bacon").setup({
        quickfix = {
          enabled = true, -- Enable Quickfix integration
          event_trigger = true, -- Trigger QuickFixCmdPost after populating Quickfix list
        },
      })
      vim.keymap.set("n", "-", ":BaconLoad<CR>:w<CR>:BaconNext<CR>", { desc = "Navigate to next bacon location" })
      vim.keymap.set("n", "_", ":BaconList<CR>", { desc = "Open bacon locations list" })
    end,
  },
}
