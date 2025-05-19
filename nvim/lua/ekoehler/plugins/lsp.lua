return {
    {
        "mason-org/mason.nvim",
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

            local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
            local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

            lspconfig.ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_plugin_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "vue" },
            })

            lspconfig.tailwindcss.setup({
                filetypes = {'vue'}
            })
        end
    }
}
