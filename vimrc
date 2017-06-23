set nomodeline
set encoding=utf8

" Stop word wrapping
set nowrap

" Adjust system undo levels
set undolevels=100
set undodir=~./.local/share/nvim/undo

" Use system clipboard
set clipboard=unnamed

" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Number gutter with relative line numbers
" Relative lines encourage smarter movements in vim
set number
set relativenumber

" Use search highlighting
set hlsearch

" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

" Disable mouse support
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin('~/.local/share/nvim/plugged')

" Required
Plug 'Shougo/unite.vim'

" Visuals
Plug 'mhinz/vim-startify'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" Navigating Project Files
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

" Code Editing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'

" Languages
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'posva/vim-vue'

" Markdown and Distraction Free Writing
Plug 'reedes/vim-wordy'
Plug 'dbmrq/vim-ditto'

" Movement
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" Configuration

" Theme: Dracula
color dracula

" ctrlp
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|build\|dist\|dest'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" vim-startify
let g:startify_change_to_dir = 0
let g:startify_custom_header = [
      \ '     ____       _ _____    ____        ',
      \ '    / __/    __(_) _/ /_  / __/__ __ __',
      \ '   _\ \| |/|/ / / _/ __/ / _// _ \\ \ /',
      \ '  /___/|__,__/_/_/ \__/ /_/  \___/_\_\ ',
      \ '',
\ ]

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" Leader
let mapleader="\<SPACE>"

" Return to last opened file
nmap <Leader><Leader> <c-^>

" adding empty lines
nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" moving current line
nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>

" arrow keys resize pane
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Grepper
nnoremap <Leader>fp :CtrlSF<Space>
nnoremap <Leader>ft :CtrlSFToggle<Space>

" File Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" vimfiler
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" writing
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_guifg = 'DarkGray'
highlight Folded ctermbg=NONE
highlight FoldColumn ctermbg=NONE

autocmd Filetype markdown call SetMarkdownOptions()

function SetMarkdownOptions()
  " Enable spellcheck.
  set spell spelllang=en_us
  set nonumber
  set wrap
  set nolist
  " Wordy weak
  DittoOn
endfunction
