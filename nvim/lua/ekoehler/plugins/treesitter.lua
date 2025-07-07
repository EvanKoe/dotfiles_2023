return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { "OXY2DEV/markview.nvim" },
    config = function ()
        -- local installs = require('nvim-treesitter.install')
        -- local configs = require("nvim-treesitter.configs")
        --
        -- installs.update({ with_sync = true })
        --
        -- configs.setup({
        --     ensure_installed = { "vue", "comment", "typescript", "tsx", "javascript" },
        --     sync_install = false,
        --     highlight = { enable = true },
        --     indent = { enable = false },
        -- })
    end
}
