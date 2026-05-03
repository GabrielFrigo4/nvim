-- ============================================================================
--  Nvim-Lua Configuration
-- ============================================================================
-- {{{

local path = vim.fn.stdpath('config') .. '/lua/etc'

for name, type in vim.fs.dir(path) do
	if type == 'file' and name:match('%.lua$') and name ~= 'init.lua' then
		local module_name = name:gsub('%.lua$', '')
		require('etc.' .. module_name)
	end
end

-- }}}
