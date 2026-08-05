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

					vim.keymap.set("n", "<leader>gr", telescope.lsp_references)
					vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions)
					vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations)
					vim.keymap.set("n", "<leader>gy", telescope.lsp_type_definitions)

					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, { desc = "Goto definition" })
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
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
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "buffer", keyword_length = 3 },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},
}
