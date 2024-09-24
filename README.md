# Nvim
NeoVim config

This repository is the configuration of the NeoVim code editor that Gabriel Frigo uses

# Plug
For install [plug](https://github.com/junegunn/vim-plug) manager uses

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```pwsh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

# Rocks
For install [rocks](https://github.com/nvim-neorocks/rocks.nvim) manager uses

```sh
nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
```

# [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
```bash
apt install wl-clipboard
```

# [xclip](https://github.com/astrand/xclip)
```bash
apt install xclip
```
