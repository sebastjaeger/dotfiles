"""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""
set nocompatible                  " Disable vi compatibility mode


"""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bufexplorer.zip'
Bundle 'ervandew/supertab'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'minibufexpl.vim'
Bundle 'molokai'
Bundle 'desert256.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/powerline'


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
set wildignore=*.o,*.obj,*~,*.swp,*.pyc,*.so

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
set directory=~/.vim_backups//

set tags=tags;$HOME
set nu


"""""""""""""""""""""""""""""""
" Looks
"""""""""""""""""""""""""""""""
set cursorline

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
endif
colorscheme molokai


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
"set smartindent
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
let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" j and k are supposed to jump between lines on the screen
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

noremap ,, :%s:::g<Left><Left><Left>

vnoremap > >gv
vnoremap < <gv

"Keep indentation when in paste mode
set pastetoggle=<F2>

if v:version >= 700
    set list listchars=tab:»·,trail:·
else
    set list listchars=tab:>-,trail:-
endif
set nolist
map <silent> <F12> :set list!<CR>

map <silent> <F9> :nohls<CR>

if has('autocmd')
    autocmd FileType python map <leader>x :!python %<CR>
endif

"function! ToggleCw()
    "let g:cw_on = exists('g:cw_on') ? !g:cw_on : 0
    "if g:cw_on
        "cclose
    "else
        "copen
    "endif
"endfunction
"map <silent> <F12> :call ToggleCw()<CR>
"map <silent> <leader>c :silent! !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .<CR>
"function! UpdateTags()
  "execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  "echohl StatusLine | echo "Tags updated" | echohl None
"endfunction
"nnoremap <leader>c :call UpdateTags()
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
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""
" MiniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" NERD tree
map <silent> <F10> :NERDTreeToggle<CR>

" Tagbar
nmap <silent> <F11> :TagbarToggle<CR>

" Omni complete
set omnifunc=syntaxcomplete#Complete
if has('gui_running')
    highlight Pmenu guibg=brown gui=bold
else
    highlight Pmenu ctermbg=238 gui=bold
endif

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" FuzzyFinder
map ,f :FufFile **/<CR>

" Powerline 
set rtp+=.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode 
set encoding=utf-8
"let g:Powerline_symbols = 'fancy'
