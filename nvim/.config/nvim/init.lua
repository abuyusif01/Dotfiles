if vim.g.vscode then
  -- VSCode Neovim
  require("code.keymaps")
else
  -- Ordinary Neovim
  require("lnvim.config.lazy")
end
