### Links
[This Week in Neovim](https://this-week-in-neovim.org/)

- [Auto-run command (after save) @YouTube](https://www.youtube.com/watch?v=9gUatBHuXE0)
  - https://github.com/stevearc/overseer.nvim
- [lemmy-help: vim help doc from lua plugin](https://github.com/numToStr/lemmy-help)
- [Blog-entry switching from CoC to neovim native LSP](https://www.vikasraj.dev/blog/lsp-neovim-retrospective)
- [reddit discussion about neovim plugins and configuration overhead](https://www.reddit.com/r/neovim/comments/wehqqr/some_constructive_criticism_for_the_hard_working/)


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
