" ~/.vimrc

"" STARTUP 
runtime! archlinux.vim
" pathogen
execute pathogen#infect()

" autostart nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" show hidden files
let NERDTreeShowHidden=1

"" themes 
" colorscheme zenburn
" colorscheme solarized
colorscheme sourcerer
" colorscheme base16-ocean
" colorscheme base16-tomorrow
set background=dark

"" options
" tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" lines
set number

" use the rat
set mouse=a

" set paste

filetype plugin indent on
syntax on

" omni complete
set omnifunc=syntaxcomplete#Complete

" py complete w/ pydiction
let g:pydiction_location = '/home/kevin/.vim/bundle/pydiction/complete-dict'
" change height of menu, default is 8
" let g:pydiction_menu_height = 3

" set gvim font
if has('gui_running')
    set guifont=Tewi
endif


" powerline
" set rtp+=/home/kevin/powerline/powerline/bindings/vim

" airline options
" make pretty arrows:
let g:airline_powerline_fonts = 1
" tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
