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
Plugin 'Valloric/YouCompleteMe'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bruno-/vim-husk'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'duff/vim-scratch'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'luochen1990/rainbow'
"Plugin 'klen/python-mode'
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

" Cannot ignore .git here. If we do, fugitive does not work properly anymore
set wildignore+=*.o,*.obj,*~,*.swp,*.pyc,*.so,*.pkl,*.npy,*.pdf

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

silent execute '!mkdir -p ~/.vim-data/backups'
set backupdir=~/.vim-data/backups//

silent execute '!mkdir -p ~/.vim-data/swaps'
set dir=~/.vim-data/swaps//

silent execute '!mkdir -p ~/.vim-data/undos'
set undodir=~/.vim-data/undos//
set undofile
set undoreload=10000        " number of lines to save for undo

set tags=tags;$HOME

set autochdir               " Working directory where active buffer is located
set encoding=utf-8


"""""""""""""""""""""""""""""""
" Looks
"""""""""""""""""""""""""""""""
set cursorline
set number

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
endif

set background=dark
colorscheme solarized
set t_Co=256

if has("gui_macvim")
    set guifont=Menlo:h13
else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
endif


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
set hlsearch                 " Enable search highlighting


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

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

noremap Y y$
noremap <CR> i<CR><Esc>
noremap <S-Enter> mzO<Esc>`z
noremap <C-Enter> mzo<Esc>`z
noremap <Space> i <Esc>l

"noremap <leader>, :%s:::g<Left><Left><Left>

vnoremap > >gv
vnoremap < <gv

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"Keep indentation when in paste mode
set pastetoggle=<F2>

map <silent> <F9> :nohls<CR>

nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

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

" Salt files
autocmd BufRead,BufNewFile *.sls setlocal filetype=yaml

set colorcolumn=95


"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""
" NERD tree
let g:NERDTreeChDirMode=2
map <silent> <F10> :NERDTreeToggle<CR>
map <silent> <S-F10> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.so$', '\.sw.$', '\.pyc$', '\.png$', '\.pdf$', '\.pkl$', '\.npy$']

" Vim-trailing-whitespace
map <silent> <F12> :FixWhitespace<CR>

" CtrlP
"let g:ctrlp_cmd='CtrlPMixed'
"let g:ctrlp_map='<c-p>'
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden=1
let g:ctrlp_by_filename=0
let g:ctrlp_match_window='max:20'
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>e :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPBufTagAll<CR>

" Airline
"let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tagbar#enabled=1
"let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_left_sep=''   " This looks decent if powerline fonts are not used
let g:airline_right_sep=''

set laststatus=2
set noshowmode

"let g:airline#extensions#tabline#buffer_idx_mode=1
"nmap <A-1> <Plug>AirlineSelectTab1
"nmap <A-2> <Plug>AirlineSelectTab2
"nmap <A-3> <Plug>AirlineSelectTab3
"nmap <A-4> <Plug>AirlineSelectTab4
"nmap <A-5> <Plug>AirlineSelectTab5
"nmap <A-6> <Plug>AirlineSelectTab6
"nmap <A-7> <Plug>AirlineSelectTab7
"nmap <A-8> <Plug>AirlineSelectTab8
"nmap <A-9> <Plug>AirlineSelectTab9

" Ultisnips
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Easytags
silent execute '!mkdir -p ~/.vim-data'
let g:easytags_file='~/.vim-data/tags'
let g:easytags_async=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Rainbow Parentheses
let g:rainbow_active=1
