" Filetype settings
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

"           _ _ _   
"   ___  __| (_) |_ 
"  / _ \/ _` | | __|
" |  __/ (_| | | |_ 
"  \___|\__,_|_|\__|
                  
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

set ignorecase

map Y y$

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
                          
nmap <tab> gt

nnoremap <C-j> <Cmd>wincmd w<cr>  
tnoremap <C-j> <Cmd>wincmd w<cr>  



 " _              _     
" | |_ ___   ___ | |___ 
" | __/ _ \ / _ \| / __|
" | || (_) | (_) | \__ \
 " \__\___/ \___/|_|___/
                      

let mapleader=","

" toggle line numerotation and paste mode
nmap <silent><Space><Space> <Cmd>set nu! rnu! paste!<cr>
" toggle file explorer
nmap <silent><Space>f <Cmd>25 Lexplore<cr>
" fullscreen 
nmap <silent><Space>o <Cmd>only<cr>
" new window 
nmap <silent><Space>n <Cmd>new<cr>
" new terminal
if has("nvim")
    nmap <silent><Space>t <Cmd>vs \| terminal<cr>
else
    nmap <silent><Space>t <Cmd>terminal<cr>
end


" <leader>t to send text to terminal
source $CONFIG/vim-plugins/sendtoterm-custom.vim
map <leader>t <Cmd>call SendToTerm()<cr>


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
colo desert
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

