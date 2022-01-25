" basic
set nocompatible

" ===================================== SETTINGS ===================================================

" Highlighting
syntax on " Set syntax highlighting. Needs to be before filetype ... on to be working in split windows.
filetype indent plugin on " Filetype detection

" folding
set foldmethod=syntax

" options
set hidden
set autowriteall
set wildmode=longest:full
set wildmenu
set showcmd
set confirm
set mouse=a
set nomousehide

" appearance
set number
set ruler
set laststatus=2
set visualbell " No beep, but visual bell
set t_vb= " Clear screen flashing, visual bell
set cmdheight=2
set nowrap
set linebreak
set nolist " list disables linebreak

" Force the terminal to use 256 colors if it supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" editing
set backspace=indent,eol,start
set nostartofline

" intendation
set autoindent
set smarttab
set expandtab " replace tabs by spaces
set softtabstop=3
set shiftwidth=3

" Execute local vimrc's
set exrc	      " enable per-directory .vimrc files
set secure	      " disable unsafe commands in local .vimrc files

" use system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" mappings
" This unsets the 'last search pattern' register by hitting F3
nnoremap <F3> :noh <CR> <CR> :<backspace> kw
map Y y$
" inoremap <esc> <C-O>l<esc>
" ctrl+s for saving
noremap <C-S> :update <CR>
vnoremap <C-S> <C-C> :update <CR>
inoremap <C-S> <Esc> <C-O> :update <CR>
" return for newline in movement mode
nmap <S-Enter> O <Esc>
nmap <CR> o <Esc>
" ctrl+k to kill line
noremap <C-K> dd
inoremap <C-K> <esc> ddi
" ctrl+j for break line
nnoremap <NL> i <CR> <ESC>
" esc disable last search highlighting
"nnoremap <esc> :noh<return><esc>
"vnoremap <F5> <ESC>:let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')<CR>
" toggle wrapping by hitting F9
map <F9> :set wrap!<CR>
" Delete current buffer and move to previous one -> window is not closed
nnoremap <C-q> :bp\|bd #<CR>
inoremap <C-q> :bp\|bd #<CR>

let mapleader=',' " Change leader to ',' as it's easier accessible on non-english keyboards

" filetypes
au BufNewFile,BufRead *.{gpl,gpls,gplt,gnuplot,gnu,GNU} setf gnuplot
au BufNewFile,BufRead *.{out,log,com,test}* setf fortran

" (c)tags file
set tags=.tags


" " ================================= PLUGINS ========================================================
" " vim-plug
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
" endif
" 
" " Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
" " call plug#begin('~/.vim/plugged')
" call plug#begin()
" 
" " vim-latex: aka latex-suite
" " vim-latex: aka latex-suite
" Plug 'vim-latex/vim-latex'
" 
" " Syntax highlighting
" Plug 'vim-scripts/gnuplot-syntax-highlighting'
" Plug 'plasticboy/vim-markdown'
" 
" " nerdcommenter: Commenting functionality
" Plug 'scrooloose/nerdcommenter'
" 
" " Matchit: extended matching for % operator (HTML, ...)
" " Plug 'adelarsq/vim-matchit'
" 
" " taglist: The "Tag List" plugin is a source code browser plugin for Vim and
" " provides an overview of the structure of source code files and allows
" " you to efficiently browse through source code files for different
" " programming languages.
" " Plug 'vim-scripts/taglist.vim' " git version outdated, install manually,
" " see https://www.vim.org/scripts/script.php?script_id=273
" 
" " Nerdtree: The NERDTree is a file system explorer for the Vim editor.
" Plug 'scrooloose/nerdtree'
" " Nerdtree tabs: This plugin aims at making NERDTree feel like a true panel, independent of tabs. 
" Plug 'jistr/vim-nerdtree-tabs'
" 
" " " Filebrowser:
" " Plug 'davvil/dotvim/blob/master/plugin/filebrowser.vim '
" 
" " ctags: This script uses exuberant ctags to build the list of tags for the current file.
" Plug 'vim-scripts/ctags.vim'
" 
" " vim-ctags: Simple VIm plugin to manage ctags index.
" " Plug 'webastien/vim-ctags'
" 
" " Star-search:
" " Plug 'vim-scripts/star-search'
" 
" " Airline: statusline
" Plug 'vim-airline/vim-airline'
" 
" " Airline themes
" " Plug 'vim-airline/vim-airline-themes'
" 
" " vim-fugitive:
" " Plug 'tpope/vim-fugitive'
" 
" " CSApprox:
" Plug 'godlygeek/CSApprox'
" 
" " Color themes:
" Plug 'ajmwagar/vim-deus'
" Plug 'gosukiwi/vim-atom-dark'
" 
" " delimitMate: auto-completion of paranthesis, etc.
" Plug 'Raimondi/delimitMate'
" 
" " Tabular: indent visual selection wrt. to characters that can be specified
" Plug 'godlygeek/tabular'
" 
" " YouCompleteMe: is a fast, as-you-type, fuzzy-search code completion engine for Vim.
" " See: https://valloric.github.io/YouCompleteMe/
" " Plug 'Valloric/YouCompleteMe'
" 
" " " Indent guide lines
" " Plug 'Yggdroot/indentLine'
" 
" " Initialize plugin system
" call plug#end()
" 
" "
" " ~~~ Plugin settings ~~~
" "
" 
" " Nerdtree:
" " Open Nerdtree when vim starts - comment out to prevent
" " autocmd VimEnter * NERDTree
" " Map a specific key or shortcut to open NERDTree
" map <C-n> :NERDTreeToggle <CR>
" 
" " Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1 
" let g:airline_left_sep='▶'
" let g:airline_right_sep='◀'
" " let g:airline_symbols.linenr='¶'
" " let g:airline_symbols.branch='⎇' " 'ᚠ'
" " let g:airline_symbols.paste='∥'
" " let g:airline_symbols.whitespace='☲' " 'Ξ'
" 
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" 
" " " Indent line
" " " Do not overwrite conceal color by gray and use theme color instead.
" " let g:indentLine_setColors=0
" " " More beautiful lines
" " " Note: these characters will only work with files whose encoding is UTF-8.
" " let g:indentLine_char="▏"
" " let g:indentLine_char="┊"
" " " Default conceal settings
" " let g:indentLine_concealcursor='inc'
" " let g:indentLine_conceallevel=2
" " " Toggle IndentLine by hitting F10
" " map <F10> :IndentLinesToggle<CR>
" 
" " YouCompleteMe
" " Install: cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer
" " Select key mapping for scrolling the completion list.
" " let g:ycm_key_list_select_completion = ['<Down>']
" " let g:ycm_key_list_previous_completion = ['<up>']

" ====================================== COLORSCHEME ===============================================
if filereadable(glob("~/.vim/plugged/vim-deus/colors/deus.vim"))
   colors deus
   if has('gui_running')
"      set guifont=Input
      " Change comment color to a light blue
      hi Comment guifg=#87bdd8
   endif
endif


" ========================================= GVIM ===============================
" GVim Setting
set guioptions-=m     " remove menu bar
set guioptions-=T     " remove toolbar
set guioptions-=r     " remove right-hand scroll bar
set guioptions-=L     " remove left-hand scroll bar


" ====================================== FUNCTIONS =============================

" TwiddleCase: Capitalize selection, cycling 'all lower case' -> 'first letter
" upper case' -> 'all letters upper case'
" TODO Add camel case?
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


" =============================== vim-latex ===============================
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0

" latex filetype settings
autocmd Filetype tex setlocal nofoldenable wrap linebreak nolist
autocmd Filetype tex setlocal textwidth=0 wrapmargin=0 formatoptions+=l
autocmd FIletype tex setlocal spell spelllang=de,en
"autocmd Filetype tex setlocal makeprg=make


" === FORTRAN ===
autocmd Filetype fortran let fortran_free_source=1 " This messes up some syntax highlighting in fixed form fortran.
autocmd Filetype fortran let fortran_do_enddo=1 
autocmd Filetype fortran setlocal colorcolumn=6,73,133 " Optical indicator for character limits
autocmd Filetype fortran let fortran_fold=1
autocmd Filetype fortran let fortran_fold_conditionals=1
autocmd Filetype fortran let fortran_fold_multilinecomments=1 " This for some reason leads to huge cpu load while typing
autocmd Filetype fortran let fortran_have_tabs=1
