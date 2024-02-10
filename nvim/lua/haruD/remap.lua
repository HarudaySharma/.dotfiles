vim.g.mapleader = " "

-- ci( -> delete everything in () and insert
-- cib -> delete everything in the () and insert
-- di{ , di( , dib -> delete without going in insert mode.

-- noremap j k|noremap <C-w>j <C-w>k|noremap <C-w><C-j> <C-w>k
----vim.keymap.set({"n", "v"}, "j", "k")
----vim.keymap.set({"n", "v"}, "<C-w>j", "<C-w>k")
----vim.keymap.set({"n", "v"}, "<C-w><C-j>", "<C-w>k")

-- noremap k j|noremap <C-w>k <C-w>j|noremap <C-w><C-k> <C-w>j
----vim.keymap.set({"n", "v"}, "k", "j")
----vim.keymap.set({"n", "v"}, "<C-w>k", "<C-w>j")
----vim.keymap.set({"n", "v"}, "<C-w><C-k>", "<C-w>j")


vim.keymap.set({"n", "v"}, "E", "$")

vim.keymap.set({"n", "v"}, "<leader>o", 'o<Esc>0')
vim.keymap.set({"n", "v"}, "<leader>O", 'O<Esc>0')
-- vim.keymap.set({"n", "v"}, "<leader>o", 'o<Esc>0"_D')
-- vim.keymap.set({"n", "v"}, "<leader>O", 'O<Esc>0"_D')

vim.keymap.set({"n", "v"}, "<leader>F", vim.cmd.Format)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/haruD/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

