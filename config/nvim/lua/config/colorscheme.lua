local M = {}

local state_file = vim.fn.stdpath("state") .. "/colorscheme"

local transparent_groups = {
	"TelescopeBorder",
	"NormalNC",
	"Normal",
	"SignColumn",
	"FoldColumn",
	"EndOfBuffer",
	"LineNr",
	"CursorLineNr",
	"WinSeparator",
	"VertSplit",
	"NormalFloat",
	"FloatBorder",
}
vim.api.nvim_set_hl(0, "LazyNormal", {
	bg = "#191724",
})

local function apply_overrides()
	vim.opt.colorcolumn = ""
	vim.opt.fillchars:append({ eob = " " })

	for _, group in ipairs(transparent_groups) do
		vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
	end
end

function M.get()
	local ok, lines = pcall(vim.fn.readfile, state_file)

	if ok and lines[1] and lines[1] ~= "" then
		return lines[1]
	end

	return "rose-pine"
end

function M.save(colorscheme)
	vim.fn.writefile({ colorscheme }, state_file)
end

function M.setup()
	-- Reapply our custom highlights after EVERY colorscheme change.
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("MyColorscheme", { clear = true }),
		callback = apply_overrides,
	})

	-- Load the persisted colorscheme.
	local colorscheme = M.get()

	local ok = pcall(vim.cmd.colorscheme, colorscheme)

	if not ok then
		vim.cmd.colorscheme("rose-pine")
	end

	-- In case the current colorscheme was already active before the autocmd.
	apply_overrides()
end

return M
