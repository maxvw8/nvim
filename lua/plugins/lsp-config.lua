return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls" },
      dependencies = {
        "hrsh7th/cmp-nvim-lsp"
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")
        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup_handlers {
          function(server_name) -- default handler (optional)
            lspconfig[server_name].setup {
              capabilities = capabilities,
            }
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { "vim" }
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                }
              }
            }
          end,
        }

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>cf', function()
              vim.lsp.buf.format({ async = true })
            end, opts)
          end,
        })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group    = vim.api.nvim_create_augroup('UserLspOnSave', {}),
          callback = function()
            vim.lsp.buf.format()
          end
        })
      end,
    }
  },
}
