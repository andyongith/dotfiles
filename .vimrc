
" My own vim configuration
set number relativenumber
set scrolloff=5
set ruler showcmd
set wildmenu
set mouse=a
syntax on
set smartindent shiftwidth=2 tabstop=2
set expandtab
set wrap
set smartcase
set cursorline
set showtabline=2
set history=200


" Installing vim-plug(if not installed)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl --insecure -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Installing PLugins using vim-plug
call plug#begin()

" Plug 'vim-scripts/AutoComplPop'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'k4yt3x/ayu-vim-darker' " or other package manager
Plug 'Yggdroot/indentLine'

call plug#end()


" Setting up the theme
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
let ayucolor="darker" " for darker version of theme
colorscheme ayu

let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


" Maping CTRL-t to toggle NERDTree
nnoremap <C-t> <Esc>:NERDTreeToggle<CR>
inoremap <C-t> <Esc>:NERDTreeToggle<CR>

" Run following commands at runtime to complete the setup
" Also you have to run "yarn Install" in terminal in ~/.vim/plugged/coc.nvim/ directory
"  :PlugInstall
"  :CocInstall coc-clangd coc-css coc-sh coc-git coc-html coc-json coc-lua coc-python coc-sql
