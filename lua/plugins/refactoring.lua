-- Refactoring
require('refactoring').setup({})
require("telescope").load_extension("refactoring")
vim.api.nvim_set_keymap(
  "v",
  "<C-r>",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)
