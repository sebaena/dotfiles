
-- -- Use this function from init.lua to set color theme more easily
-- -- Set as default always gruvbox. Can pass null to keep some default fields
-- function SetThemeManually(color, background, transparency)
-- 	color = color or "embark"
-- 	background = background or "dark"
-- 	vim.cmd.colorscheme(color)
-- 	vim.o.background = background

-- 	if not transparency then
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	end

-- end

-- function SetDarkTheme(color, transparency)
-- 	color = color or "rose-pine-moon" -- set some default
--     SetThemeManually(color, "dark", transparency)
-- end

-- function SetLightTheme(color, transparency)
-- 	color = color or "gruvbox" -- set some default
--     SetThemeManually(color, "light", transparency)
-- end

