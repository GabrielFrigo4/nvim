-- ============================================================================
--  Nvim-Lua Clipboard
-- ============================================================================
-- {{{

if Nvim.isWsl then
    if Nvim.func.executable("wl-copy") == 1 and Nvim.func.executable("wl-paste") == 1 then
        Nvim.global.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = 'wl-copy --foreground --type text/plain',
                ["*"] = 'wl-copy --foreground --type text/plain',
            },
            paste = {
                ["+"] = (function()
                    return Nvim.func.systemlist('wl-paste --no-newline | sed -e "s/\r$//"', { '' }, 1)
                end),
                ["*"] = (function()
                    return Nvim.func.systemlist('wl-paste --no-newline | sed -e "s/\r$//"', { '' }, 1)
                end),
            },
            cache_enabled = true
        }
    elseif Nvim.func.executable("xclip") == 1 then
        Nvim.global.clipboard = {
            name = "xclip (wsl)",
            copy = {
                ["+"] = 'xclip -i -selection clipboard',
                ["*"] = 'xclip -i -selection clipboard',
            },
            paste = {
                ["+"] = (function()
                    return Nvim.func.systemlist('xclip -o -selection clipboard | sed -e "s/\r$//"', { '' }, 1)
                end),
                ["*"] = (function()
                    return Nvim.func.systemlist('xclip -o -selection clipboard | sed -e "s/\r$//"', { '' }, 1)
                end),
            },
            cache_enabled = true
        }
    elseif Nvim.func.executable("win32yank.exe") == 1 then
        Nvim.global.clipboard = {
            name = 'win32yank (wsl)',
            copy = {
                ['+'] = 'win32yank.exe -i --crlf',
                ['*'] = 'win32yank.exe -i --crlf',
            },
            paste = {
                ['+'] = 'win32yank.exe -o --lf',
                ['*'] = 'win32yank.exe -o --lf',
            },
            cache_enabled = true,
        }
    elseif Nvim.func.executable("pwsh.exe") == 1 and Nvim.func.executable("clip.exe") == 1 then
        Nvim.global.clipboard = {
            name = 'pwsh and clip (wsl)',
            copy = {
                ['+'] = 'clip.exe',
                ['*'] = 'clip.exe',
            },
            paste = {
                ['+'] =
                'pwsh.exe -nol -nop -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("""`r""", """"""))',
                ['*'] =
                'pwsh.exe -nol -nop -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("""`r""", """"""))',
            },
            cache_enabled = true,
        }
    else
        error("don't find clipboard executable utils!")
    end
end

-- }}}
