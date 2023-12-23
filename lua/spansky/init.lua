print("Test")

-- Install Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- All my plugins
require("lazy").setup({
    -- suggested in https://github.com/VonHeikemen/lsp-zero.nvim 
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- styling
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Git support
    { "tpope/vim-fugitive" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "github/copilot.vim" }
}, opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>u/<C-r><C-w>/gI<Left><Left><Left>]])
vim.opt.signcolumn = "yes"
vim.opt.incsearch = true

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
-- %{FugitiveStatusline()}
vim.opt.statusline = "%f %m %{FugitiveStatusline()}"
