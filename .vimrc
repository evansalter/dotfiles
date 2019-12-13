" VIM-PLUG RULES
    call plug#begin('~/.vim/plugged')

" PLUGINS
    Plug 'vim-syntastic/syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/restore_view.vim'
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
    Plug 'ryanoasis/vim-devicons'
    Plug 'esalter-va/vim-checklist'
    Plug 'ChrisPenner/vim-committed'
    Plug 'metakirby5/codi.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'vim/killersheep'

" VIM-PLUG RULES
    call plug#end()

" FILE EXPLORER
    let mapleader=" "


    " Nerdtree mapping
    map <leader>k :NERDTree<CR>
    let g:NERTTreeDirArrows=0

    " tagbar mapping
    map <leader>t :TagbarToggle<CR><C-l>

    noremap :W :w

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
    " To show airline by default
    set laststatus=2
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
    let g:airline_section_z="%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3v"
    " Putty options 
    if &term == "xterm"
        let g:solarized_termcolors=256
        let g:airline_powerline_fonts=0
    endif
    colorscheme molokai 
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
    " Leave folds open when opening new file
    set foldlevelstart=20
    " By default try to guess foldmethod
    set foldmethod=syntax
    " Remap Arrow Keys to quick resize windows
    nnoremap <silent> <Left> :vertical resize -1<CR>
    nnoremap <silent> <Right> :vertical resize +1<CR>
    nnoremap <silent> <Up> :resize +1<CR>
    nnoremap <silent> <Down> :resize -1<CR>
    " allow moving among lines on screen instead of real lines when wrapping
    nnoremap j gj
    vnoremap j gj
    nnoremap k gk
    vnoremap k gk
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
    " scrollof
    set so=5

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

" LaTeX
    nnoremap <leader>l :! bibtex %:r && latex %:r && pdflatex %:r<cr>
    " nnoremap <leader>l :! pdflatex %<cr>

" MISC
    " Make
    nnoremap <leader>m :make<cr>

    " Easy paste mode
    nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>

" SEARCHING
    set ignorecase

" TABLE MODE
    let g:table_mode_fillchar = '-'
    let g:table_mode_corner = '+'
    let g:table_mode_corner_corner = '+'

" TABS
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" OTHERS
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

    " UltiSnips
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-N>"
    let g:UltiSnipsJumpBackwardTrigger="<c-P>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

" VIM-CHECKLIST
    nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
    nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
    nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
    vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
    vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
    vnoremap <leader>cd :ChecklistDisableCheckbox<cr>
