return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'williamboman/mason-lspconfig.nvim'
		},
		config = function ()
			-- Mason UI configuration
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				}
			})

			-- Function to check if executable exists
			local function executable_exists(cmd)
				return vim.fn.executable(cmd) == 1
			end

			-- Vue configuration
			vim.lsp.config('vue_ls', {
				cmd = { "vue-language-server", "--stdio" },
				filetypes = { 'vue' },
				-- root_dir = require("lspconfig").util.root_pattern(
				-- 	"package.json",
				-- 	"vue.config.js",
				-- 	"vite.config.js",
				-- 	"nuxt.config.js",
				-- 	".git"
				-- ),
				-- root_markers = {
				-- 	"package.json",
				-- 	"vue.config.js",
				-- 	"vite.config.js",
				-- 	"nuxt.config.js",
				-- 	".git"
				-- },
				settings = {
					vue = {
						server = {
							hybridMode = false
						}
					}
				}
			})

			-- Typescript configuration
			vim.lsp.config('ts_ls', {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "typescript", "javascript", "vue" },
				-- root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
			-- root_markers = {
				-- 	"package.json",
				-- 	"tsconfig.json",
				-- 	".git"
				-- },
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" }
						}
					}
				}
			})

			-- QML configuration
			vim.lsp.config.qmlls = {
				filetypes = {'qml'},
				cmd = {'qmlls6'}
			}

			-- local vue_ls_path = "/home/ekoehler/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"

			require('mason-lspconfig').setup({
				ensure_installed = {
				},
			})

			-- Then enable treesitter
      require('nvim-treesitter.install').update({ with_sync = true })
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "vue", "comment", "typescript", "tsx", "javascript" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end
	}
}
