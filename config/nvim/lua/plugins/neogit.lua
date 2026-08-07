return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		-- Only one of these is needed.
		"sindrets/diffview.nvim", -- optional
		"esmuellert/codediff.nvim", -- optional

		-- For a custom log pager
		"m00qek/baleia.nvim", -- optional

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},
	cmd = "Neogit",
	keys = {
		{
			"<leader>gs",
			function()
				require("neogit").open({ kind = "floating" })
			end,
			desc = "Show Neogit UI",
		},
		{
			"<leader>gc",
			function()
				require("neogit").open({ "commit" })
			end,
			desc = "Show Neogit Commit UI",
		},
	},
}
