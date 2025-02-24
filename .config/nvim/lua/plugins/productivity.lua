return {
  -- 생산성 향상
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("config.telescope") end },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "lewis6991/gitsigns.nvim", config = true },
  { "folke/which-key.nvim", config = true },
  { "numToStr/Comment.nvim", config = true },
  { "github/copilot.vim" },
}
