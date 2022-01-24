local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
      use {
        "junegunn/fzf"
      }

      use {
        "junegunn/fzf.vim"
      }

      use {
        "vim-ruby/vim-ruby"
      }

      use {
        "tpope/vim-rails"
      }

      use {
        "tpope/vim-endwise"
      }

      use {
        "tpope/vim-rbenv"
      }

      use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        config = function()
         require("custom.plugins.null-ls").setup()
        end,
      }

 end)

-- the above snippet is just an example
