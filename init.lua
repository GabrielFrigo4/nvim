-- ################################
-- # Nvim-Lua Table Variables
-- ################################


-- Nvim Table Var
Nvim = {
    -- check bool variables
    isWin = vim.fn.has('win32') == 1,
    isUnix = vim.fn.has('unix') == 1,

    -- nvim table variables
    api = vim.api,
    global = vim.g,
    option = vim.opt,
    keymap = vim.keymap,
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
        luaFile = function(filePath, isLuaDir)
            local _path = nil
            if isLuaDir then
                _path = Nvim.path.appData .. '\\code_config\\lua\\' .. filePath .. '.lua'
            else
                _path = Nvim.path.appData .. '\\code_config\\' .. filePath .. '.lua'
            end
            return dofile(Nvim.path.winOrUnix(_path))
        end,
        vimFile = function(filePath, isVimDir)
            local _path = nil
            if isVimDir then
                _path = Nvim.path.appData .. '\\code_config\\vim\\' .. filePath .. '.vim'
            else
                _path = Nvim.path.appData .. '\\code_config\\' .. filePath .. '.vim'
            end
            vim.cmd('source ' .. Nvim.path.winOrUnix(_path))
        end
    },

    -- plug table variables
    plug = {
        get = vim.fn['plug#'],
        init = function()
            Nvim.call.fn('plug#begin')
        end,
        close = function()
            Nvim.call.fn('plug#end')
        end,
    },
}

-- Call Nvim Lua Config
Nvim.call.luaFile('config', false)

-- Call Nvim Vim Config
Nvim.call.vimFile('config', false)
