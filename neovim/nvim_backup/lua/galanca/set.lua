-- These options can be unset
--set number                  " add line numbers
vim.opt.nu = true
-- No se como trabajar con relativo
vim.opt.relativenumber = false

--set ignorecase              " case insensitive matching
-- Lower-case characters match upper-case characters
vim.opt.ignorecase = true
-- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.smartcase = true

--set hlsearch                " highlight search results
-- Turn off: vim.keymap.set("n", "<leader>nh", ":nohl<CR>") 
vim.opt.hlsearch = true

-- Highlight the current line
vim.opt.cursorline = false 

-- Show matches while typing (as in modern browsers)
vim.opt.incsearch = true

-- Python settings
--set tabstop=4               " 4-space tab indent width, prefered coding style for Python
--set shiftwidth=4            " allows to use the < and > keys from visual mode to indent
--set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
--set expandtab               " Insert spaces instead of TAB when the TAB key is pressed
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

--set cc=80                   " set an 80 column border for good coding style
vim.opt.colorcolumn = "80"

-- Estas 3 opciones tengo que traducir a lua
-- Show matching brackets (typing and on cursor-over)
vim.opt.showmatch = true 
--set mouse=v                 " middle-click paste with mouse
--set wildmode=longest,list   " get bash-like tab completions

-- Text Wrapping
vim.opt.wrap = false

-- Enable 24-bit RGB colors
vim.opt.termguicolors = true
-- show sign column so that text doesn't shift
vim.opt.signcolumn = "yes"

-- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus") 
--vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.opt.swapfile = false
vim.opt.backup = false

-- De aqui en adelante no entiendo
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

--vim.opt.scrolloff = 10
--vim.opt.isfname:append("@-@")
--vim.opt.updatetime = 50

--vim.g.vimwiki_global_ext = false
