require('rose-pine').setup({
    disable_background = true
})

require('tokyonight').setup({
    style = "moon",
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent"
    }
})

require('gruvbox').setup({
    transparent_mode = true
})


function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
