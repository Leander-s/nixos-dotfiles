return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				tex = { "tex-fmt" },
				plaintex = { "tex-fmt" },
			},

			formatters = {
				["tex-fmt"] = {
					prepend_args = {
						"--wraplen",
						"100",
					},
				},
			},
		},
	},
}
