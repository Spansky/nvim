vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>pv", ":Vex<CR>")
vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<leader><CR>e", ":e ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<C-p>", ":GFiles<CR>")
vim.keymap.set("n", "<leader>pf", ":Files<CR>")
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- toggle relative line numbers
vim.keymap.set("n", "<leader>tn", ":set rnu!<CR>")

-- Copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- shift + k/j to move lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
