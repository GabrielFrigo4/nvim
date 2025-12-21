# Nvim
 NeoVim config

 This repository is the configuration of the NeoVim code editor that Gabriel Frigo uses

# Plug
 For install [plug](https://github.com/junegunn/vim-plug) manager package uses

## ZSH
 ```zsh
 sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 ```

## PWSH
 ```pwsh
 iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
     ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
 ```

# Rocks
 For install [rocks](https://github.com/nvim-neorocks/rocks.nvim) manager package uses

## UNIX
 ```zsh
 nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
 ```

## WIN
 Install [Lua Tools in Scoop](https://github.com/nvim-neorocks/rocks-scoop)
 ```pwsh
 luarocks --lua-version=5.1 --tree "C:\Users\gabri\AppData\Local\nvim-data\rocks" --server='https://nvim-neorocks.github.io/rocks-binaries/' install rocks.nvim
 ```

# Lazy
 For install [lazy](https://github.com/folke/lazy.nvim) manager package uses

# [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
 ```zsh
 yay -S wl-clipboard
 ```

# [xclip](https://github.com/astrand/xclip)
 ```zsh
 yay -S xclip
 ```

# [xsel](https://github.com/kfish/xsel)
 ```zsh
 yay -S xsel
 ```

# [win32yank](https://github.com/equalsraf/win32yank)
 ```pwsh
 winget install equalsraf.win32yank
 ```
