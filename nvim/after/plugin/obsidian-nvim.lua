require("obsidian").setup({
    workspaces = {
        {
            name = "MasterVault",
            path = "~/Documents/MasterVault"
        },
        {
            name = "Sem-04",
            path = "~/Documents/MasterVault/Sem-04"
        },
        {
            name = "Sem-03",
            path = "~/Documents/MasterVault/Sem-03"
        },
        {
            name = "Web-Dev",
            path = "~/Documents/MasterVault/Web_Dev"
        },
    },
    completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
    },
    wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_func("use_alias_only");
    end,
    preferred_link_style = "wiki",
    -- see below for full list of options 👇
})

