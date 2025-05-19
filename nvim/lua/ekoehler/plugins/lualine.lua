return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('lualine').setup({
            options = { theme = 'nord' },
						sections = {
							lualine_a = {'mode'},
							lualine_b = {'branch', 'diff', 'diagnostics'},
							lualine_c = {'filename'},
							lualine_x = {},
							lualine_y = {'filetype'},
							lualine_z = {'location'}
						},
        })
    end
}
