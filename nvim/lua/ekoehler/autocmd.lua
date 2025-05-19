vim.api.nvim_create_autocmd({'BufWrite'}, {
	pattern = '*',
	callback = function ()
		if vim.bo.filetype == 'markdown' or vim.bo.filetype == 'text' then
			return
		end

		local pos = vim.api.nvim_win_get_cursor(0)
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd [[ :%s/\s\+$//e ]]
		vim.api.nvim_win_set_cursor(0, pos)
	end
})

-- Prevent auto-opening files like netrw when starting in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      -- No files passed; let Dashboard load
      return
    end

    local file = vim.fn.argv(0)
    if vim.fn.isdirectory(file) == 1 then
      vim.cmd("bd") -- close the buffer
			vim.cmd("Dashboard") -- Opens the dashboard
    end
  end,
})
