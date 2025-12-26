-- ============================================================================
--  Nvim-Lua Table Variables
-- ============================================================================
-- {{{

-- Nvim Table Var
Nvim = {
    -- check bool variables
    isWin = vim.fn.has('win32') == 1,
    isUnix = vim.fn.has('unix') == 1,
    isWsl = vim.fn.has('wsl') == 1,

    -- nvim table variables
    var = vim.v,
    uv = vim.uv,
    api = vim.api,
    lsp = vim.lsp,
    global = vim.g,
    option = vim.opt,
    guioption = vim.go,
    winoption = vim.wo,
    keymap = vim.keymap,
    filesys = vim.fs,
    func = vim.fn,
    cmd = vim.cmd,
    augroup = vim.api.nvim_create_augroup,
    autocmd = vim.api.nvim_create_autocmd,
    path = {
        lib = vim.api.nvim_list_runtime_paths()[3],
        appData = vim.api.nvim_list_runtime_paths()[1],
        shareRuntime = vim.api.nvim_list_runtime_paths()[2],
        binRuntime = vim.api.nvim_list_runtime_paths()[4],
        winOrUnix = function(strPath)
            if Nvim.isWin then
                strPath = strPath:gsub("/", "\\")
            elseif Nvim.isUnix then
                strPath = strPath:gsub("\\", "/")
            end
            return strPath
        end
    },

    -- call table variables
    call = {
        fn = vim.call,
        file = {
            lua = function(filePath, isLuaDir)
                local _path = nil
                if isLuaDir then
                    _path = Nvim.path.appData .. '\\scripts\\lua\\' .. filePath .. '.lua'
                else
                    _path = Nvim.path.appData .. '\\scripts\\' .. filePath .. '.lua'
                end
                return dofile(Nvim.path.winOrUnix(_path))
            end,
            vim = function(filePath, isVimDir)
                local _path = nil
                if isVimDir then
                    _path = Nvim.path.appData .. '\\scripts\\vim\\' .. filePath .. '.vim'
                else
                    _path = Nvim.path.appData .. '\\scripts\\' .. filePath .. '.vim'
                end
                Nvim.cmd('source ' .. Nvim.path.winOrUnix(_path))
            end,
        },
    },

    -- plug table variables
    plug = {
        get = function(...)
            Nvim.func['plug#'](...)
        end,
        init = function()
            Nvim.call.fn('plug#begin')
        end,
        close = function()
            Nvim.call.fn('plug#end')
        end,
    },

    -- lazy table variables
    lazy = {
        setup = function()
            local lazypath = Nvim.func.stdpath("data") .. "/lazy/lazy.nvim"
            if not Nvim.uv.fs_stat(lazypath) then
                local lazyrepo = "https://github.com/folke/lazy.nvim.git"
                local out = Nvim.func.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
                    lazypath })
                if Nvim.var.shell_error ~= 0 then
                    Nvim.api.nvim_echo({
                        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                        { out,                            "WarningMsg" },
                        { "\nPress any key to exit..." },
                    }, true, {})
                    Nvim.func.getchar()
                    os.exit(1)
                end
            end
            Nvim.option.rtp:prepend(lazypath)
        end,
    },
}

-- Call Nvim Lua Config
Nvim.call.file.lua('config', false)

-- Call Nvim Vim Config
Nvim.call.file.vim('config', false)

-- }}}
