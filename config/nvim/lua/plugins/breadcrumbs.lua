return {
	"Bekaboo/dropbar.nvim",

	dependencies = {
		-- Provides file and symbol icons.
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		bar = {
			padding = {
				left = 1,
				right = 1,
			},
		},
	},

	config = function(_, opts)
		require("dropbar").setup(opts)

		local dropbar_api = require("dropbar.api")

		-- Select one of the breadcrumb components using displayed letters.
		vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick breadcrumb" })

		-- Jump to the beginning of the current function/class context.
		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of context" })

		-- Move to the next context at the same level.
		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
	end,
}
