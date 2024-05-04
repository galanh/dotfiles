" La Organizacion es en 3 partes:
"   - Comandos basicos de vim
"   - La seccion de plugin
"   - Comandos asociados a plugins:
"       - Comentar lo todo los asociado a plugin que no usas
"
" -------------------------------------
" Set compatibility to Vim only.
" You don't need set nocompatible - vimrc checklist 
"set nocompatible

" enable syntax highlighting
"syntax enable
" You can automatically enable syntax coloring and automatic indentation
syntax on
" for detecting certain file types
filetype on

" All your searches will be case insensitive
set ignorecase
" Your search will be case sensitive if it contains an uppercase letter
set smartcase

" -------------------------------------
filetype plugin indent on
filetype plugin on

" -------------------------------------
" show line numbers
set number
" set tabs to have 4 spaces
set ts=4
set tabstop=4
" indent when moving to the next line while writing code
"set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" -------------------------------------
" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch
"
" -------------------------------------
" clipboard
" copiar o pegar texto desde vim hacia otros lugares
set clipboard^=unnamed,unnamedplus
"
" -------------------------------------
" Highlight all search pattern matches
set hlsearch
" Clear last search highlighting
map <Space> :noh<cr>

" -------------------------------------
" enable all Python syntax highlighting features
let python_highlight_all = 1

" -------------------------------------
" turned on xml syntax 
" I trying to make syntax indent to work
" Use zR to open all folds
"let g:xml_syntax_folding = 1
"set foldmethod=syntax

" -------------------------------------
" horizontal mark settings
set colorcolumn=110

" -------------------------------------
" leader key
let mapleader='\'

" -------------------------------------
" leader key rember
" open the index.md page <leader>ww
" to comment out a single line, use <leader>cc

" -------------------------------------
" toggle the spell checker only in normal mode
nnoremap <leader>s :set invspell<CR>
" Ortografia en español
nnoremap <leader>se :set spell spelllang=es<CR>

" -------------------------------------                                             
"  insert a date+time only in insert mode                                           
"  <C-R>= is used to insert the result of an expression at the cursor               
"  2020-07-19T14:37                                                                 
inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>  

" -------------------------------------                                             
"  strip all trailing whitespace in the current file
nnoremap <leader>b :%s/ \+$//<cr>

" -------------------------------------
"  This autocommand jumps to the last known position in a file
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif

" -------------------------------------                                                                      
"  Lua syntax highlighting
let g:vimsyn_embed = 'l'

" -------------------------------------
"  create HTML Template Automatically
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel


  " Plugin Section
" pathogen plug-in manager
"execute pathogen#infect()
"
" vin-plug manager
call plug#begin()

" fzf
" Post-update hook: run a shell command after installing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nice statusline at the bottom of each vim window
Plug 'vim-airline/vim-airline'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Markdown notes
Plug 'vimwiki/vimwiki'

" plugin for LaTeX files 
Plug 'lervag/vimtex'

" easy way to insert emojis
Plug 'yazgoo/unicodemoji'
" 
" Livedown, an NPM-based local web server with auto reload that renders Markdown
Plug  'shime/vim-livedown'

call plug#end()


" -------------------------------------
" download: railscasts.vim and copy to ~/.vim/colors/railscasts.vim
" colorschemes also changes the background
"colorscheme railscasts
colorscheme jellybeans

" -------------------------------------
" quickly open up my vimwiki file in a vertically split window
" so I can add new things to it on the fly
nnoremap <leader>vw <C-w><C-v><C-l>:e ~/vimwiki/index.md<cr>

" -------------------------------------
" vimwiki when clone is put in runtime path
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

 " -------------------------------------
 " vintex
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
 
" Buscar un emoji por nombre
nmap <leader>u :Unicodemoji<CR>

" Livedown, an NPM-based local web server with auto reload that renders Markdown
nmap gm :LivedownToggle<CR>
" should the browser window pop-up upon previewing
let g:livedown_open = 1



"" -------------------------------------
"" Forward Searching from vim to zathura
"function! SyncTexForward()
"let linenumber=line(".")
"let colnumber=col(".")
"let filename=bufname("%")
"let filenamePDF=filename[:-4]."pdf"
"let execstr="!zathura --synctex-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
"exec execstr
"endfunction
"
"nmap <C-enter> :call SyncTexForward()
"" ctrl-enter in vim jumps to corresponding position in PDF.
"
"" -------------------------------------
"" vim-markdown-preview plugging
""
"let vim_markdown_preview_toggle=1
"let vim_markdown_preview_hotkey='<C-m>'
"let vim_markdown_preview_pandoc=1
"
"" -------------------------------------
"" markdown to HTML using pandoc
"nnoremap <leader>r :!pandoc % --to=html5 > %.html
"
"" -------------------------------------
"" ctags
"" The semicolon allows Vim to recursively move up a file tree 
"" to look for a tags file in case it doesn’t find one
"set tags+=./tags;,tags
"" -------------------------------------
""
""


