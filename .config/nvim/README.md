## Config
### Using vim config: .vimrc
https://github.com/nanotee/nvim-lua-guide#runtime-files
Most vim config can be used just as well in neovim. Just change your runtime path and source your vimrc.
```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

### Lua files
https://github.com/nanotee/nvim-lua-guide

[Modules](https://github.com/nanotee/nvim-lua-guide#modules)
Config can be split up by including (lua) files. The tree structure should be something like
```
📂 ~/.config/nvim
├── 📂 lua
│   └─ config.lua
└── init.vim
```
allowing includes in your `init.vim` like
```vim
lua require('config')
```
[Sourcing Lua files](https://github.com/nanotee/nvim-lua-guide#sourcing-lua-files)
> Neovim provides 3 Ex commands to source Lua files
>   `:luafile`
>   `:source`
