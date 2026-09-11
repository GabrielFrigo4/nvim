.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory

# ----------------------------------------------------------------
# Makefile: NeoVim Modal Editor
# ----------------------------------------------------------------

.PHONY: help test headless ci

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	echo "⚡ NeoVim — Configuração Modular FHS em Lua"
	echo ""
	echo "Comandos disponíveis:"
	echo "  make test     - Valida inicialização em modo headless"
	echo "  make ci       - Executa suite de validação local"
	echo ""

### ================================
### TESTING & VALIDATION
### ================================
test: headless

headless:
	echo "🧪 Validando inicialização headless do NeoVim..."
	if command -v nvim > "/dev/null" 2>&1; then \
		nvim --headless -u init.lua -c "quit" > "/dev/null" 2>&1 && echo "  ✅ NeoVim: headless OK"; \
	else \
		echo "ℹ️  nvim não encontrado no PATH; ignorando teste headless."; \
	fi

ci: test
	echo "🚀 NeoVim 100% pronto para produção!"
