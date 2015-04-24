runtime! archlinux.vim

" pathogen
execute pathogen#infect()

" autostart nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" THEMES 
" colorscheme zenburn
" colorscheme solarized
colorscheme sourcerer
" colorscheme base16-ocean
" colorscheme base16-tomorrow
set background=dark

" tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" lines
set number
set mouse=a
" set paste
filetype plugin indent on
syntax on

" set gvim font
if has('gui_running')
    set guifont=Tewi
endif


" powerline
set rtp+=/home/kevin/powerline/powerline/bindings/vim

" airline options
" make pretty arrows:
" let g:airline_powerline_fonts = 1

