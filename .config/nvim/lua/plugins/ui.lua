return {
  -- UI & 테마
  { "folke/tokyonight.nvim" },
  { "nvim-lualine/lualine.nvim", config = true },
  { "akinsho/bufferline.nvim", config = true },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  }
}
