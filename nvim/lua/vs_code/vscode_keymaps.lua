local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- Delete to black hole
keymap({ "n", "v" }, "<leader>d", '"_d', opts)

-- Paste over (preserve paste register)
keymap("x", "<leader>p", '"_dP', opts)
-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

--
keymap("i", "<C-c>", "<Esc>", { noremap = true, silent = true })

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim

-- general keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>c", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- harpoon keymaps
keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
--keymap({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

keymap("n", "<leader>rc", ":luafile ~/.config/nvim/init.lua<CR>", opts)


local vscode = require('vscode')


-- Open File Explorer (Ex mode equivalent)
keymap("n", "<leader>pv", function()
  vscode.action("workbench.view.explorer")
end, opts)


-- Run code (if using Code Runner extension)
-- keymap("n", "<leader>pr", function()
--   vscode.action("code-runner.run")
-- end, opts)

-- Quick Open file search
keymap("n", "<leader>pf", function()
  vscode.action("workbench.action.quickOpen")
end, opts)

--
--
--
-- ********OIL KEYMAPS********
--
--
--

local map = vim.keymap.set
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = {"*"},
    callback = function()
        map("n", "-", function() vscode.action('oil-code.open') end)
    end,
})

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {"oil"},
    callback = function()
        map("n", "-", function() vscode.action('oil-code.openParent') end)
        map("n", "_", function() vscode.action('oil-code.openCwd') end)
        map("n", "<CR>", function() vscode.action('oil-code.select') end)
        map("n", "<C-t>", function() vscode.action('oil-code.selectTab') end)
        map("n", "<C-l>", function() vscode.action('oil-code.refresh') end)
        map("n", "`", function() vscode.action('oil-code.cd') end)
    end,
})

-- Open parent dir with Oil (if you use the Oil extension in VSCode)
keymap("n", "<leader>po", function() vscode.action("oil-code.open") end, opts)


-- Toggle sidebar (Explorer, etc.)
keymap("n", "<leader>e", function()
  require("vscode").action("workbench.action.toggleSidebarVisibility")
end, opts)

-- ********HARPOON KEYMAPS********

-- Add current file to harpoon list
keymap("n", "<leader>a", function()
  vscode.action('vscode-harpoon.addEditor')
end, opts)

-- Toggle harpoon quick menu
keymap("n", "<leader>hp", function()
  vscode.action('vscode-harpoon.editorQuickPick')
end, opts)

-- Navigate to files 1-4
keymap("n", "<M-h>", function()
  vscode.action('vscode-harpoon.gotoEditor1')
end, opts)

keymap("n", "<M-j>", function()
  vscode.action('vscode-harpoon.gotoEditor2')
end, opts)

keymap("n", "<M-k>", function()
  vscode.action('vscode-harpoon.gotoEditor3')
end, opts)

keymap("n", "<M-l>", function()
  vscode.action('vscode-harpoon.gotoEditor4')
end, opts)

-- Navigate prev/next in Harpoon list
keymap("n", "<M-p>", function()
  vscode.action('vscode-harpoon.gotoPreviousEditor')
end, opts)

keymap("n", "<M-n>", function()
  vscode.action('vscode-harpoon.gotoNextEditor')
end, opts)
