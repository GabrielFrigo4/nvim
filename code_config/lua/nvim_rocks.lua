local rocks_config
if Nvim.isWin then
    rocks_config = {
        rocks_path = Nvim.func.stdpath("data") .. "/rocks",
        luarocks_binary = "luarocks.bat"
    }
else
    rocks_config = {
        rocks_path = Nvim.func.stdpath("data") .. "/rocks",
    }
end

Nvim.global.rocks_nvim = rocks_config

local luarocks_path = {
    Nvim.filesys.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    Nvim.filesys.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath
if Nvim.isWin then
    luarocks_cpath = {
        Nvim.filesys.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
        Nvim.filesys.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
    }
else
    luarocks_cpath = {
        Nvim.filesys.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        Nvim.filesys.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
end
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

Nvim.option.runtimepath:append(Nvim.filesys.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))