return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>ga", "<cmd>Git add %<cr>", desc = "Git add current file" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
			{ "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
			{ "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git fetch" },
			{ "<leader>gm", "<cmd>Git merge<cr>", desc = "Git merge" },
		},
	},
}
