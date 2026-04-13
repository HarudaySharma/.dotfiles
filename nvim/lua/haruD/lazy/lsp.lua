return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            version = "v1.32.0",
        },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local compare = cmp.config.compare
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        vim.lsp.config('angularls', {})
        -- require('lspconfig').angularls.setup {
        --     cmd = {
        --         "ngserver",
        --         "--stdio",
        --         "--tsProbeLocations",
        --         ".",    -- optional: current dir for project-level TS versions
        --         "--ngProbeLocations",
        --         "."     -- optional: current dir for Angular versions
        --     },
        --     on_new_config = function(new_config, new_root_dir)
        --         new_config.cmd = {
        --             "ngserver",
        --             "--stdio",
        --             "--tsProbeLocations",
        --             new_root_dir,
        --             "--ngProbeLocations",
        --             new_root_dir
        --         }
        --     end,
        -- }

        require("fidget").setup({})
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "eslint",
                "gopls",
                "html",
                -- "jdtls",
                -- "markdown_oxide",
                -- "markdownlint-cli2",
                -- "tsserver",
            },
            handlers = {

                function(server_name) -- default handler (optional)
                    vim.lsp.config(server_name, {
                        capabilities = capabilities
                    })
                end,

                zls = function()
                    vim.lsp.config('zls', {
                        root_markers = {".git", "build.zig", "zls.json"},
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    vim.lsp.config('lua_ls', {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    })
                end,

            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = "jupynium", priority = 1000 },  -- consider higher priority than LSP
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'path' },
                    { name = 'buffer' },
                })
            ,
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    compare.score,            -- Jupyter kernel completion shows prior to LSP
                    compare.recently_used,
                    compare.locality,
                    -- ...
                },
            },
        })
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            virtual_text = true,      -- show diagnostics as inline text
            signs = true,             -- show diagnostics as gutter signs
            underline = true,         -- underline the problematic text
            update_in_insert = false, -- don't update while typing (optional)
            -- severity_sort = true,     -- sort by severity
        })
    end
}
