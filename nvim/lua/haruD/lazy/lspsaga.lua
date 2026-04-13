return {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                border = 'rounded',
                devicon = true,
                title = true,
                expand = '',
                collapse = '',
                code_action = '💡',
                actionfix = ' ',
                lines = { '┗', '┣', '┃', '━', '┏' },
                kind = {},
                imp_sign = '󰳛 ',
            },
            hover = {
                max_width = 0.6,
                max_height = 0.8,
                open_link = 'gx',
                open_cmd = '!open',
            },
            diagnostic = {
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                max_width = 0.7,
                max_height = 0.6,
                text_hl_follow = true,
                border_follow = true,
            },
            code_action = {
                num_shortcut = true,
                show_server_name = true,
                extend_gitsigns = false,
                keys = {
                    quit = 'q',
                    exec = '<CR>',
                },
            },
            lightbulb = {
                enable = true,
                sign = true,
                virtual_text = false,
            },
            symbol_in_winbar = {
                enable = false,
            },
            outline = {
                win_position = 'right',
                win_width = 30,
                auto_preview = true,
                detail = true,
                auto_close = true,
                close_after_jump = false,
                keys = {
                    toggle_or_jump = '<CR>',
                    quit = 'q',
                },
            },
        })
    end,
}
