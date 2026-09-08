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

" In your .vimrc:
filetype plugin indent on
syntax on
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
" disable beeping and flashing
set noerrorbells visualbell t_vb=

" -------------------------------------
" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch
"
" -------------------------------------
" clipboard (el comando que funciona)
" copiar o pegar texto desde vim hacia otros lugares
"set clipboard=unnamed
set clipboard=unnamedplus
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
" Insertar linea blanca sin contexto:
nnoremap ]<Space> :call append(line('.'), '')<CR>
nnoremap [<Space> :call append(line('.') - 1, '')<CR>

" -------------------------------------
" Saca un pdf del archivo actual
nnoremap <Leader>pdf :hardcopy > %.ps <bar> !ps2pdf %.ps && rm %.ps<CR>

" -------------------------------------                                             
"  insert a date+time only in insert mode                                           
"  <C-R>= is used to insert the result of an expression at the cursor               
"  2020-07-19T14:37                                                                 
inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>  

" -------------------------------------
" ¿Cómo puedo ver la fecha de modificación de un archivo que estoy editando desde Vim y Neovim?
" No usar d porque colisiona
nnoremap  fe :echo strftime('%c', getftime(expand('%')))<CR>

" -------------------------------------                                             
"  strip all trailing whitespace in the current file
nnoremap <leader>b :%s/ \+$//<cr>

" -------------------------------------
"  This autocommand jumps to the last known position in a file
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif


" Atajo para renderizar archivos R Markdown a PDF usando rmarkdown en segundo plano
" Corrección: Usamos 'markdown' como FileType y '%:p' para pasar la ruta absoluta exacta
"autocmd FileType markdown nnoremap <leader>r :w<CR>:!Rscript -e "rmarkdown::render('%')"<CR><CR>
" Compila con rmarkdown y abre Zathura en segundo plano automáticamente
autocmd FileType markdown nnoremap <leader>r :w<CR>:!Rscript -e "rmarkdown::render('%:p')" && zathura '%:p:r'.pdf &<CR><CR>

" -------------------------------------
"  The error missing separator is the most famous error in Makefiles
autocmd FileType make setlocal noexpandtab

" -------------------------------------                                                                      
"  Lua syntax highlighting
let g:vimsyn_embed = 'l'

" -------------------------------------
"  create HTML Template Automatically
"autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel
" -------------------------------------
"  Llama varios tipos platillas - Se activa cuando se crea un nuevo búfer vacío
augroup template_skeletons
    autocmd BufNewFile *.py   0read ~/.vim/skeleton/python.py | normal! G$
    autocmd BufNewFile *.r    0read ~/.vim/skeleton/R.r       | normal! G$
    autocmd BufNewFile *.html 0read ~/.vim/skeleton/html.html | normal! G$
    " ... add more as needed
augroup END

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

" Trabajar con archivos .csv 
Plug 'chrisbra/csv.vim'

" easy way to insert emojis
Plug 'yazgoo/unicodemoji'
" 
" Livedown, an NPM-based local web server with auto reload that renders Markdown
Plug  'shime/vim-livedown'

" Soporte a R
Plug 'jalvesaq/Nvim-R'

" commentary.vim de by Tim Pope
Plug 'tpope/vim-commentary'

" Installing Pyright in Vim is typically achieved using the coc.nvim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ¿Cuál es una buena combinación de colores en Vim usando CoC Pyright?:
Plug 'sainnhe/gruvbox-material'
"
" Add Tim Pope's vim-unimpaired plugin here:
Plug 'tpope/vim-unimpaired'

call plug#end()


" -------------------------------------
" Essential configuration for the theme
set background=dark
let g:gruvbox_material_background = 'medium' " Options: 'hard', 'medium', 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

" download: railscasts.vim and copy to ~/.vim/colors/railscasts.vim
" colorschemes also changes the background
"colorscheme railscasts
"colorscheme jellybeans
" colorscheme 256-jungle

" ------Resaltar el cursor -------------------------------
hi CursorLine cterm=NONE ctermbg=black ctermfg=yellow

" ------Resaltar una linea permanentemente no funciona-------------------------------
" Define the highlight group (add this to your .vimrc)
" highlight HiLine ctermfg=white ctermbg=darkgrey

" Define a command to highlight a line range (add this to your .vimrc)
" command! -range -nargs=1 HiLine call matchaddpos(<f-args>, range(<line1>,<line2>))
" No funciona dice: Argument required

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
 
" Buscar un emoji por nombre con yazgoo/unicodemoji
nmap <leader>u :Unicodemoji<CR>

" Livedown, an NPM-based local web server with auto reload that renders Markdown
nmap gm :LivedownToggle<CR>
" should the browser window pop-up upon previewing
let g:livedown_open = 1


" Custom search function: first exact case, then ignore case if no match
function! SmartCaseFallbackSearch()
    " Prompt the user for the search pattern
    let l:pattern = input("Busqueda (primero M y m, luego ignorar M y m): ")
    if empty(l:pattern)
        return
    endif

    " Store current search options to restore them later
    let l:old_ic = &ignorecase
    let l:old_smc = &smartcase
    let l:old_hls = &hlsearch
    set hlsearch " Ensure highlighting is on for search results

    " --- Step 1: Attempt a case-sensitive search for the exact pattern ---
    " 'w' flag: wrap around the file if the end is reached
    " 'c' flag: force case-sensitive search for THIS call, overriding global 'ignorecase'/'smartcase'
    let l:found_exact = search(l:pattern, 'wc')

    if l:found_exact == 0
        " --- Step 2: If no case-sensitive match, try a case-insensitive search ---
        " 'w' flag: wrap around the file
        " 'i' flag: force case-insensitive search for THIS call
        let l:found_insensitive = search(l:pattern, 'wi')

        if l:found_insensitive == 0
            echo "No matches found for '" . l:pattern . "'."
            " If no match at all, you might want to turn off highlight (optional)
            " set nohlsearch
        else
            echo "Found (case-insensitive) for '" . l:pattern . "'."
        endif
    else
        echo "Found (case-sensitive) for '" . l:pattern . "'."
    endif

    " Restore original 'ignorecase' and 'smartcase' settings
    " This ensures that your default '/' or '?' searches behave as per your global settings
    let &ignorecase = l:old_ic
    let &smartcase = l:old_smc

    " It's generally good practice to leave 'hlsearch' on after a search,
    " allowing the user to explicitly turn it off with :nohlsearch if desired.
    " You could restore its previous state if you prefer:
    " let &hlsearch = l:old_hls
endfunction

" Map this custom search function to a convenient key:
" <leader> is often '\' by default, or you might have mapped it to something else (e.g., ',' or '<space>').
" <silent> prevents the command from being echoed on the command line.
nnoremap <silent> <leader>s :call SmartCaseFallbackSearch()<CR>

" You might also want to map <leader>n and <leader>N for navigating the *next* match
" using the custom search's case-sensitivity, though 'n' and 'N' usually work automatically.
" For clarity, if the custom search found a case-sensitive match, 'n' will find the next case-sensitive match.
" If it fell back to case-insensitive, 'n' will find the next case-insensitive match.



