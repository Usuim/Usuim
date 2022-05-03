lua <<EOF

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = " >  ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules", "lib", "lib64", "target", "bin", "package%-lock.json", "Cargo.lock"},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
}

local darker_black = "#21252B"
local darker_black2 = "NormalFloat"
local black = "StatusLine"
local black2 = "#272F35"
local white = "#AAAAAA"
local blue = "#5AA0D9"
local green = "#98C379"
local black = "#000000"

function bg(type, col)
   vim.cmd("au VimEnter * hi " .. type .. " guibg=" .. col)
end

function link_bg(type, col)
   vim.cmd("au VimEnter * hi! link " .. type .. " " .. col)
end

function fg(type, col)
   vim.cmd("au VimEnter * hi " .. type .. " guifg=" .. col)
end

function fg_bg(type, fg, bg)
   vim.cmd("au VimEnter * hi " .. type .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- fg_bg("TelescopeBorder", darker_black, darker_black)
-- fg_bg("TelescopePromptBorder", black2, black2)
-- fg_bg("TelescopePreviewBorder", darker_black, darker_black)
-- fg_bg("TelescopeResultsBorder", darker_black, darker_black)

link_bg("TelescopeBorder", darker_black2)
link_bg("TelescopePromptBorder", "Conceal")
link_bg("TelescopePreviewBorder", darker_black2)
link_bg("TelescopeResultsBorder", darker_black2)

link_bg("TelescopePromptNormal", "ModeMsg")
link_bg("TelescopePromptPrefix", "MoreMsg")

link_bg("TelescopeNormal", darker_black2)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, blue)
link_bg("TelescopeResultsTitle", darker_black2)

link_bg("TelescopeSelection", "StatusLine")

EOF
