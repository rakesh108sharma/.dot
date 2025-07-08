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
set lazyredraw          " redraw only when we need to


" no need for swap or backup since I use 'undodir'
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

filetype plugin on      " load syntax for different file types
filetype indent on      " load indent for different file types
set showcmd             " show command in last line of screen
set hidden              " hide buffers
set ruler
set mouse=a             " jumps to where the mouse-click is

set ignorecase
set smartcase           " ignore case if search contains majuscules
set hlsearch            " highlight all matches of search
set incsearch           " enable incremental search

set expandtab           " transform tab into spaces
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4       " number of spaces in tab when editing
set ai                  "auto indent
set si                  "smart indent

set textwidth=100       " hard wrap at this column
set wrap                " wrap lines
set magic               " for regular expressions turn magic on
set showmatch           " highlight matching [{()}]
set mat=2
set noerrorbells
set visualbell
syntax enable
set wildmenu            " enable tab completion with suggestions
set wildmode=longest,list,full   

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


" set extra GUI options
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" find your cursor with highlight / grey dark-light 232-255
highlight Cursorline ctermbg=238 cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=238 cterm=bold guibg=#2b2b2b
highlight ColorColumn ctermbg=233 
set cursorline
set cursorcolumn
set colorcolumn=80

" Key Maps
let mapleader = " "
nnoremap Q <nop>
nnoremap ää :
nnoremap <leader><leader> :
inoremap ää <ESC>
vnoremap ää <ESC>
inoremap äää <ESC>:
 
nnoremap <leader>q :q<CR>   " normal mode quit
nnoremap <leader>w :w<CR>   " normal mode write
nnoremap <leader>qq :q!<CR> " normal mode force quit
inoremap äw <ESC>:w<CR>  " insert mode write 
inoremap äq <ESC>:q<CR>     " insert mode quit 
inoremap äwq <ESC>:wq<CR>   " insert mode write & quit
inoremap äqq <ESC>:q!<CR>   " insert mode force quit

" insert a time stamp
nnoremap <leader>D "=strftime('%y%m%d%H%M')<CR>P
inoremap ääd <C-R>=strftime('%y%m%d%H%M')<CR>

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

" fix indenting visual block
vmap < <gv
vmap > >gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

"ale
let g:ale_completion_enabled = 1 
let g:ale_linters = { 'python': ['flake8']}
let g:ale_fixers = { 
            \ 'python': ['black'],
            \ 'sh': ['shfmt']
            \ }
let g:ale_fix_on_save = 1


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
"   Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox'
    Plug 'vimwiki/vimwiki'
    Plug 'itchyny/calendar.vim'
    Plug 'ptzz/lf.vim'
    Plug 'junegunn/goyo.vim'
"    Plug 'valloric/youcompleteme'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dense-analysis/ale'
    Plug 'voldikss/vim-floaterm'
"    Plug 'blindfs/vim-taskwarrior'
    Plug 'reedes/vim-pencil'
    Plug 'tpope/vim-fugitive'
"    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"colorscheme gruvbox
try
	colorscheme gruvbox
catch
endtry
set background=dark
"sets the opacity on
hi! Normal ctermbg=NONE guibg=NONE 

"ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 10
let g:ctrlp_clear_cache_on_exit = 0

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

" undotree
nnoremap <leader>u :UndotreeToggle<CR>:wincmd w<CR>

"floaterm
nnoremap <C-t> :FloatermNew --height=0.9 --width=0.8<CR>
nnoremap <C-f> :FloatermNew --height=0.9 --width=0.9 lf<CR>

"youcompleteme
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

"vimwiki
let g:vimwiki_list = [
            \{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}, 
            \{'path': '~/vimwiki/python/', 'syntax': 'markdown', 'ext': '.md'},
            \{'path': '~/vimwiki/linux/', 'syntax': 'markdown', 'ext': '.md'},
            \]

"hi VimwikiHeader1 guifg=#FF0000
"hi VimwikiHeader2 guifg=#00FF00
"hi VimwikiHeader3 guifg=#0000FF
"hi VimwikiHeader4 guifg=#FF00FF
"hi VimwikiHeader5 guifg=#00FFFF
"hi VimwikiHeader6 guifg=#FFFF00

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DIVERS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS (Tabs)
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>bo :enew<cr>

" Move to the next buffer
"  q
nmap <leader>bn :bnext<CR>

" Move to the previous buffer
nmap <leader>bp :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" VPM-MODE
"vim presentation mode
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
    nnoremap <buffer> <Right> :n<CR>
    nnoremap <buffer> <Left> :N<CR>

    if !exists('#goyo')
        Goyo
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELPER functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

highlight ColorColumn ctermbg=233 
