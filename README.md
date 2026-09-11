# ⚡ NeoVim Configuration

> Configuração modular, declarativa e resiliente do NeoVim com arquitetura FHS em Lua, Lazy.nvim, Mason LSP e tema Kanagawa.

[![Environment](https://img.shields.io/badge/🏛️_Environment-Hub-blue)](https://github.com/GabrielFrigo4/environment)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Lua](https://img.shields.io/badge/lua-5.1%20%2F%20luajit-blue)](init.lua)

---

## 🧭 Visão Geral

Este repositório contém a configuração oficial do **NeoVim** de Gabriel Frigo, integrando a **Suíte de Editores** do [Universal Environment](https://github.com/GabrielFrigo4/environment). A estrutura adota a convenção de hierarquia UNIX FHS (`etc/`, `lib/`, `opt/`) para clareza e manutenção desacoplada.

- **Modularidade & Resiliência:** Carregamento protegido com `pcall` em `lua/opt/init.lua` para garantir inicialização sem falhas.
- **Ecossistema Lazy.nvim:** Instalação e gestão declarativa e assíncrona de plugins.
- **Mason LSP:** Gestão e autoconfiguração de Language Servers com fallback de capabilities.
- **Tema Kanagawa:** Visual relaxante e tema com fallback silencioso para `habamax` / `default`.

---

## 📁 Catálogo da Estrutura

| Diretório / Arquivo                | Descrição                                                                       |
| :--------------------------------- | :------------------------------------------------------------------------------ |
| [`init.lua`](init.lua)             | Ponto de entrada que carrega em ordem `lib`, `etc` e `opt`                      |
| [`lua/etc/`](lua/etc/)             | Opções do editor (`options.lua`), atalhos (`keymaps.lua`), autocmds e clipboard |
| [`lua/lib/`](lua/lib/)             | Bibliotecas auxiliares e utilitários (`nvim.lua`)                               |
| [`lua/opt/`](lua/opt/)             | Plugins: `lazy.lua`, `lsp.lua` (Mason), `treesitter.lua`, `plug.lua`            |
| [`AGENTS.md`](AGENTS.md)           | Briefing arquitetural para agentes de inteligência artificial                   |
| [`PRINCIPLES.md`](PRINCIPLES.md)   | Os 18 Princípios de Engenharia UNIX + Clean Code                                |
| [`ENVIRONMENT.md`](ENVIRONMENT.md) | Manifesto do ecossistema Universal Environment                                  |

---

## 🚀 Instalação e Uso Rápido

### 1. Vincular via Profile

```sh
# Sincronização automática via Universal Environment
make sync

# Ou criação manual de links
mkdir -p "${HOME}/.config/nvim"
ln -sf "$(pwd)/init.lua" "${HOME}/.config/nvim/init.lua"
ln -sf "$(pwd)/lua" "${HOME}/.config/nvim/lua"
```

### 2. Validação Headless

```sh
nvim --headless -c "quit"
```
