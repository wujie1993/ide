set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
" Plugin 'Valloric/YouCompleteMe' 
" Plugin 'vim-syntastic/syntastic'
" Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/molokai'
" Plugin 'Shougo/neocomplete.vim'

call vundle#end()

set number
set softtabstop=2
set tabstop=2
set expandtab
set backspace=2
set incsearch
set hlsearch
set autowrite
set noswapfile
set nobackup
set fdm=syntax
filetype plugin indent on
filetype plugin on

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" tagbar
" autocmd vimenter * TagbarToggle
nmap <F8> :TagbarToggle<CR>

" nerdtree conf
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" molokai conf
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
autocmd BufWritePost,FileWritePost *.go execute 'GoMetaLinter'
" autocmd BufWritePost,FileWritePost *.go execute 'GoVet'

" neocomplete
" let g:neocomplete#enable_at_startup = 1
