" init.vim
" James Cannon (james@jdcannon.design)
" Settings --{{{--
"   NeoVim Defaults --{{{--
"
"   set filetype plugin indent on
"   set autoindent
"   set autoread
"   set backspace=indent,eol,start
"   set backupdir=~/.local/share/nvim/backup
"   set belloff=all
"   set display=lastline
"   set format options=tcqj
"   set history=10000
"   set hlsearch
"   set incsearch
"   set nocompatible
"   set ruler
"   set wildmenu
"   --}}}--
set number
set ignorecase
set smartcase
set shiftwidth=2
set expandtab
set tabstop=2
set lazyredraw

let mapleader = ","
" --}}}--
" Mappings --{{{--

nnoremap \\ :Buffers<CR>
nnoremap \f :Files<CR>
nnoremap \a :Ack! 

nnoremap \gs :Gstatus<CR>
nnoremap \gc :Gcommit<CR>
nnoremap \gu :Gpush<CR>
nnoremap \gp :Gpull<CR>
nnoremap \gm :Gmerge<CR>

nnoremap <leader>ev :e! ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ex :e! ~/.Xresources<CR>
nnoremap <leader>ei :e! ~/.i3/config<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
noremap <leader>q :e ~/.scratch<CR>
nnoremap <leader>, :!

nnoremap << <$
nnoremap >> >$
nnoremap Y y$
map <silent> <leader><CR> :noh<CR>
inoremap kj <ESC>
inoremap jk <ESC>

:nnoremap mz ?--{{<CR> :nohl<CR> za

:onoremap ( i(
:onoremap n( :<c-u>normal! f(vi(<CR>
:onoremap l( :<C-U>normal! F)vi(<CR>

:onoremap { i{
:onoremap n{ :<c-u>normal! f{vi{<CR>
:onoremap l{ :<C-U>normal! F}vi{<CR>

:onoremap < i<
:onoremap n< :<c-u>normal! f<vi<<CR>
:onoremap l< :<C-U>normal! F>vi<<CR>

inoremap !1 ()<ESC>i
inoremap !2 []<ESC>i
inoremap !3 {}<ESC>i
inoremap !4 {<ESC>o}<ESC>O
inoremap !t <><ESC>i
inoremap !q ''<ESC>i
inoremap !e ""<ESC>i

nnoremap <C-J> mz:m+<CR>`z
nnoremap <C-K> mz:m-2<CR>`z
vnoremap <C-J> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <C-K> :m'<-2<CR>`>my`<mzgv`yo`z

nnoremap \x :cclose<CR>
"--}}}--
" Abbreviations --{{{--
iab xdate <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" --}}}--
" AutoCommands --{{{--
" --}}}--
" Config --{{{--

let g:ackprg = 'ag --nogroup --nocolor --column'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'deus'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '¶'
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))
" --}}}--
" Plugins --{{{--

call plug#begin('~/.local/share/nvim/plugged')

Plug('powerline/powerline')
Plug('raichoo/haskell-vim')
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-speeddating')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-vinegar')
Plug('mattn/calendar-vim')
Plug('mileszs/ack.vim')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('sheerun/vim-polyglot')
Plug('mattn/webapi-vim')
Plug('mattn/emmet-vim')
Plug('jceb/vim-orgmode')
Plug('raimondi/delimitmate')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug('junegunn/fzf.vim')

call plug#end()
" --}}}--
