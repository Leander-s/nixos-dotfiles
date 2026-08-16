vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "plaintex" },
	callback = function()
		vim.opt_local.textwidth = 100
		vim.opt_local.formatoptions:append("t")
	end,
})
