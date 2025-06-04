if vim.g.vscode then
  -- VSCode Neovim
  require "vs_code.vscode_keymaps"
else
    require("haruD")
    vim.cmd('source $HOME/.config/nvim/.vimrc')
end
