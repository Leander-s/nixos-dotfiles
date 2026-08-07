return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>ga", "<cmd>Git add %<cr>", desc = "Git add current file" },
			{ "<leader>gA", "<cmd>Git add .<cr>", desc = "Git add all files" },
			{ "<leader>gr", "<cmd>Git reset<cr>", desc = "Git reset" },
			{ "<leader>gR", "<cmd>Git reset .<cr>", desc = "Git reset all" },

			{ "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git fetch" },
			{ "<leader>gm", "<cmd>Git merge<cr>", desc = "Git merge" },

			{ "<leader>gL", "<cmd>Git push --force-with-lease<cr>", desc = "Git force push" },
			{ "<leader>gP", "<cmd>Git push<cr>", desc = "Git push" },
			{ "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },

			{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
		},
	},
}
