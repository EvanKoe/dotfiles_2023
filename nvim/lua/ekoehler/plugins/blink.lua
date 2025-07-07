return {
    {
        'saghen/blink.nvim',
        lazy = false,
        keys = {
            -- tree
            { '<C-n>', '<cmd>BlinkTree toggle<cr>', desc = 'Toggle tree' },
            { '<leader>n', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
        },
        opts = {
            tree = { enabled = true },
            indent = {
                enabled = false,
                visible = true,
                blocked = {
                    buftypes = { 'BlinkCmp', 'BlinkCmpMenu' },
                    filetypes = { 'mason', 'lazy', 'blink', 'blink-tree', 'dashboard' },
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
				version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
				---
				dependencies = {
						"moyiz/blink-emoji.nvim",
						"Kaiser-Yang/blink-cmp-dictionary",
				},
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
								keyword = { range = "full" },
								accept = {
									auto_brackets = {
										enabled = true
									}
								},
                menu = {
                    border = 'single',
                    draw = {
                        treesitter = { "lsp" },
												columns = {
													{ "kind_icon", "label", "label_description", gap = 1 }, { "kind" }
												}
                    },
                },
                documentation = {
                    auto_show = true,
                    window = { border = 'single' }
                },
								ghost_text = {
									enabled = false,
									show_with_selection = true,
									show_without_selection = false,
								}
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'buffer' },
								providers = {
									lsp = {
										min_keyword_length = 1
									},
									buffer = {
										name = 'BUFFER',
										min_keyword_length = 2
									},
									path = {
										name = 'PATH',
										module = "blink.cmp.sources.path",
										min_keyword_length = 1,
										opts = {
											show_hidden_files_by_default = true
										}
									},
									-- emoji = {
									-- 	module = "blink-emoji",
									-- 	name = "Emoji",
									-- 	score_offset = 93, -- the higher the number, the higher the priority
									-- 	min_keyword_length = 1,
									-- 	opts = { insert = true }, -- Insert emoji (default) or complete its name
									-- },
								}
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

		-- Better option than blink.indent for indentation helper
		{
				"lukas-reineke/indent-blankline.nvim",
				main = "ibl",
				---@module "ibl"
				---@type ibl.config
				opts = {},
				config = function ()
						require("ibl").setup({
							exclude = {
								buftypes = { 'BlinkCmp', 'BlinkCmpMenu' },
								filetypes = { 'mason', 'lazy', 'blink', 'blink-tree', 'dashboard' },
							}
						})
				end
		}
}
