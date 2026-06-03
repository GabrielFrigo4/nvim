-- ============================================================================
--  Nvim-Lua Packages
-- ============================================================================
-- {{{

local path = vim.fn.stdpath('config') .. '/lua/opt'

local files = {}
for name, type in vim.fs.dir(path) do
	if type == 'file' and name:match('%.lua$') and name ~= 'init.lua' then
		table.insert(files, name)
	end
end

table.sort(files)

for i, name in ipairs(files) do
	if name == 'lazy.lua' then
		table.remove(files, i)
		table.insert(files, 1, 'lazy.lua')
		break
	end
end

for _, name in ipairs(files) do
	local module_name = name:gsub('%.lua$', '')
	require('opt.' .. module_name)
end

-- }}}
