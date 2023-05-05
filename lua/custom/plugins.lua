local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "json5",
        "json",
        "javascript",
        "lua",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline"
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    tag = 'nightly',
    opts = function()
      local opts = require "plugins.configs.nvimtree"
      opts.renderer.root_folder_label = nil
      opts.remove_keymaps = {"<C-v>", "<C-x>"}

      opts.on_attach = function (bufnr) 
        local ntapi = require('nvim-tree.api')

        vim.keymap.set("n", "s", function ()
          vim.print('horizontal')
          ntapi.node.open.horizontal()
        end, { buffer = bufnr, noremap = true })

        vim.keymap.set("n", "v", function ()
          vim.print('vertical')
          ntapi.node.open.vertical()
        end, { buffer = bufnr, noremap = true })
      end
      -- vim.print('replace by me', opts)
      return opts
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewFileHistory',
      'DiffviewOpen'
    },
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  }
}

return plugins;
