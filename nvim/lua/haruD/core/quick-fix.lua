local function toggle_qf()
    local winid = vim.fn.getqflist({ winid = 1 }).winid
    if winid ~= 0 then
        vim.cmd.cclose()
    else
        vim.cmd.copen()
    end
end



vim.keymap.set("n", "<leader>c", toggle_qf, { desc = "Toggle Quickfix Window" });
