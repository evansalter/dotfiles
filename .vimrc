" VUNDLE RULES
	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

" PLUGINS
	Plugin 'syntastic'
	Plugin 'bling/vim-airline'
	Plugin 'bling/vim-bufferline'
	Plugin 'restore_view.vim'
	Plugin 'altercation/vim-colors-solarized'
	Bundle 'rking/ag.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-surround'
	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'dhruvasagar/vim-table-mode'
	Plugin 'majutsushi/tagbar'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-commentary'

" VUNDLE RULES
	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required

" FILE EXPLORER
	let mapleader=" "
	" map <leader>k :Explore<cr>

	" To show airline by default
	set laststatus=2

	" Nerdtree mapping
	map <leader>k :NERDTree<CR>
	let g:NERTTreeDirArrows=0

	" tagbar mapping
	map <leader>t :TagbarToggle<CR><C-l>

" SPLITS
	" Smart way to move around windows
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
	" Open splits to bottom and right
	set splitbelow
	set splitright

" DISPLAY CONFIG
	" line numbers
	set number

	" xterm 256 colors
	set t_Co=256
	set t_ut=
	
	syntax enable

	" airline font
	let g:airline_powerline_fonts = 1

	" Putty options 
	if &term == "xterm"
		let g:solarized_termcolors=256
		let g:airline_powerline_fonts=0
	endif
	colorscheme solarized
	set background=dark

	" word wrapping
	set wrap
	set linebreak
	set nolist

	" highlight current line
	set cursorline

	" syntax highlighting
	syntax on

	" Set extra options when running in GUI mode
	if has("gui_running")
	    set guioptions -=a " native selection with * register?
	    set guioptions -=T " No ugly GUI toolbar
	    set guioptions -=e " Gui tab line
	    set guioptions -=r " No right scrollbar
	    set guioptions -=L " No left scrollbar
	    set t_Co=256
	endif
 
	" Folding Settings
	augroup vimrc
	     au BufReadPre * setlocal foldmethod=indent
	     au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
	augroup END

	" Remap Arrow Keys to quick resize windows
	nnoremap <silent> <Left> :vertical resize -1<CR>
	nnoremap <silent> <Right> :vertical resize +1<CR>
	nnoremap <silent> <Up> :resize +1<CR>
	nnoremap <silent> <Down> :resize -1<CR>

	" keep selection after >
	vnoremap > >gv
	vnoremap < <gv

	" move block
	vnoremap J xp`[V`]
	vnoremap K xkP`[V`]

	" font
	set guifont=Hack\ Regular:h11


	" encoding
	set encoding=utf-8
	

" AUTOCOMMANDS
	" auto source .vimrc on change
	augroup source_vimrc
	    autocmd!
	    autocmd BufWritePost .vimrc,_vimrc,vimrc
		\ source ~/.vimrc | AirlineRefresh
	augroup END

" Pandoc PDF
	nnoremap <leader>p :! pandoc % -o %:r.pdf<cr>

" SEARCHING
	set ignorecase

" TABLE MODE
	let g:table_mode_fillchar = '-'
	let g:table_mode_corner = '+'
	let g:table_mode_corner_corner = '+'
