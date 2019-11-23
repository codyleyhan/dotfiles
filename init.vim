if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=';'

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'mhartington/oceanic-next'
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'jiangmiao/auto-pairs'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'airblade/vim-gitgutter'
	Plug 'SirVer/ultisnips'
	Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/goyo.vim'
call plug#end()

set tabstop=4
set shiftwidth=4
set showmatch
set ignorecase
set hlsearch
set autoindent
set number
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set title

"Tree view
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

if (has('termguicolors'))
	set termguicolors
endif

colorscheme OceanicNext

"auto-complete
let g:deoplete#enable_at_startup=1

"go
let g:go_list_type = 'quickfix'
let g:go_test_timeout = '300s'
let g:go_fmt_command = 'goimports'
let g:go_metalinter_autosave = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

"keybindings
nmap <C-\> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <silent> t :FZF<CR>
