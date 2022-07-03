return function()
    local attached_clients = {}
    local current_buf = vim.api.nvim_get_current_buf()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.attached_buffers[current_buf] then
            table.insert(attached_clients, client.name)
        end
    end
    if #attached_clients > 0 then
        return '  '..table.concat(attached_clients, ' ')
    else
        return ''
    end
end
