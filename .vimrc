syntax on 
set number
set nocompatible              " be iMproved, required
set mouse=a " To scroll and clic with mose. Note that selecting only in visual mode
set clipboard=unnamed " To copy to clipboard using +y
set hlsearch "highlight search
set ignorecase
set incsearch

filetype off                  " required
set ft=javascript
let mapleader="Caps_Lock"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy file search with Cntrl+P
Plugin 'airblade/vim-gitgutter' " Git integration
Plugin 'morhetz/gruvbox' " Theme
Plugin 'bling/vim-airline' "Status bar
Plugin 'terryma/vim-multiple-cursors' " multiple cursors
Plugin 'tpope/vim-surround' " Surround selected text with the given letter
Plugin 'scrooloose/nerdtree' " Tree Navigation
Plugin 'eugen0329/vim-esearch' " Search file and directories
Plugin 'ervandew/supertab' " allow autocompletion

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
colorscheme gruvbox " Colorscheme for gruvbox
setlocal iskeyword+=- " set minus as keyword
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Highlight current word with F8
:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

" Resize windows
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map < <C-W><
  map > <C-W>>
endif

set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

map <C-o> :NERDTreeToggle<CR>
map <C-b> :CtrlPBuffer<CR>
"autocmd VimEnter * NERDTree "Open by default NERDTree
nmap ,n :NERDTreeFind<CR>
let g:ctrlp_working_path_mode = 'wra'
set backspace=indent,eol,start " allows backspace to work

" transform tabs as spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
