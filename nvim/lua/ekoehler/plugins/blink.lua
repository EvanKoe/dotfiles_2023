return {
    {
        'saghen/blink.nvim',
        lazy = false,
        keys = {
            -- tree
            { '<C-n>', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
            { '<leader>N', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
        },
        opts = {
            tree = { enabled = true },
            indent = {
                enabled = true,
                visible = true,
                blocked = {
                    buftypes = {},
                    filetypes = {'mason', 'lazy', 'blink-tree'},
                },
                static = {
                    enabled = true,
                    char = '▎',
                    priority = 1,
                    highlights = { 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
                    -- highlights = { 'BlinkIndent' },
                },
                scope = {
                    enabled = true,
                    char = '▎',
                    priority = 1024,
                    highlights = {
                    -- 'BlinkIndentRed',
                    'BlinkIndentYellow',
                    'BlinkIndentBlue',
                    -- 'BlinkIndentOrange',
                    'BlinkIndentGreen',
                    'BlinkIndentViolet',
                    'BlinkIndentCyan',
                    },
                    underline = {
                        enabled = false,
                        highlights = {
                            'BlinkIndentRedUnderline',
                            'BlinkIndentYellowUnderline',
                            'BlinkIndentBlueUnderline',
                            'BlinkIndentOrangeUnderline',
                            'BlinkIndentGreenUnderline',
                            'BlinkIndentVioletUnderline',
                            'BlinkIndentCyanUnderline',
                        },
                    },
                },
            },
        },
    },

    {
        'saghen/blink.pairs',
        version = '*',

        dependencies = 'saghen/blink.download',
        --- @module 'blink.pairs'
        --- @type blink.pairs.Config
        opts = {
            mappings = {
                enabled = true,
                pairs = {},
            },
            highlights = {
                enabled = true,
                groups = {
                    'BlinkPairsOrange',
                    'BlinkPairsPurple',
                    'BlinkPairsBlue',
                },
                matchparen = {
                    enabled = true,
                    group = 'MatchParen',
                },
            },
            debug = false,
        }
    },

    {
        'saghen/blink.cmp',
        dependencies = { 'neovim/nvim-lspconfig' },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'default',
                ["<C-k>"] = { "scroll_documentation_up", "fallback" },
                ["<C-j>"] = { "scroll_documentation_down", "fallback" },
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },

            signature = {
                enabled = true,
                window = {
                    border = 'single',
                },
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = {
                menu = {
                    border = 'single',
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = false,
                    window = { border = 'single' }
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}