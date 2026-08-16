return {
	{
		"lervag/vimtex",
		lazy = false,

		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"

			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-lualatex",
			}

			vim.g.vimtex_compiler_latexmk = {
				out_dir = "build",
				continuous = 1,
				callback = 1,
				options = {
					"-verbose",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}

			vim.api.nvim_create_autocmd("User", {
				pattern = "VimtexEventInitPost",
				callback = function()
					vim.cmd("VimtexCompile!")
				end,
			})
		end,
	},
}
