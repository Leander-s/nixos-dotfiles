return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	-- Neo-tree manages its own internal lazy loading.
	lazy = false,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	keys = {
		{
			"<leader>e",
			"<cmd>Neotree filesystem toggle reveal float<cr>",
			desc = "Toggle floating file explorer",
		},
		{
			"<leader>b",
			"<cmd>Neotree buffers toggle reveal float<cr>",
			desc = "Toggle buffer explorer",
		},
		{
			"<leader>ge",
			"<cmd>Neotree git_status toggle reveal float<cr>",
			desc = "Toggle git explorer",
		},
	},

	opts = {
		close_if_last_window = true,

		enable_git_status = true,
		enable_diagnostics = true,

		-- Files / Buffers / Git tabs at the top of Neo-tree.
		source_selector = {
			winbar = true,
			statusline = false,
		},

		filesystem = {
			-- Keep the file tree synchronized with the current buffer.
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},

			-- Notice files created or deleted outside Neovim.
			use_libuv_file_watcher = true,

			filtered_items = {
				-- Hidden files can still be toggled with H.
				visible = false,

				-- Show files such as .gitignore and .clang-format.
				hide_dotfiles = false,

				-- Hide build output, node_modules, and other ignored files.
				hide_gitignored = true,

				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
		},

		window = {
			mappings = {
				["ga"] = "git_add_file",
				["gu"] = "git_unstage_file",
				["gt"] = "git_toggle_file_stage",
				["A"] = "git_add_all",
				["U"] = "git_unstage_all",
				["R"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
			width = 25,

			popup = {
				position = "50%",
				size = {
					width = "60%",
					height = "75%",
				},
				border = {
					style = "rounded",
				},
			},
		},
	},
}
