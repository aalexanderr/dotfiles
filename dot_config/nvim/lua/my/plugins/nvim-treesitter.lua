return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "csv",
          "dockerfile",
          "editorconfig",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "gotmpl",
          "gpg",
          "graphql",
          "helm",
          "html",
          "http",
          "idl",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "nginx",
          "passwd",
          "prisma",
          "python",
          "query",
          "rust",
          "sql",
          "ssh_config",
          "strace",
          "tmux",
          "toml",
          "tsx",
          "typescript",
          "udev",
          "vim",
          "xml",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
      require('ts_context_commentstring').setup {}
    end,
  },
}
