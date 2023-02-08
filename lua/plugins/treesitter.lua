--

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ignore_install = { "norg" },
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
