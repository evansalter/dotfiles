" VIM-PLUG RULES
	call plug#begin('~/.vim/plugged')

" PLUGINS
	Plug 'syntastic'
	Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
	Plug 'restore_view.vim'
	Plug 'altercation/vim-colors-solarized'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'majutsushi/tagbar'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'davidhalter/jedi-vim'
	Plug 'junegunn/vim-xmark'


" VIM-PLUG RULES
        call plug#end()

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

	" vim-gitgutter update time
	set updatetime=750

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

	" encoding
	set encoding=utf-8

	" tabline
	let g:airline#extensions#tabline#enabled = 1

" AUTOCOMMANDS
	" auto source .vimrc on change
	augroup source_vimrc
	    autocmd!
	    autocmd BufWritePost .vimrc,_vimrc,vimrc
		\ source ~/.vimrc | AirlineRefresh
	augroup END

" MARKDOWN
	" *.md set to Markdown syntax
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown

	" Pandoc PDF
	nnoremap <leader>p :! pandoc % -o %:r.pdf<cr>

" MISC
	" Make
	nnoremap <leader>m :make<cr>

	" SEARCHING
	set ignorecase

	" Easy paste mode
	nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>

	" TABLE MODE
	let g:table_mode_fillchar = '-'
	let g:table_mode_corner = '+'
	let g:table_mode_corner_corner = '+'

" Tabs
	set softtabstop=4
	set shiftwidth=4
	set expandtab

" Others
    set noswapfile
    if has("persistent_undo")
        set undodir=$HOME/.vim/undo//
        if !isdirectory(&undodir)
            call mkdir(&undodir)
        endif
        set undofile
    endif

    vnoremap c "_c
    nnoremap c "_c
    nnoremap x "_x
    nnoremap X "_x

    noremap gV `[v`]
