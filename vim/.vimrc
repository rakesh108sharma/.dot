set nomodeline          " vim reads the modeline to execute commands for the current file
set modelines=0         " how many lines to check in top/bottom; 0=off
set nocompatible        " do not preserve compatibility with vi
set modifiable          " buffers can be modified
set encoding=utf-8      " default encoding
set history=500
set autoread            " detects if a file has been modified externally
set spelllang=en,de     " check spelling
set spellsuggest=10     " spell checker: number of suggestions
set updatetime=3000     " wait #milliseconds before saving swap
set undolevels=200  

filetype plugin on      " load syntax for different file types
filetype indent on      " load indent for different file types
set showcmd             " show command in last line of screen
set hidden              " hide buffers
set ruler

set ignorecase
set smartcase           " ignore case if search contains majuscules
set hlsearch            " highlight all matches of search
set incsearch           " enable incremental search
set expandtab           " transform tab into spaces
set smarttab
set shiftwidth=4
set tabstop=4
set ai                  "auto indent
set si                  "smart indent
set textwidth=80        " hard wrap at this column
set wrap                "wrap lines
set magic               " for regular expressions turn magic on
set showmatch
set mat=2
set noerrorbells
set visualbell
syntax enable
set wildmenu            " enable tab completion with suggestions
set wildmode=list:longest,full   

set relativenumber
" sets numbering in the left margin
" normal numbering when in insert mode (for writing)
" relative numbering when in normal mode (for editing)
augroup number
    autocmd!
    autocmd InsertEnter * set norelativenumber number
    autocmd InsertLeave * set relativenumber
augroup end


" enable 256 colors palette in gnome terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
	colorscheme desert
catch
endtry

set background=dark

" set extra GUI options
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" find your cursor with highlight / grey dark-light 232-255
set cursorline
set cursorcolumn
highlight Cursorline ctermbg=238 cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=238 cterm=bold guibg=#2b2b2b

" Key Maps
nnoremap ää :
nnoremap <leader><leader> :
inoremap ää <ESC>
vnoremap ää <ESC>
inoremap äää <ESC>:
let mapleader = " "
 
nnoremap <leader>q :q<CR>   " normal mode quit
nnoremap <leader>w :w<CR>
inoremap äw <ESC>:w<CR>    " insert mode write 
inoremap äq <ESC>:wq<CR>  " insert mode write & quit 

" fast editing AND reloading of vimrc configs
map <leader>e :e! ~/.vimrc<CR>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

cno <leader>h e ~/
cno <leader>. e ./<CR>
cno <leader>c e <C-\>eCurrentFileDir("e")<CR>

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" undotree
nnoremap <leader>u :UndotreeShow<CR>:wincmd w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'tomasr/molokai'
    Plug 'vimwiki/vimwiki'
    Plug 'ptzz/lf.vim'
    Plug 'junegunn/goyo.vim'
    "Plug 'valloric/youcompleteme'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'dense-analysis/ale'
call plug#end()


let g:vimwiki_list = [
            \{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}, 
            \{'path': '~/vimwiki/python/', 'syntax': 'markdown', 'ext': '.md'},
            \{'path': '~/vimwiki/linux/', 'syntax': 'markdown', 'ext': '.md'},
            \]

let g:ale_linters = { 'python': ['flake8']}
let g:ale_fixers = { 'python': ['black']}
let g:ale_fix_on_save = 1

" BUFFERS (Tabs)
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>bo :enew<cr>

" Move to the next buffer
nmap <leader>bn :bnext<CR>

" Move to the previous buffer
nmap <leader>bp :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELPER functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

