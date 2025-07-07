local options = {
	shiftwidth = 2,
	tabstop = 2,
	mouse = 'a',
	number = true,
	foldcolumn = '1',
	foldmethod = 'indent',
	splitright = true
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable LSP autostart
-- vim.g.lsp_auto_start = false

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
