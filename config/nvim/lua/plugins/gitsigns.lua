return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = true,
	keys = {
		{
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Git Hunk",
		},
		{
			"<leader>hp",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview Git Hunk",
		},
		{
			"[h",
			function()
				if vim.wo.diff then
					return "[h"
				end
				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Nav prev hunk",
		},
		{
			"]h",
			function()
				if vim.wo.diff then
					return "[h"
				end
				require("gitsigns").nav_hunk("next")
			end,
			desc = "Nav next hunk",
		},
		{
			"<leader>gh",
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle Git Line Blame",
		},
		{
			"<leader>gdl",
			function()
				require("gitsigns").toggle_word_diff()
				require("gitsigns").toggle_deleted()
			end,
			desc = "Toggle Git diff inline",
		},
		{
			"<leader>gda",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "Toggle Git diff",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame()
			end,
			desc = "Toggle Git Blame",
		},
	},
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		blame_formatter = nil, -- Use default
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
}
