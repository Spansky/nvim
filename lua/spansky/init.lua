require("spansky.set")
require("spansky.remap")
-- Install Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
    {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- All my plugins
require("lazy").setup({ -- suggested in https://github.com/VonHeikemen/lsp-zero.nvim 
{'williamboman/mason.nvim'},
{'williamboman/mason-lspconfig.nvim'},
{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
-- Neovim Navigation should be similar to Tmux
{"christoomey/vim-tmux-navigator"}, -- styling
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
-- Git support
{"tpope/vim-fugitive"},
{"github/copilot.vim"},
{"nvim-treesitter/nvim-treesitter",
build = ":TSUpdate",
config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "typescript",
            "javascript",
            "html",
            "css",
            "bash",
            "json",
            "yaml",
            "toml",
            "python",
            "rust",
        },
        highlight = {
            enable = true,
            disable = {},
        },
    })
end
    }, 
},
opts)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>u/<C-r><C-w>/gI<Left><Left><Left>]])
vim.opt.signcolumn = "yes"
vim.opt.incsearch = true

-- as seen in https://shapeshed.com/vim-statuslines/
local function statusline()
    local set_color_1 = "%#PmenuSel#"
    local branch = "%{FugitiveStatusline()}"
    -- local branch = "Master"
    local set_color_2 = "%#LineNr#"
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
    local fileformat = " [%{&fileformat}]"
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format("%s %s %s%s%s%s%s%s%s%s%s", set_color_1, branch, set_color_2, file_name, modified, align_right,
    filetype, fileencoding, fileformat, percentage, linecol)
end

vim.opt.statusline = statusline()

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {lsp_zero.default_setup}
})
-- %{FugitiveStatusline()}
vim.opt.laststatus = 2
-- vim.opt.statusline = "%f %m %{FugitiveStatusline()} Hello"
