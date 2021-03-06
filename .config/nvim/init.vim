"nvimrc
"
" Configuración básica

" Vundle config
filetype off
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Custom Bundles
Plug 'ctrlpvim/ctrlp.vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'ternjs/tern_for_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/colorizer'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jceb/vim-orgmode'

call plug#end()

filetype plugin indent on

" Color config
syntax on     " Activa coloreado de sintaxis.

" Esquema de color. Elegir uno
set background=dark

colorscheme tritium " Esquema de color

" Configuración de colores
if has('nvim')
  set termguicolors " True Color con NeoVim
else
  set t_Co 256 " 256 colores. No debería ser necesario usando una correcta configuración del terminal
endif

" Tabulación y espacios
"set expandtab   " Tabula usando espacios
set shiftwidth=2
set tabstop=2     " Espacios que mostramos por tabulador
set smarttab
set cindent
let indent_guides_enable_on_vim_startup = 1

" UI config
set number          " Muestra número de lineas.
set cursorline      " Señala la linea actual.
set wildmenu        " Autocompletado para la barra de comandos.
set lazyredraw      " Redibuja pantalla solo cuando es estríctamente
" necesario.
set showmatch       " Señala [{()}]
set mouse=n         " Activa el ratón
"set ttymouse=xterm2 " Compatibilidad con la consola
set list listchars=tab:⇥⇥,eol:↵ " Muestralos tabuladores y saltos de linea.
set so=14     " Lineas movidas por scroll
"au CursorHoldI * stopinsert " Salir del modo inserción tras 4 segundos.

" Folding (ocultado de bloques anidados)
set foldenable    " Activa folding
set foldlevelstart=10 " Dobla a partir de 10.
set foldnestmax=10  " Máximo de 10
set foldmethod=indent " Basado en identado
nnoremap <space> za

" Movimiento
" Comienzo de la linea
nnoremap B ^
" Final de la linea
nnoremap E $

" Desactivamos $/^
nnoremap $ <nop>
nnoremap ^ <nop>

" Path de Python
if has("unix")
  let s:uname = system("uname")
  let g:python_host_prog='/usr/bin/python'
endif

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Configuración extra
" Configuración de plugins
let g:coc_global_extensions=['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-clangd', 'coc-cmake', 'coc-markdownlint', 'coc-python', 'coc-sh', 'coc-rls', 'coc-xml', 'coc-yaml']

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"augroup ProjectDrawer
"		autocmd!
"		autocmd VimEnter * :Vexplore
"augroup END

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tritium'
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : '',
      \ 'i'      : '',
      \ 'ic'     : '',
      \ 'ix'     : '',
      \ 'n'      : '',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'     : 'S',
      \ 't'      : 'T',
      \ 'v'      : '',
      \ 'V'      : '',
      \ }
