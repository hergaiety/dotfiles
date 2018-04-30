"install plugin manager - vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins
call plug#begin('~/.config/nvim/plugged')
" visual
Plug 'mhinz/vim-startify'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'airblade/vim-gitgutter'
" files/finding
Plug 'ap/vim-buftabline'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'wsdjeg/FlyGrep.vim'
" filetypes
Plug 'pangloss/vim-javascript'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json'
Plug 'Quramy/tsuquyomi'
Plug 'plasticboy/vim-markdown'
" editing
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
" tmux compatibility
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" vim-startify
let g:startify_custom_header = [
      \'   _  __             ___                 ',
      \'  / |/ /__ _    __  / _ \___ __    _____ ',
      \' /    / -_) |/|/ / / // / _ `/ |/|/ / _ \',
      \'/_/|_/\__/|__,__/ /____/\_,_/|__,__/_//_/',
      \ '',
\ ]
let g:startify_change_to_dir = 0

" space leader key
let mapleader=" "

" generic settings
set nomodeline
set encoding=utf8

" Stop word wrapping
set nowrap

" Adjust system undo levels
set undofile
set undodir=~/.local/share/nvim/undo
set undolevels=100

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Use search highlighting
set hlsearch

" Space above/beside cursor from screen edges
set scrolloff=3
set sidescrolloff=5

" tab, spacing config
set shiftwidth=2
set smarttab
set expandtab
set tabstop=2

" show invisibles
set list

" copy to global clipboard
set clipboard=unnamedplus

" colorscheme
syntax on
color dracula
set termguicolors
set t_Co=256
hi Normal guifg=NONE guibg=NONE

" line numbers
set number relativenumber

" netrw
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

" sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" FlyGrep
nnoremap <Leader>g :FlyGrep<cr>

" Tab / Shift Tab to change buffers
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" open previous buffer
nmap <Leader><Leader> <c-^>

" bufftabline
let g:buftabline_show = 2
hi link BufTabLineFill Normal
hi link BufTabLineCurrent WildMenu
hi link BufTabLineActive Directory

" hide bottom bar
set noshowmode 
set noruler
set laststatus=0
