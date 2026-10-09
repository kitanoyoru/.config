return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        local o = { buffer = buf }
        vim.keymap.set("n", "]c", function() gs.nav_hunk("next") end, o)
        vim.keymap.set("n", "[c", function() gs.nav_hunk("prev") end, o)
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, o)
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, o)
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, o)
        vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, o)
      end,
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>gg", "<cmd>LazyGit<cr>" } },
  },

  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

  { "echasnovski/mini.pairs", event = "InsertEnter", opts = {} },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",
      },
    },
  },
  { "echasnovski/mini.ai", event = "VeryLazy", opts = { n_lines = 500 } },

  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
    },
    keys = { { "-", "<cmd>Oil<cr>" } },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local h = require("harpoon")
      h:setup()
      vim.keymap.set("n", "<leader>a", function() h:list():add() end)
      vim.keymap.set("n", "<C-e>", function() h.ui:toggle_quick_menu(h:list()) end)
      for i = 1, 4 do
        vim.keymap.set("n", "<leader>" .. i, function() h:list():select(i) end)
      end
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
