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

" Key Maps
nnoremap ,, :
inoremap ,, <ESC>
vnoremap ,, <ESC>
let mapleader = ","
 
nnoremap <leader>q :q<CR>   " normal mode quit

inoremap ,,w <ESC>:w<CR>    " insert mode write 
inoremap ,,ww <ESC>:wq<CR>  " insert mode write & quit 

" fast editing AND reloading of vimrc configs
map <leader>e :e! ~/.vimrc<CR>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

cno <leader>h e ~/
cno <leader>. e ./
cno <leader>c e <C-\>eCurrentFileDir("e")<CR>

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

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

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELPER functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

