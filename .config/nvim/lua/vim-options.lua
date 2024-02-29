-- options

vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set backupdir=~/.cache/vim")
vim.cmd("set noswapfile")
vim.cmd("set showmatch")
vim.cmd("set ignorecase") -- ignore capital late on search
vim.cmd("set spell")
vim.cmd("set autoindent")
vim.cmd("set smartcase")
vim.cmd("set scrolloff=5")
vim.cmd("set undofile")
vim.cmd("set nowrap")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set iskeyword+=-") -- dash separated words as a word text object"

-- general keymap

local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>") -- jk to escape
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear highlight
keymap.set("n", "x", '"-x"') -- dont yank on x
