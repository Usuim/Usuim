-- NvimComment-Treesitter
require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

-- NvimComment Setup
require('nvim_comment').setup()
