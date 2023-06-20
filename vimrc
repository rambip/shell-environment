" Filetype settings
set nocompatible
filetype plugin on
filetype indent on
syntax on

"           _ _ _   
"   ___  __| (_) |_ 
"  / _ \/ _` | | __|
" |  __/ (_| | | |_ 
"  \___|\__,_|_|\__|
                  
" replace <tab> with spaces
set expandtab
" show \t as errors
match Error /\t/
" set 4 as the indentation unit, always
set smarttab shiftwidth=4 sts=4
" set backspace behaviour
set backspace=indent,eol,start
" enable automatic indentation
set autoindent

map Y y$

let mapleader=","

" move the lines of visual mode up or down
vnoremap <silent> J :m '>+1<cr>gv
vnoremap <silent> K :m '<-2<cr>gv


imap kj <Esc>
imap jk <Esc>l

" just for convenience: allow to repeat the following plugins
source $CONFIG/vim-plugins/repeat.vim

" `gc` to comment
source $CONFIG/vim-plugins/commentary.vim
" `ys` (`S` in visual mode) for surrounding object 
source $CONFIG/vim-plugins/surround.vim
" `cx` (`X` in visual mode) to exchange pieces of text
source $CONFIG/vim-plugins/exchange.vim

"  _ __ ___   _____   _____ 
" | '_ ` _ \ / _ \ \ / / _ \
" | | | | | | (_) \ V /  __/
" |_| |_| |_|\___/ \_/ \___|
                          
nnoremap <silent>,n :bnext<cr>
nnoremap <silent>,p :bprevious<cr>

nnoremap g1 :argu 1<cr>
nnoremap g2 :argu 2<cr>
nnoremap g3 :argu 3<cr>
nnoremap g4 :argu 4<cr>
nnoremap g5 :argu 5<cr>

nnoremap <C-j> :wincmd w<cr>

 " _              _     
" | |_ ___   ___ | |___ 
" | __/ _ \ / _ \| / __|
" | || (_) | (_) | \__ \
 " \__\___/ \___/|_|___/
                      


" toggle line numerotation and paste mode
nmap <silent><Space><Space> :set nu! rnu! paste!<cr>
" toggle file explorer
nmap <silent><Space>f :25 Lexplore<cr>
" fullscreen 
nmap <silent><Space>o :only<cr>
" new window 
nmap <silent><Space>n :new<cr>
" new terminal
if has("nvim")
    nmap <silent><Space>t :vs \| terminal<cr>
    tnoremap <C-j> <Cmd>wincmd w<cr>
    tnoremap <C-n> <C-\><C-n>
else
    nmap <silent><Space>t :terminal<cr>
    tnoremap <C-j> <C-w><C-w>
end


" <leader>t to send text to terminal
source $CONFIG/vim-plugins/sendtoterm-custom.vim
map <leader>t :call SendToTerm()<cr>


"     _         _      
" ___| |_ _   _| | ___ 
"/ __| __| | | | |/ _ \
"\__ \ |_| |_| | |  __/
"|___/\__|\__, |_|\___|
"         |___/        
                              
" windows and pane options 
set wildmenu splitright
" line numbers
set relativenumber nu rnu ruler
" colorscheme
colo slate
highlight Normal ctermbg=None
highlight NonText ctermbg=None

nmap <silent> <c-l> :noh<CR>

       " _   _               
  " ___ | |_| |__   ___ _ __ 
 " / _ \| __| '_ \ / _ \ '__|
" | (_) | |_| | | |  __/ |   
 " \___/ \__|_| |_|\___|_|   
                           

if has_key(environ(), 'ANDROID_ROOT')
    set mouse=a
end

if has("nvim")
    so ~/.config/nvim/init.lua
endif
