return {
	  -- 기본 편집 기능
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-tree/nvim-tree.lua", config = true },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-compe", config = true },
  { "nvim-lua/popup.nvim" },
  { "lewis6991/gitsigns.nvim", config = true },
  { "nvim-lua/lsp-status.nvim" },
  { "nvim-lua/lsp_extensions.nvim" },
  { "williamboman/mason.nvim", config = true },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" }, config = function()
	  local cmp = require("cmp")
	  cmp.setup({
		  snippet = {
			  expand = function(args)
				  require("luasnip").lsp_expand(args.body)
			  end,
		  },
		  mapping = {
			  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
			  ["<C-f>"] = cmp.mapping.scroll_docs(4),
			  ["<C-Space>"] = cmp.mapping.complete(),
			  ["<C-e>"] = cmp.mapping.close(),
			  ["<CR>"] = cmp.mapping.confirm({ select = true }),
			  ["<Tab>"] = cmp.mapping(function(fallback)
				  if cmp.visible() then
					  cmp.select_next_item()
				  else
					  fallback()
				  end
			  end, { "i", "s" }),
			  ["<S-Tab>"] = cmp.mapping(function(fallback)
				  if cmp.visible() then
					  cmp.select_prev_item()
				  else
					  fallback()
				  end
			  end, { "i", "s" }),
		  },
		  sources = {
			  { name = "nvim_lsp" },
			  { name = "buffer" },
			  { name = "luasnip" },
		  },
	  })

  end
  },
  { "hrsh7th/cmp-nvim-lsp" },
}

