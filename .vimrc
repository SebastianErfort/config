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

" use system clipboard if the os implementation gods smile upon us
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" Syntax highlighting, filetype detection
syntax on " Set syntax highlighting. Needs to be before filetype ... on to be working in split windows.
filetype indent plugin on " Filetype detection
au BufNewFile,BufRead *.{gp,gpl,gpls,gplt,gnuplot,gnu,GNU,pal} setf gnuplot
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
autocmd FileType fortran setlocal shiftwidth=3 softtabstop=-1 foldmethod=indent
" YAML: so far poor support of syntax fold
autocmd FileType yaml setlocal foldmethod=indent shiftwidth=2 softtabstop=-1 foldmethod=indent
" Markdown: so far poor support of syntax fold
autocmd FileType markdown setlocal foldmethod=indent
" (La)TeX
autocmd FileType tex setlocal ts=2 sw=2 sts=0 spell

" (c)tags file
set tags=.tags


" ================================= MAPPINGS ========================================================
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
if has('nvim')
    " TODO lua-ify and move to nvim config 
    map <C-n> :NvimTreeToggle <CR>
else
    " Load plugins using vim-plug
    source ~/.vim/plugins.vim
endif
" For NeoVIM (nvim) using lazy.nvim

" Colorscheme
" Important!
if has('termguicolors')
    set termguicolors
endif
" For dark version.
set background=dark


" =============================== FILETYPES ===============================

" ~~~ (La)TeX ~~~
autocmd Filetype tex setlocal nofoldenable wrap linebreak nolist
autocmd Filetype tex setlocal textwidth=0 wrapmargin=0 formatoptions+=l
autocmd Filetype tex setlocal spell spelllang=de,en
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
augroup tex
    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
    " to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'
    let g:Tex_SmartKeyQuote=0
    " disable conceal to prevent rendering of symbols
    let g:tex_conceal = ""
    let g:indentLine_enabled=0 " IndentLine activates conceal which renders like shit
    " autocmd Filetype tex setlocal makeprg=make
augroup end


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


" ========================================= GVIM ===============================
" GVim Setting
set guioptions-=m     " remove menu bar
set guioptions-=T     " remove toolbar
set guioptions-=r     " remove right-hand scroll bar
set guioptions-=L     " remove left-hand scroll bar
