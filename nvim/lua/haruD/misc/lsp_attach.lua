local augroup = vim.api.nvim_create_augroup

local haruDGroup = augroup('haruD', {})

local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})


autocmd({ "BufWritePre" }, {
    group = haruDGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = haruDGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
        vim.keymap.set("n", "<leader>vca", "<cmd>Lspsaga code_action<CR>", opts)
        vim.keymap.set("n", "<leader>vrr", "<cmd>Lspsaga finder<CR>", opts)
        vim.keymap.set("n", "<leader>vrn", "<cmd>Lspsaga rename<CR>", opts)
        vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
        vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    end
})
