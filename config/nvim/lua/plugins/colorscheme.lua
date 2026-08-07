return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = function()
			function _G.ColorMyPencils(color)
				color = color or "rose-pine"
				vim.cmd.colorscheme(color)
				vim.opt.colorcolumn = ""
				vim.opt.fillchars:append({ eob = " " }) -- Remove the ~ from end of buffer

				local transparent_groups = {
					"TelescopeBorder",
					"NormalNC",
					"Normal",
					"SignColumn",
					"FoldColumn",
					"EndOfBuffer",
					"LineNr",
					"CursorLineNr",
					"WinSeparator",
					"VertSplit",
					"NormalFloat",
					"FloatBorder",
				}

				for _, group in ipairs(transparent_groups) do
					vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
				end
			end

			ColorMyPencils()
		end,
	},
}
