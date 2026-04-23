return {
    {
        "github/copilot.vim",
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    { "Mofiqul/dracula.nvim" },
    { "catppuccin/nvim" },
    { "folke/tokyonight.nvim" },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
    },

    { "theprimeagen/harpoon" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "mfussenegger/nvim-dap" },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },

    { "christoomey/vim-tmux-navigator" },

    {
        "johnseth97/codex.nvim",
        cmd = { "Codex", "CodexToggle" },
        config = function()
            require("codex").setup({
                keymaps = {
                    toggle = nil,
                    quit = "<C-q>",
                },
                border = "rounded",
                width = 0.8,
                height = 0.8,
                model = nil,
                autoinstall = true,
            })

            vim.keymap.set({ "n", "t" }, "<leader>oc", function()
                require("codex").toggle()
            end, { desc = "Toggle Codex popup" })
        end,
    },

    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "neovim/nvim-lspconfig",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",

            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "rafamadriz/friendly-snippets",
        },
    },
}
