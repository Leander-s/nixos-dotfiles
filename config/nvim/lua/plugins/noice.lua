-- lua/plugins/noice.lua

return {
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline_popup",
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
			},

			lsp = {
				progress = {
					enabled = false,
				},
			},
		},
	},
}
