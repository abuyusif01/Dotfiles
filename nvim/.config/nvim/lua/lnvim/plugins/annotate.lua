return {
  {
    "annotate.nvim",
    dir = vim.fn.stdpath("config") .. "/lua/lnvim/annotate",
    event = "VeryLazy",
    keys = {
      { "<leader>a", mode = "v", desc = "Add annotation to selection" },
      {
        "<leader>al",
        function()
          require("lnvim.annotate").view_annotations()
        end,
        desc = "View all annotations",
      },
      {
        "<leader>ac",
        function()
          require("lnvim.annotate").clear_annotations()
        end,
        desc = "Clear all annotations",
      },
      { "<leader>ad", mode = "n", desc = "Delete annotation at cursor" },
    },
    config = function()
      require("lnvim.annotate").setup()
    end,
  },
}
