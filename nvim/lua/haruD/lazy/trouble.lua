return {
    {
        "folke/trouble.nvim",
        tag = 'v2.10.0',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local trouble = require("trouble")
            trouble.setup({
                icons = true,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                signs = {
                    -- icons / text used for a diagnostic
                    -- don't really like icons, but still saved here for future
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "",
                },
                -- false to use the signs defined above
                use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
            })

            vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>TroubleToggle <cr>",
                { silent = true, noremap = true }
            )

            -- jump to the next item, skipping the groups
            vim.keymap.set({ "n", "v" }, "[t", function()
                    trouble.open()
                    trouble.next({ skip_groups = true, jump = true })
                end,
                { silent = true, noremap = true }
            )

            -- jump to the previous item, skipping the groups
            vim.keymap.set({ "n", "v" }, "]t", function()
                    trouble.open()
                    trouble.previous({ skip_groups = true, jump = true })
                end,
                { silent = true, noremap = true }
            )
        end
    },
}
