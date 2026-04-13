if vim.g.vscode then
  -- VSCode Neovim
  require "vs_code.vscode_keymaps"
else
    require("haruD")
    vim.cmd('source $HOME/.config/nvim/.vimrc')
    -- vim.schedule(function()
    --     require("nvim-tree.api").tree.close()
    --     vim.cmd("Explore")
    -- end)
end
