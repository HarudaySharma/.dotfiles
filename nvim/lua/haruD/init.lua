require("haruD.remap")
require("haruD.set")
require("haruD.core")
require("haruD.lazy_init")
require("haruD.misc")

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

