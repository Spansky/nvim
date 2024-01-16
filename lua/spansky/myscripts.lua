local diagnostic_float_open = false

local function toggle_diagnostic_float()
    if diagnostic_float_open then
        vim.diagnostic.hide()
        diagnostic_float_open = false
    else
        vim.diagnostic.open_float()
        diagnostic_float_open = true
    end
end

return {
    toggle_diagnostic_float = toggle_diagnostic_float
}
