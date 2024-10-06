return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            toggler = { line = '<leader>lc', block = '<leader>bc' },
            opleader = { line = '<leader>lc', block = '<leader>bc' },
        })
    end
}
