-- ################################
-- # Nvim-Lua Clipboard
-- ################################


if Nvim.isWsl then
    if Nvim.func.executable("wl-copy") == 1 and Nvim.func.executable("wl-paste") == 1 then
        Nvim.global.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = 'wl-copy --foreground --type text/plain',
                ["*"] = 'wl-copy --foreground --primary --type text/plain',
            },
            paste = {
                ["+"] = (function()
                    return Nvim.func.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { '' }, 1)
                end),
                ["*"] = (function()
                    return Nvim.func.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { '' }, 1)
                end),
            },
            cache_enabled = true
        }
    elseif Nvim.func.executable("xclip") == 1 then
        Nvim.global.clipboard = {
            name = "xclip (wsl)",
            copy = {
                ["+"] = 'xclip -i -selection clipboard',
                ["*"] = 'xclip -i -selection primary',
            },
            paste = {
                ["+"] = 'xclip -o -selection clipboard',
                ["*"] = 'xclip -o -selection primary',
            },
            cache_enabled = true
        }
    elseif Nvim.func.executable("win32yank.exe") == 1 then
        Nvim.global.clipboard = {
            name = 'win32yank.exe (wsl)',
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
    elseif Nvim.func.executable("pwsh") == 1 then
        Nvim.global.clipboard = {
            name = 'pwsh (wsl)',
            copy = {
                ['+'] = 'pwsh -nop -c Set-Clipboard',
                ['*'] = 'pwsh -nop -c Set-Clipboard',
            },
            paste = {
                ['+'] = 'pwsh -nop -c Get-Clipboard',
                ['*'] = 'pwsh -nop -c Get-Clipboard',
            },
            cache_enabled = true,
        }
    elseif Nvim.func.executable("pwsh.exe") == 1 then
        Nvim.global.clipboard = {
            name = 'pwsh.exe (wsl)',
            copy = {
                ['+'] = 'pwsh.exe -nop -c Set-Clipboard',
                ['*'] = 'pwsh.exe -nop -c Set-Clipboard',
            },
            paste = {
                ['+'] = 'pwsh.exe -nop -c Get-Clipboard',
                ['*'] = 'pwsh.exe -nop -c Get-Clipboard',
            },
            cache_enabled = true,
        }
    else
        error("don't find clipboard executable utils!")
    end
end
