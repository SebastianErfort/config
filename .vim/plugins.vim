" vim-plug " <--
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

" ~~~ EDITING ~~~
" nerdcommenter: Commenting functionality
Plug 'preservim/nerdcommenter' " nvim
" delimitMate: auto-completion of paranthesis, etc.
Plug 'Raimondi/delimitMate' " nvim
" Matchit: extended matching for % operator (HTML, ...)
" Plug 'adelarsq/vim-matchit'
" Tabular: indent visual selection wrt. to characters that can be specified
Plug 'godlygeek/tabular' " nvim
" ctags: This script uses exuberant ctags to build the list of tags for the current file.
" Plug 'vim-scripts/ctags.vim'
" vim-ctags: Simple VIm plugin to manage ctags index.
" Plug 'webastien/vim-ctags'

" YouCompleteMe: is a fast, as-you-type, fuzzy-search code completion engine for Vim.
" See: https://valloric.github.io/YouCompleteMe/
Plug 'Valloric/YouCompleteMe'

" ~~~ APPEARANCE ~~~
" Indentline: display indentation lines
Plug 'Yggdroot/indentLine'
" Airline: statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" VIM DevIcons: Icons/glyphs for filetypes, folders etc.
Plug 'ryanoasis/vim-devicons' " nvim
" Color theme
" Plug 'sainnhe/sonokai' " nvim
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" ~~~ UTILITY ~~~
" Tagbar: a class outline viewer vor VIM
Plug 'preservim/tagbar' " nvim
" Nerdtree: The NERDTree is a file system explorer for the Vim editor.
Plug 'preservim/nerdtree'
" Nerdtree tabs: This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plug 'jistr/vim-nerdtree-tabs'
" VIM Nerdtree Syntax Highlighting: does what the name implies. TODO It's slow!
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim-obsession: enhance vim sessions (auto-save, statusline, support directories)
Plug 'tpope/vim-obsession' " nvim
" vim-fugitive:
Plug 'tpope/vim-fugitive' " nvim

" ~~~ FILETYPES ~~~
Plug 'rodjek/vim-puppet'

" Initialize plugin system
call plug#end() " -->

" Colorscheme
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" colorscheme gruvbox-material
" let g:sonokai_style = 'andromeda'
" colorscheme sonokai
colorscheme catppuccin_macchiato

" Airline
" custom z section (line/column numbers) bc. column nr. was cut off with default
let g:airline_section_z = "%p%% ☲ %l/%L: %c" " powerline line number symbol: \ue0a1
" let g:airline_section_z = ''
let g:airline_theme = 'catppuccin_macchiato' " adjust when changing colorscheme
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
" for vim-fugitive
let g:airline#extensions#branch#enabled = 1
let g:airline_symbols.branch="\uE0A0" " requires font with powerline glyphs

" Tagbar
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

" IndentLine: symbol (multiple possible for different levels)
let g:indentLine_char_list = ['┊'] "'|', '¦', '┆',

" YouCompleteMe
" Install: cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer
" Select key mapping for scrolling the completion list.
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
