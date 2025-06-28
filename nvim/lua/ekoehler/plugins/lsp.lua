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
            local lspconfig = require('lspconfig')

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

            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end
                },
            })

            local vue_ls_path = "/home/ekoehler/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"

            lspconfig.ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_ls_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'typescriptreact', 'vue' },
            })

						lspconfig.qmlls.setup {
								filetypes = {'qml'},
								cmd = {'qmlls6'}
						}

            lspconfig.tailwindcss.setup({
                filetypes = {'vue'}
            })
        end
    }
}
