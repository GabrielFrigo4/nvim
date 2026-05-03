<div align="center">
  <h1>🌟 Gabriel Frigo's Neovim</h1>
  <p><i>A highly customized, Unix-like structured Neovim setup.</i></p>
</div>

---

## 📁 Directory Structure (Unix-like FHS)

This configuration adopts a Unix-like Filesystem Hierarchy Standard (FHS) to keep the `lua/` directory clean and highly organized:

- **`lua/etc/`**: Core configurations (`options.lua`, `keymaps.lua`, `autocmds.lua`, `clipboard.lua`).
- **`lua/lib/`**: Custom library and utility functions (`nvim.lua`).
- **`lua/opt/`**: Plugin managers and their setups (`lazy.lua`, `lsp.lua`, `treesitter.lua`, `plug.lua`).

## 📋 TODO

*Keep track of future ideas and improvements here:*

---

## 📦 Plugin Managers

Instructions to install the supported plugin managers.

### [vim-plug](https://github.com/junegunn/vim-plug)
**ZSH (Unix):**
```zsh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

**PWSH (Windows):**
```pwsh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

### [rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim)
**UNIX:**
```zsh
nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
```

**WIN ([Lua Tools in Scoop](https://github.com/nvim-neorocks/rocks-scoop)):**
```pwsh
luarocks --lua-version=5.1 --tree "C:\Users\gabri\AppData\Local\nvim-data\rocks" --server='https://nvim-neorocks.github.io/rocks-binaries/' install rocks.nvim
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)
Lazy is installed and configured automatically via the `lua/opt/lazy.lua` setup.

---

## 📋 Clipboard Dependencies

To enable system clipboard integration, install one of the following depending on your OS and display server:

- **[wl-clipboard](https://github.com/bugaevc/wl-clipboard)** (Wayland):
  ```zsh
  yay -S wl-clipboard
  ```
- **[xclip](https://github.com/astrand/xclip)** (X11):
  ```zsh
  yay -S xclip
  ```
- **[xsel](https://github.com/kfish/xsel)** (X11 Alternative):
  ```zsh
  yay -S xsel
  ```
- **[win32yank](https://github.com/equalsraf/win32yank)** (Windows):
  ```pwsh
  winget install equalsraf.win32yank
  ```
