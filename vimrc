" vim-startify
let g:startify_custom_header = [
      \ '.  .      .  .__                ',
      \ '\  / _ * _|  |  \._. _. _  _ ._ ',
      \ ' \/ (_)|(_]  |__/[  (_](_](_)[ )',
      \ '                       ._|      ',
      \ '',
      \ '  <Space> ? for help',
      \ '',
\ ]
let g:startify_change_to_dir = 0

" save project home dir on load
let DirProjectHome = getcwd()

" generic settings
set nomodeline
set encoding=utf8

" Stop word wrapping
set nowrap

" Adjust system undo levels
set undofile
set undodir=~/.local/share/nvim/undo
set undolevels=100

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

" Menus
Plug 'Shougo/denite.nvim'
Plug 'junegunn/vim-emoji'
Plug 'pocari/vim-denite-emoji'

" Visuals
Plug 'mhinz/vim-startify'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

" Navigating Project Files
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-fugitive'

" Code Editing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/switch.vim'

" Languages
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json'

" Movement
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Visuals
Plug 'mhinz/vim-startify'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

call plug#end()


" Configuration

" Theme: Dracula
color dracula

" denite setup
call denite#custom#map('insert', "<Up>", '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "<Down>", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<c-u>', '<denite:scroll_up>' , 'noremap')
call denite#custom#map('insert', '<c-d>', '<denite:scroll_down>' , 'noremap')
call denite#custom#option('_', {
  \ 'prompt': '⟩',
  \ 'winheight': 10,
  \ 'auto_resize': 1,
  \})
let s:menus = {}
let s:menus.neovim = {
  \ 'description': 'Tools & Keybindings'
\ }
let s:menus.neovim.command_candidates = []
let s:menus.tmux = {
  \ 'description': 'Keybindings'
\ }
let s:menus.tmux.command_candidates = []
let s:menus.git = {
  \ 'description': 'Git power menu <Leader>g'
\ }
let s:menus.git.command_candidates = []

" Leader
let mapleader="\<SPACE>"
let s:menus.neovim.command_candidates += [['Leader: <Space>', '']]

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" Return to last opened file
nmap <Leader><Leader> <c-^>
let s:menus.neovim.command_candidates += [['Reopen last buffer: <Leader><Leader>', 'c-^']]

" register list
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
let s:menus.neovim.command_candidates += [['List registers: ""', ':registers']]

" adding empty lines
nnoremap <Leader>k  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <Leader>j  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
let s:menus.neovim.command_candidates += [['Add empty line above: <Leader>k', '']]
let s:menus.neovim.command_candidates += [['Add empty line below: <Leader>j', '']]

" moving current line
nnoremap <Leader>mk  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <Leader>mj  :<c-u>execute 'move +'. v:count1<cr>
let s:menus.neovim.command_candidates += [['Move line up: <Leader>mk', '']]
let s:menus.neovim.command_candidates += [['Move line down: <Leader>mj', '']]

" arrow keys resize pane
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
let s:menus.neovim.command_candidates += [['Resize pane: Arrow Keys', '']]
" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" File Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>
let s:menus.neovim.command_candidates += [['Next buffer: <Tab>', 'bnext!']]
let s:menus.neovim.command_candidates += [['Previous buffer: <Shift><Tab>', 'bprev!']]

" switch
let g:switch_mapping = "<Leader>s"
let g:switch_custom_definitions = [['var', 'let', 'const', 'let']]
let s:menus.neovim.command_candidates += [['Switch under cursor [ex: true -> false]: <Leader>s', 'Switch']]

" ctrlp Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
let g:ctrlp_line_prefix = ''
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let s:menus.neovim.command_candidates += [['Fuzzy Find Files: <Leader>t (or p)', 'CtrlP']]

" netrw File Explorer
function! ExploreToggle(bang)
  if &ft ==# "netrw"
      :exe "lcd " . g:DirProjectHome
    :bd
  else
    if a:bang
      :lcd %:p:h
      :enew
      :Explore
    else
      :exe "lcd " . g:DirProjectHome
      :enew
      :Explore
    endif
  endif
endfunction
command! -bang ET call ExploreToggle(<bang>0)
map ` :ET<CR>
map ~ :ET!<CR>
autocmd FileType netrw set nolist
let g:netrw_preview = 1
let g:netrw_banner = 0
let s:menus.neovim.command_candidates += [['File Explorer: `', 'Explore']]
let s:menus.neovim.command_candidates += [['File Explorer from current open file: ~', 'Explore']]

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
let s:menus.neovim.command_candidates += [['Sneak to next character: f <Char> (F back)', '']]
let s:menus.neovim.command_candidates += [['Sneak to next 2 character sequence: S <Char><Char> (S back)', '']]

" ctrlsf
nnoremap <Leader>fp :CtrlSF<Space>
nnoremap <Leader>ft :CtrlSFToggle<CR>
let g:ctrlsf_default_view_mode = 'compact'
let s:menus.neovim.command_candidates += [['Find in Project: <Leader>fp', 'CtrlSF ']]
let s:menus.neovim.command_candidates += [['Find in Project Toggle: <Leader>ft', 'CtrlSFToggle']]

" vim-fugitive
let s:menus.neovim.command_candidates += [['Git menu: <Leader>g', 'Denite menu:git']]
let s:menus.git.command_candidates += [['Status `g status`', 'Git status']]
let s:menus.git.command_candidates += [['Add Patch `g add -p`', 'Git add -p']]
let s:menus.git.command_candidates += [['Commit `g commit`', 'Git commit']]

" vim-denite-emoji
let s:menus.neovim.command_candidates += [['Emoji menu: <Leader>e', 'Denite emoji']]

" writing
autocmd Filetype markdown call SetMarkdownOptions()
function SetMarkdownOptions()
  " Enable spellcheck.
  set spell spelllang=en_us
  set wrap
  set nolist
endfunction

" denite tmux
let s:menus.tmux.command_candidates += [['Leader: <Ctrl>b', '']]
let s:menus.tmux.command_candidates += [['Time: <Leader>t', '']]
let s:menus.tmux.command_candidates += [['New vertical split: <Leader>\', '']]
let s:menus.tmux.command_candidates += [['New horizontal split: <Leader>-', '']]
let s:menus.tmux.command_candidates += [['New tab: <Ctrl>t', '']]
let s:menus.tmux.command_candidates += [['Close tab: <Ctrl>w', '']]
let s:menus.tmux.command_candidates += [['Next tab: <Ctrl><Tab>', '']]
let s:menus.tmux.command_candidates += [['Previous tab: <Ctrl><Shift><Tab>', '']]

" denite finalize
call denite#custom#var('menu', 'menus', s:menus)
nnoremap <Leader>/ :Denite menu<cr>
nnoremap <Leader>? :Denite menu<cr>
nnoremap <Leader>g :Denite menu:git<cr>
nnoremap <Leader>e :Denite emoji<cr>
