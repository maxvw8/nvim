return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    keys = {"<leader>x","<leader>gs"},
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,  -- Close Neo-tree if it is the last window left in the tab
        sort_case_insensitive = true, -- used when sorting files and directories in the tree
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_ignored = false,
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              "DS_Store",
              ".git"
            },
          }
        }
      })
      vim.keymap.set('n', '<leader>x', ":Neotree filesystem focus position=left<cr>", {})
      vim.keymap.set('n', '<leader>gs', ":Neotree float git_status<cr>", {})
    end
  }
}
