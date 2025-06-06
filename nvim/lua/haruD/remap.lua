vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "E", "$")

vim.keymap.set({"n", "v"}, "<leader>F", vim.cmd.Format)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>po", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", "<cmd>YankBank<CR>")
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.dotfiles/tmux/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick-fix maps
vim.keymap.set("n", "[c", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "]c", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/haruD/<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

