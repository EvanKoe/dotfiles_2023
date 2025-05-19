return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
	lazy = false,
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  config = function()
    require('dashboard').setup({
			theme = 'hyper',
			hide = {
				{ statusline = true },
				{ tabline = true },
				{ winbar = true }
			},
			config = {
				header = {
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
				}
			}
    })
  end
}
