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
vim.cmd("set conceallevel=2")
vim.cmd("set inccommand=split")
vim.cmd("set virtualedit=block")
vim.cmd("set isfname+=@-@")
vim.cmd("set hlsearch=false")

-- general keymap

local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>")             -- jk to escape
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear highlight
keymap.set("n", "x", '"-x"')               -- dont yank on x

keymap.set("x", "Q", ":norm @q<CR>")

-- stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move line up and down
keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- paste without yanking
keymap.set("v", "p", '"_dP')

-- Noice
keymap.set("n", "<leader>nn", ":NoiceDismiss<CR>", { noremap = true, silent = true })

-- gl for open links
keymap.set("n", "gl", ":sil !open <cWORD><cr>", { silent = true })

-- comment
keymap.set("n", "<leader>h", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

-- show yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})

-- Swap between last two buffers
keymap.set("n", "<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- save and quit
keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false })
keymap.set("n", "<leader>z", "<cmd>wqa<cr>", { silent = false })
keymap.set("n", "<leader>q", "<cmd>q!<cr>", { silent = false })

-- Press 'control s' for quick find/replace for the word under the cursor
keymap.set({ "n", "v" }, "<C-s>", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gIc<Left><Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)
