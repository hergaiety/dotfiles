"install plugin manager - vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'pangloss/vim-javascript'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'
Plug 'wsdjeg/FlyGrep.vim'
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

" FlyGrep
nnoremap <Leader>g :FlyGrep<cr>
