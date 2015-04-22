runtime! archlinux.vim

" pathogen
execute pathogen#infect()

" autostart nerdtree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" colorscheme zenburn
" colorscheme solarized
colorscheme sourcerer
" colorscheme base16-ocean
" colorscheme base16-tomorrow
set background=dark
set tabstop=4
set number
set mouse=a
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

