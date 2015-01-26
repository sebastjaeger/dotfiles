"""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vitalk/vim-simple-todo'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bruno-/vim-husk'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'duff/vim-scratch'
call vundle#end()


"""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""
filetype plugin indent on         " Enable filetype-specific features
syntax on                         " Syntax highlighting
set visualbell                    " Use visual bell instead of beeping
set noerrorbells
set hidden                        " Allow to change buffers without saving them
set mouse=ar                      " Use mouse
set virtualedit=all               " Edit anywhere
set backspace=indent,eol,start    " Allow backspacing over everything in insert
                                  " mode
set wildmenu                      " Enable wildmenu for tab-completion
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*~,*.swp,*.pyc,*.so,*.pkl,*.npy,*.pdf

set history=1000
set undolevels=1000

set showmatch                     " Show matching brackets
set splitright                    " New window should open on the right
set nojoinspaces                  " Only one space between joined lines
set title

set whichwrap+=<,>,[,],h,l   " Allow specified keys that move the cursor
                             " left/right to move to the previous/next line
                             " when the cursor is on the first/last character
                             " in the line. b (backspace), s (space) and the
                             " arrows

silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
silent execute '!mkdir -p ~/.vim_swaps'
set dir=~/.vim_swaps//

silent execute '!mkdir -p ~/.vim_undos'
set undodir=~/.vim_undos//
set undofile
set undoreload=10000        " number of lines to save for undo

set tags=tags;$HOME
set nu

set autochdir                 " Working directory where active buffer is located
set encoding=utf-8


"""""""""""""""""""""""""""""""
" Looks
"""""""""""""""""""""""""""""""
set cursorline

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
endif

set background=dark
colorscheme solarized
set t_Co=256


"""""""""""""""""""""""""""""""
" Tab and indent
"""""""""""""""""""""""""""""""
set expandtab                  " Insert spaces by default
set tabstop=4                  " Number of columns a tabs accounts for
set softtabstop=4              " Tab and indent depth
set shiftwidth=4               " Number of columns that text is indented with
                               " the reindent " operations
set smarttab                   " Use shiftwidth instead of tabstop at start
                               " of line (?)
set autoindent


"""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""
set incsearch                " Enable incremental search
set ignorecase               " Case-insensitive search
set smartcase                " Unless there are uppercase letters
set hls                      " Enable search highlighting


"""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""
" Get rid of Ex mode
map Q <Nop>

let mapleader=","

" j and k jump between lines on the screen
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Same for arrows
nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

noremap Y y$
noremap <Backspace> X
noremap <CR> i<CR><Esc>
noremap <S-Enter> mzO<Esc>`z
noremap <C-Enter> mzo<Esc>`z
noremap <Space> i <Esc>l

"noremap ,, :%s:::g<Left><Left><Left>

vnoremap > >gv
vnoremap < <gv

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"Keep indentation when in paste mode
set pastetoggle=<F2>

map <silent> <F9> :nohls<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""
cabbr Q q
cabbr Q! q!
cabbr Qa qa
cabbr QA qa
cabbr Qa! qa!
cabbr QA! qa!
cabbr Wa wa
cabbr WA wa
cabbr Wqa wqa
cabbr W w
cabbr X x
cabbr Xa xa
cabbr XA xa


"""""""""""""""""""""""""""
" Other stuff
"""""""""""""""""""""""""""
" Settings for Makefiles
if has('autocmd')
    autocmd BufEnter ?akefile* set noet ts=8 sts=8 sw=8
endif

" Close preview window when completion finished
" Does not work with Command Line window (q:)
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CompleteDone * pclose

" Open md files in markdown mode
autocmd BufEnter *.md set filetype=markdown

set colorcolumn=95


"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""
" NERD tree
let g:NERDTreeChDirMode=2
map <silent> <F10> :NERDTreeToggle<CR>
map <silent> <S-F10> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.so$', '\.sw.$', '\.pyc$', '\.png$', '\.pdf$', '\.pkl$', '\.npy$']

" Tagbar
nmap <silent> <F11> :TagbarToggle<CR>

" Tabularize
map <leader>= :Tabularize /^[^=]*\zs<CR>

"" Omni complete
"set omnifunc=syntaxcomplete#Complete
"if has('gui_running')
    "highlight Pmenu guibg=brown gui=bold
"else
    "highlight Pmenu ctermbg=238 gui=bold
"endif

" Vim-trailing-whitespace
map <silent> <F12> :FixWhitespace<CR>

" CtrlP
"nnoremap <A-t> :CtrlP<CR>
let g:ctrlp_map='<A-t>'
let g:ctrlp_cmd='CtrlPMixed'

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#whitespace#enabled=1
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
set laststatus=2
set noshowmode

let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9

" Ultisnips
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
