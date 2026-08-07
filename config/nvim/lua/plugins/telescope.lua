local telescope = require("telescope.builtin")

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>pp",
				function()
					telescope.lsp_document_symbols()
				end,
				desc = "Document symbols",
			},
			{
				"<leader>pf",
				function()
					telescope.find_files()
				end,
				desc = "Find files",
			},
			{
				"<C-p>",
				function()
					telescope.git_files()
				end,
				desc = "Git files",
			},
			{
				"<leader>ps",
				function()
					telescope.grep_string()
				end,
				desc = "Grep string",
			},
		},
	},
}
