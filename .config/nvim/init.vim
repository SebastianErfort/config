set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
" LSP servers
" lua require'lspconfig'.pyright.setup{}
" lua require('lspconfig')['python-lsp-server'].setup({on_attach = on_attach})
