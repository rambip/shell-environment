set ignorecase
" windows and pane options 
set wildmenu splitright
" line numbers
set relativenumber nu rnu ruler
" colorscheme
colo delek

" Filetype settings
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

" FIXME: mouse=a always ?
if has_key(environ(), 'ANDROID_ROOT')
    set mouse=a
end


" indentation
" replace <tab> with spaces
set expandtab smarttab smartindent autoindent
" autoindentation width
set shiftwidth=4
" <tab> indentation width
set softtabstop=4
" <tab> char width
set tabstop=4
" set backspace behaviour
set backspace=indent,eol,start

" Move
imap kj <Esc>
imap jk <Esc>l

nmap é <C-w>
nmap <tab> gt

noremap <C-j> <C-w>w
tnoremap <C-j> <C-\><C-n><C-w>w


" Save and quit (FIXME: usefull ?)
map Z :xa<cr>
map Q :q<cr>

" EDITOR EXPERIENCE:
map Y y$
nmap <silent> <c-l> :noh<CR>

" move the lines of visual mode up or down
vnoremap <silent> J :m '>+1<cr>gv
vnoremap <silent> K :m '<-2<cr>gv


" TOGGLE TOOLS:
nmap <silent><Space><Space> <Cmd>set nu! rnu! paste!<cr>
nmap <silent><Space>f <Cmd>30 Lexplore<cr>
nmap <silent><Space>t <Cmd>on \| vs \| terminal<cr>
nmap <silent><Space>o <Cmd>only<cr>


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

