-- install without yarn or npm
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
        vim.keymap.set({ "n", "v" }, "<leader>mt", vim.cmd.MarkdownPreviewToggle)
    end,
    ft = { "markdown" },
}
