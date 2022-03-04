" CloseTag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

lua<<EOF

-- Transparent.nvim
require("transparent").setup({
  enable = false,
  extra_groups = {

    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {},
})

-- Colorizer
require 'colorizer'.setup {
  css = { css = true; };
  html = {
    mode = 'background';
  }
}

-- Refactoring
require('refactoring').setup({})
require("telescope").load_extension("refactoring")
vim.api.nvim_set_keymap(
  "v",
  "<C-r>",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

EOF
