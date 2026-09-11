---
name: universal-neovim
description: >-
    Operational runbook for maintaining, testing, and debugging Gabriel Frigo's NeoVim configuration.
    Use when updating Lazy.nvim plugins, configuring Mason LSPs, adding keymaps, or verifying headless startup.
---

# Universal NeoVim — Operational Runbook

Este guia detalha o fluxo operacional para gerenciar, auditar e testar a configuração do NeoVim.

---

## 1. Teste de Inicialização em Modo Headless

Sempre valide o startup do Neovim antes de commitar alterações:

```sh
nvim --headless -c "quit"
```

O comando deve retornar código de saída 0 sem qualquer saída de erro no `stderr`.

---

## 2. Gerenciamento de Plugins via Lazy.nvim

- Sincronizar plugins: `:Lazy sync`
- Verificar status de plugins: `:Lazy`
- Atualizar gramáticas TreeSitter: `:TreeSitterSetup` ou `:TSUpdate`
- Instalar servidores de LSP pendentes: `:LSPInstall`
- Recarregar servidores LSP: `:LSPLoad`

---

## 3. Sincronização de Dotfiles

Para vincular esta configuração ao diretório oficial do Neovim:

```sh
mkdir -p "${HOME}/.config/nvim"
ln -sf "$(pwd)/init.lua" "${HOME}/.config/nvim/init.lua"
ln -sf "$(pwd)/lua" "${HOME}/.config/nvim/lua"
```
