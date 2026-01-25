local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- -- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- -- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim

-- general keymaps
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ "n", "v" }, "<leader>xx", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")

-- debug
keymap({ "n", "v" }, "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>dc", "<cmd>lua require('vscode').action('editor.debug.action.continue')<CR>")
keymap({ "n", "v" }, "<leader>dr", "<cmd>lua require('vscode').action('editor.debug.action.restart')<CR>")
keymap({ "n", "v" }, "<leader>dt", "<cmd>lua require('vscode').action('editor.debug.action.toggleRepl')<CR>")
keymap({ "n", "v" }, "<leader>ds", "<cmd>lua require('vscode').action('editor.debug.action.stepOver')<CR>")
keymap({ "n", "v" }, "<leader>di", "<cmd>lua require('vscode').action('editor.debug.action.stepInto')<CR>")
keymap({ "n", "v" }, "<leader>do", "<cmd>lua require('vscode').action('editor.debug.action.stepOut')<CR>")

-- code navigation
keymap({ "n", "v" }, "gi", "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>")
keymap({ "n", "v" }, "gd", "<cmd>lua require('vscode').action('editor.action.goToDeclaration')<CR>")
keymap({ "n", "v" }, "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")
keymap({ "n", "v" }, "gt", "<cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<CR>")

-- code formatting
keymap({ "n", "v" }, "<leader>cf", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ "n", "v" }, "<leader>cx", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>cr", "<cmd>lua require('vscode').action('editor.action.rename')<CR>")

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- map for file bookmarks
keymap({ "n", "v" }, "<leader>ba", "<cmd>lua require('vscode').action('bookmarks.toggleLabeled')<CR>")
keymap({ "n", "v" }, "<leader>bo", "<cmd>lua require('vscode').action('bookmarks.listFromAllFiles')<CR>")
keymap({ "n", "v" }, "<leader>bc", "<cmd>lua require('vscode').action('bookmarks.clear')<CR>")

-- the whole dependencies
-- 1. project manager
-- 2. bookmarks
-- 3. vscode-harpoon

-- bookmarks.listFromAllFiles
-- ctrl + p (show all files in project) leader + ff
-- open file side bar cmd + b
-- split buffer  cp
-- toggle zenmode
-- default tmux (create session with workspace name, then try to attach it first)
-- debugging
-- bookmarks
--

