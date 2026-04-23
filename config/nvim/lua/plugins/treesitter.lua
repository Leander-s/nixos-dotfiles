return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"python",
				"javascript",
				"typescript",
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"rust",
				"go",
				"html",
				"cmake",
				"json",
				"css",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"python",
					"javascript",
					"typescript",
					"c",
					"cpp",
					"lua",
					"vim",
					"markdown",
					"rust",
					"go",
					"html",
					"cmake",
					"json",
					"css",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
