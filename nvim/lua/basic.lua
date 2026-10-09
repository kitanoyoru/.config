vim.opt.number = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.updatetime = 200

vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = "menuone,noselect"
vim.opt.history = 10000
vim.opt.startofline = true

vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

vim.opt.scrolloff = 3
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 3

vim.opt.wrap = false
vim.opt.eol = false
vim.opt.showbreak = "↪"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.formatoptions = "qnj1"
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
