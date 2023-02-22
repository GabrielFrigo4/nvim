-- Nvim var
Nvim = {
    map = vim.api.nvim_set_keymap,
    isWin = vim.fn.has('win32') == 1,
    isUnix = vim.fn.has('unix') == 1,
    path = {
        lib = vim.api.nvim_list_runtime_paths()[3],
        appData = vim.api.nvim_list_runtime_paths()[1],
        shareRuntime = vim.api.nvim_list_runtime_paths()[2],
        binRuntime = vim.api.nvim_list_runtime_paths()[4],
        winOrUnix = function (strPath)
            if Nvim.isWin then
                strPath = strPath:gsub("/", "\\")
            elseif Nvim.isUnix then
                strPath = strPath:gsub("\\", "/")
            end
            return strPath
        end
    },
    callLuaFile = function(filePath, isLuaDir)
        local _path = nil
        if isLuaDir then
            _path = Nvim.path.appData..'\\code_config\\lua\\'..filePath..'.lua'
        else
            _path = Nvim.path.appData..'\\code_config\\'..filePath..'.lua'
        end
        return dofile(Nvim.path.winOrUnix(_path))
    end,
    callVimFile = function(filePath, isVimDir)
        local _path = nil
        if isVimDir then
            _path = Nvim.path.appData..'\\code_config\\vim\\'..filePath..'.vim'
        else
            _path = Nvim.path.appData..'\\code_config\\'..filePath..'.vim'
        end
        vim.cmd('source '..Nvim.path.winOrUnix(_path))
    end
}

Nvim.callLuaFile('config', false)