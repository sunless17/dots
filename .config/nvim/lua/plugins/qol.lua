return {
  -- the beginners' must have
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    lazy = true,
  },

  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    branch = "v3.x",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true
      },
      {
        "nvim-lua/plenary.nvim",
        lazy = true
      },
      {
        "MunifTanjim/nui.nvim",
        lazy = true
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    opts = {
      window = {
        auto_expand_width = true,
      },
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },

  -- theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      term_colors = true,
    },
  },

  -- must have esp for web development
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    },
  },

  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>",    desc = "Buffers" },
      { "<leader>fh", "<CMD>Telescope help_tags<CR>",  desc = "Help" },
    },
  }
}
