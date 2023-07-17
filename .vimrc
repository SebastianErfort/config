" ===================================== SETTINGS ===================================================

" basic
set encoding=utf-8
set nocompatible

" Execute local vimrc's
" set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

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
set splitbelow
set splitright

" Syntax highlighting, filetype detection
syntax on " Set syntax highlighting. Needs to be before filetype ... on to be working in split windows.
filetype indent plugin on " Filetype detection
au BufNewFile,BufRead *.{gpl,gpls,gplt,gnuplot,gnu,GNU,pal} setf gnuplot
au BufNewFile,BufRead *.{out,log,com,test}* setf fortran
au BufNewFile,BufRead *.*{yml,yaml} setf yaml
au BufNewFile,BufRead *.{service,target} setf systemd

" indentation & folds
set autoindent
set smartindent
set smarttab
set foldmethod=syntax
" General: set indentation for all buffers, all file types
autocmd FileType * setlocal shiftwidth=4 softtabstop=-1 expandtab
" Python: so far poor support of syntax fold
autocmd FileType python setlocal foldmethod=indent tw=100
" Fortran: so far poor support of syntax fold. Using 3 bc. of 'historic reasons'
autocmd FileType fortran setlocal shiftwidth=3 softtabstop=-1 expandtab foldmethod=indent
" YAML: so far poor support of syntax fold
autocmd FileType yaml setlocal foldmethod=indent shiftwidth=2 softtabstop=-1 expandtab foldmethod=indent
" Markdown: so far poor support of syntax fold
autocmd FileType markdown setlocal foldmethod=indent

" use system clipboard if the os implementation gods smile upon us
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" (c)tags file
set tags=.tags


" ================================= MAPPINGS ========================================================
let mapleader=',' " Change leader to ',' as it's easier accessible on non-english keyboards

" This unsets the 'last search pattern' register by hitting F3
nnoremap <F3> :noh <CR> <CR> :<backspace> kw
" Remove trailing whitespace
nnoremap <F4> :%s/[ ]\+$//g <CR>
" toggle wrapping by hitting F9
map <F9> :set wrap!<CR>
" Delete current buffer, but first move to previous one such that pane is not closed
nnoremap <C-q> :bp\|bd #<CR>
inoremap <C-q> :bp\|bd #<CR>
" ctrl+s for saving
noremap <C-S> :update <CR>
vnoremap <C-S> <C-C> :update <CR>
inoremap <C-S> <Esc> <C-O> :update <CR>

" return for newline in movement mode
nmap <CR> o <Esc>
nmap <S-CR> O <Esc>
" ctrl+k to kill line
noremap <C-K> dd
inoremap <C-K> <esc> ddi
" ctrl+j for to insert line break/new line
nnoremap <NL> i <CR> <ESC>
" Copy line from caret to EOL
map Y y$


" ================================= PLUGINS ========================================================
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin()
call plug#begin('~/.vim/plugged')

" vim-latex: aka latex-suite
Plug 'vim-latex/vim-latex'
" Language syntax highlighting and functionality
" Plug 'vim-scripts/gnuplot-syntax-highlighting'
if !has('nvim')
    Plug 'plasticboy/vim-markdown' " Causes problems (at least in nvim)
endif
Plug 'rodjek/vim-puppet'
" Go: vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" QML: vim-qml
Plug 'peterhoeg/vim-qml'
" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Ruby
Plug 'vim-ruby/vim-ruby'

" Editorconfig: use editorconfig.org files
Plug 'editorconfig/editorconfig-vim'
" nerdcommenter: Commenting functionality
Plug 'preservim/nerdcommenter'
" delimitMate: auto-completion of paranthesis, etc.
Plug 'Raimondi/delimitMate'
" Star-search:
Plug 'vim-scripts/star-search'
" Matchit: extended matching for % operator (HTML, ...)
" Plug 'adelarsq/vim-matchit'
" Tabular: indent visual selection wrt. to characters that can be specified
Plug 'godlygeek/tabular'

" Indentline: display indentation lines
Plug 'Yggdroot/indentLine'
" vim-css-color: Preview colours in source code while editing
Plug 'ap/vim-css-color'

" vim-fugitive:
Plug 'tpope/vim-fugitive'
" vim-obsession: enhance vim sessions (auto-save, statusline, support directories)
Plug 'tpope/vim-obsession'

" Taglist: Source Code Browser plugin for Vim
" Plug 'yegappan/taglist'
" Tagbar: a class outline viewer vor VIM
Plug 'preservim/tagbar'
" Nerdtree: The NERDTree is a file system explorer for the Vim editor.
Plug 'preservim/nerdtree'
" Nerdtree tabs: This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plug 'jistr/vim-nerdtree-tabs'
" VIM Nerdtree Syntax Highlighting: does what the name implies. TODO It's slow!
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" VIM DevIcons: Icons/glyphs for filetypes, folders etc.
Plug 'ryanoasis/vim-devicons'
" Nerd Fonts: project patching developer targeted fonts with a high number of glyphs (icons)
" Plug 'ryanoasis/nerd-fonts'

" ctags: This script uses exuberant ctags to build the list of tags for the current file.
" Plug 'vim-scripts/ctags.vim'

" vim-ctags: Simple VIm plugin to manage ctags index.
" Plug 'webastien/vim-ctags'

" Airline: statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSApprox:
" Plug 'godlygeek/CSApprox'

" Color themes:
Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

if has('nvim')
    " nvim-only settings
    " LSP config: collection of common configurations for Neovim's built-in language server client
    Plug 'neovim/nvim-lspconfig'
    " " === LSP and autocompletion ===
    " Use release branch (recommended)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=0
    " let g:tex_conceal='abdmg'
    let g:vimtex_compiler_latexmk = { 'options' : [ '-pdf', '-pdflatex="xelatex --shell-escape %O %S"', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode',  ] }
    map <leader>mb :VimtexCompile<cr>
    map <leader>mee :VimtexErrors<cr>
    autocmd FileType tex setlocal ts=2 sw=2 sts=0 expandtab spell
    let g:vimtex_complete_enabled = 1
    let g:vimtex_complete_close_braces = 1
    let g:vimtex_complete_ignore_case = 1
    let g:vimtex_complete_smart_case = 1
    let g:vimtex_compiler_progname='nvr'
    " set spell spelllang=en_us
    " set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    autocmd FileType tex setlocal ts=2 sw=2 sts=0 expandtab spell
    Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger='<c-h>'
    let g:UltiSnipsJumpForwardTrigger='<c-h>'
    let g:UltiSnipsJumpBackwardTrigger='<c-g>'
    let g:UltiSnipsSnippetDirectories=['UltiSnips', '$HOME/.config/nvim/snippets/UltiSnips/']
    " Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
    " Plug 'hrsh7th/cmp-buffer'
    " Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
    " Snippet engines
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip' " lua snippet completion source for nvim-cmp
    " Plug 'latex-lsp/texlab' " LaTeX LSP server. Or install from OS repos
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
    " YouCompleteMe: is a fast, as-you-type, fuzzy-search code completion engine for Vim.
    " See: https://valloric.github.io/YouCompleteMe/
    Plug 'Valloric/YouCompleteMe'
endif

" Vim-diagram: syntax highlighting for Mermaid Markdown-ish diagrams
" Plug 'zhaozg/vim-diagram'

" Initialize plugin system
call plug#end()

" ~~~ Plugin settings ~~~

" Colorscheme
" Important!!
if has('termguicolors')
    set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" colorscheme gruvbox-material
" let g:sonokai_style = 'andromeda'
colorscheme sonokai

" Airline
" custom z section (line/column numbers) bc. column nr. was cut off with default
let g:airline_section_z = "%p%% ☲ %l/%L: %c" " powerline line number symbol: \ue0a1
" let g:airline_section_z = ''
let g:airline_theme = 'sonokai' " adjust when changing colorscheme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep="\uE0B0"
let g:airline_right_sep="\uE0B2"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_symbols.linenr='¶'
" let g:airline_symbols.paste='∥'
let g:airline_symbols.whitespace='‿' "'☲' 'Ξ'
" Needs vim-fugitive
let g:airline#extensions#branch#enabled = 1
let g:airline_symbols.branch="\uE0A0" " requires font with powerline glyphs

" Tagbar:
nmap <F10> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Nerdtree:
" Open Nerdtree when vim starts - comment out to prevent
" autocmd VimEnter * NERDTree
" Map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle <CR>
" autocmd VimEnter * NERDTreeClose " Doesn't work, still opens on startup
let g:NERDTreeHijackNetrw=0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Nerdtree Syntax Highlight: mostly performance tweaks, otherwise it's quite laggy
" Disable some highlighting matches to improve performance
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeLimitedSyntax = 1 " limit syntax for the most popular extensions
" Disable default extension highlighting
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" Add file extensions to be highlighted
" let g:NERDTreeSyntaxEnabledExtensions = ['bashrc', 'vimrc', 'conf', 'gitconfig', 'gitignore']
" disable cursorline in Nerdtree, reducing some regex execution and lag
let NERDTreeHighlightCursorline = 0

" NerdCommenter:
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" IndentLine:
let g:indentLine_char_list = ['┊'] "'|', '¦', '┆',

" YouCompleteMe
" Install: cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer
" Select key mapping for scrolling the completion list.
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

if has('nvim')
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ CheckBackspace() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " coc.source.vimtex.enable
    hi default CocUnderline cterm=underline gui=undercurl
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


" =============================== Auto Commands ===============================
" augroup tags
"   autocmd!
"   " clean up ctags file on exit
"   autocmd VimLeave * !rm .tags
"   " (re-)create ctags file on save TODO this is not save to execute just
"   anywhere (for example home dir will take forever!)
"   autocmd BufWritePost,FileWritePost * !ctags -R -f .tags *
" augroup end


" =============================== latex ===============================
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
" disable conceal to prevent rendering of symbols
let g:tex_conceal = ""
autocmd Filetype tex setlocal nofoldenable wrap linebreak nolist
autocmd Filetype tex setlocal textwidth=0 wrapmargin=0 formatoptions+=l
autocmd Filetype tex setlocal spell spelllang=de,en
" autocmd Filetype tex setlocal makeprg=make
augroup tex
    let g:indentLine_enabled=0 " IndentLine activates conceal which renders like shit
augroup end


" === NVIM ===
" if has('nvim')
"   " nvim-only settings
" else
"   " vim-only settings
" endif

