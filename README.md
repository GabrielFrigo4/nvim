# Nvim
NeoVim config

This repository is the configuration of the NeoVim code editor that Gabriel Frigo uses

# Plug
For install [plug](https://github.com/junegunn/vim-plug) manager uses

__ZSH__
```zsh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

__PWSH__
```pwsh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

# Rocks
For install [rocks](https://github.com/nvim-neorocks/rocks.nvim) manager uses

__UNIX__
```zsh
nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
```

__WIN__
```pwsh
luarocks --lua-version=5.1 --tree "C:\Users\gabri\AppData\Local\nvim-data\rocks" --server='https://nvim-neorocks.github.io/rocks-binaries/' install rocks.nvim
```

## Rocks Packages

```sh
:Rocks install neorg
```

# [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
```zsh
yay -S wl-clipboard
```

# [xclip](https://github.com/astrand/xclip)
```zsh
yay -S xclip
```

# [win32yank](https://github.com/equalsraf/win32yank)
```pwsh
winget install equalsraf.win32yank
```