local options = {
	shiftwidth = 2,
	tabstop = 2,
	mouse = 'a',
	number = true
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
	  border = "rounded",
	  source = "always",
	},
	signs = {
	  text = {
		[vim.diagnostic.severity.ERROR] = "",
		[vim.diagnostic.severity.WARN] = "",
		[vim.diagnostic.severity.INFO] = "󰠠",
		[vim.diagnostic.severity.HINT] = "",
	  },
	},
})