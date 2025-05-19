return {
    "windwp/nvim-ts-autotag",
    opts = {
      enable = true,
      filetypes = {
        "html",
        "javascriptreact",
        "javascript",
        "typescript",
        "typescriptreact",
        "vue",
        "tsx",
        "jsx",
      },
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        ["html"] = {
          enable_close = false,
        },
      },
    },
}