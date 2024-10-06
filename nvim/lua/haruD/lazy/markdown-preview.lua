-- install without yarn or npm
return {
}
--[[return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.keymap.set({ "n", "v" }, "<leader>mt", vim.cmd.MarkdownPreviewToggle)
    end
}]]
