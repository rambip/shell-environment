set relativenumber
set nu rnu

" indent settings:
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

" indentation
" replace <tab> with spaces
set expandtab smarttab smartindent autoindent
" autoindentation width
set shiftwidth=4
" <tab> indentation width
set softtabstop=4
" <tab> char width
set tabstop=4



set splitright
set ignorecase
set nocompatible
set ruler
set wildmenu
"set mouse=$VIM_MOUSE
filetype on
filetype plugin on
filetype indent on
syntax on


" NORMAL MODE

" Move
imap kj <Esc>
imap jk <Esc>l

" Tabs
nmap <tab> gt

" Windows
" nnoremap <C-n> <C-w>w
" nnoremap <C-p> <C-w>W
nnoremap <C-j> <C-w>w


" Save and quit
map Z :xa<cr>
map Q :q<cr>

" Misc
map Y y$
nmap <silent> <c-l> :noh<CR>

nmap <silent><Space><Space> :set nu! rnu! paste!<cr>

" open terminal on current window
command! T :term ++curwin

" open file explorer
command! F :15 Lexplore


" VISUAL MODE
" move the lines of visual mode up or down
vnoremap <silent> J :m '>+1<cr>gv
vnoremap <silent> K :m '<-2<cr>gv


" COLORSCHEME
colo delek


" startup and file explorer
autocmd VimEnter    * nested call s:startup()
function! s:startup()
  if !argc() && line2byte('$') == -1
      :15 Lex
  endif
endfunction


" répéter avec . les commandes d'autres plugins
" a charger avant les autres plugins
source $HOME/.config/shell/vim-plugins/repeat.vim


" gc pour commenter
source $HOME/.config/shell/vim-plugins/commentary.vim

" cx pour échanger - X en mode visuel
source $HOME/.config/shell/vim-plugins/exchange.vim

" <leader>t
source $HOME/.config/shell/vim-plugins/sendtoterm.vim

" ys - S en mode visuel
source $HOME/.config/shell/vim-plugins/surround.vim

" ┏━┓┏┓ ┏┓ ┏━┓┏━╸╻ ╻╻┏━┓╺┳╸╻┏━┓┏┓╻┏━┓
" ┣━┫┣┻┓┣┻┓┣┳┛┣╸ ┃┏┛┃┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓
" ╹ ╹┗━┛┗━┛╹┗╸┗━╸┗┛ ╹╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛
" regex abbreviations
source $HOME/.config/shell/vim-plugins/abbreviations.vim
" let g:regex_abbreviations#expand_symbol = "\<tab>"
inoremap <tab> <c-r>=CompleteAbbreviation()<cr>
" C/C++/java
call AddAbbreviation("^ *forc$", "for (; ; ) {\<cr>}\<esc>\<up>0f;i", 1) " empty for loop
" call AddAbbreviation("^ *for.$", "\<esc>xa (int =; ; ) {\<cr>}\<esc>\<up>0f=Pla") " for loop with a 1 letter variable
call AddAbbreviation("^ *for *(.*;.*;.*) *{ *$", "\<right>\<esc>/;\\|)\<cr>:noh\<cr>i") " go to next ';' when in a for loop

