return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					PATH = "append",
				},
			},
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"ts_ls",
						"rust_analyzer",
						"marksman",
						"lua_ls",
						"clangd",
					},
				},
			},
			{
				"hasansujon786/nvim-navbuddy",
				opts = {
					lsp = {
						auto_attach = true,
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("texlab", {
				settings = {
					texlab = {
						build = {
							useFileList = true,
						},
					},
				},
			})

			vim.lsp.config("clangd", {
				cmd = {
					vim.fn.exepath("clangd"),
					"--clang-tidy",
					"--clang-tidy-checks=*",
					"--background-index",
					"--suggest-missing-includes",
				},
			})

			vim.lsp.enable("clangd")

			vim.lsp.config("ltex_plus", {
				settings = {
					ltex = {
						language = "de",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			local telescope = require("telescope.builtin")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "gn", function()
						require("nvim-navbuddy").open()
					end, vim.tbl_extend("force", opts, { desc = "Navbuddy" }))

					vim.keymap.set("n", "gr", telescope.lsp_references)
					vim.keymap.set("n", "gd", telescope.lsp_definitions)
					vim.keymap.set("n", "gi", telescope.lsp_implementations)
					vim.keymap.set("n", "gy", telescope.lsp_type_definitions)

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover({
							border = "rounded",
						})
					end, vim.tbl_extend("force", opts, { desc = "Hover" }))
					vim.keymap.set(
						"n",
						"<leader>vws",
						vim.lsp.buf.workspace_symbol,
						vim.tbl_extend("force", opts, { desc = "Workspace symbols" })
					)
					vim.keymap.set(
						"n",
						"<leader>vd",
						vim.diagnostic.open_float,
						vim.tbl_extend("force", opts, { desc = "Line diagnostics" })
					)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
					vim.keymap.set(
						"n",
						"<leader>vca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "Code action" })
					)
					vim.keymap.set(
						"n",
						"<leader>vrr",
						vim.lsp.buf.references,
						vim.tbl_extend("force", opts, { desc = "References" })
					)
					vim.keymap.set(
						"n",
						"<leader>vrn",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Rename" })
					)
					vim.keymap.set(
						"i",
						"<C-h>",
						vim.lsp.buf.signature_help,
						vim.tbl_extend("force", opts, { desc = "Signature help" })
					)
				end,
			})
		end,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",

		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		opts = {
			keymap = {
				preset = "default",

				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-y>"] = { "select_and_accept" },
				["<C-Space>"] = { "show" },
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
