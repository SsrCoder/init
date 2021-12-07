" {{ start scripts }}
" auto download vim-plug if not exists
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" auto jump to the line which latest closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" {{ base configs }}
set number
set relativenumber
set cursorline
set encoding=utf-8
set termencoding=utf-8

set autoindent
set scrolloff=5

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set ignorecase
set smartcase

filetype plugin indent on

inoremap jj <Esc>
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

noremap ; :

nnoremap <Space>r :source $MYVIMRC<CR>
nnoremap <Leader>rc :e $MYVIMRC<CR>
nnoremap <Space><CR> :nohlsearch<CR>

" use pbcopy instead
" vnoremap <C-c> "+y
vnoremap <C-c> :w !pbcopy<CR><CR>

" {{ plugins }}
call plug#begin('~/.config/nvim/plugged')

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-surround
Plug 'tpope/vim-surround'

"" airline
Plug 'vim-airline/vim-airline'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" translator
Plug 'voldikss/vim-translator'

" themes plugins
Plug 'connorholyday/vim-snazzy'

call plug#end()

let g:SnazzyTransparent = 1
color snazzy

" {{ plugin coc.nvim }}
let g:coc_global_extensions = [
	\ 'coc-docker',
	\ 'coc-gitignore',
	\ 'coc-json',
	\ 'coc-marketplace']




" {{ plugin fzf.vim }}
nnoremap <C-f> :Files<CR>
nnoremap <C-r> :Rg <CR>

