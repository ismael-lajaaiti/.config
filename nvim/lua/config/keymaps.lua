-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local keymap = vim.keymap -- for consiceness

-- general keymaps
keymap.set("n", "<leader>cv", ":silent tab drop ~/.config/nvim<cr>")
keymap.set("n", "<leader>sov", ":source ~/.config/nvim/init.lua<cr>")

-- Sort: case sensitive (caps first).
keymap.set("v", "so", ":sort<cr>")
keymap.set("n", "sop", "vip:sort<cr>")

-- Sort: case insensitive.
keymap.set("v", "So", ":sort i<cr>")
keymap.set("n", "Sop", "vip:sort i<cr>")

-- Quit normal and visulal modes.
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "ui", "<ESC>")

keymap.set("n", "x", '"_x')

-- Move lines.
keymap.set("v", "K", ":m-2<CR>gv=gv")
keymap.set("v", "J", ":m'>+<CR>gv=gv")

-- Scroll page.
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<leader>nh", ":noh<cr>") -- clear researsh highlighting
