let g:dashboard_custom_header = [
\'██╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗',
\'██║   ██║██╔════╝██║   ██║██║████╗ ████║',
\'██║   ██║███████╗██║   ██║██║██╔████╔██║',
\'██║   ██║╚════██║██║   ██║██║██║╚██╔╝██║',
\'╚██████╔╝███████║╚██████╔╝██║██║ ╚═╝ ██║',
\' ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝',
\ ]

lua <<EOF

function notify()
  vim.notify = require("notify")
  local name = "Usuim"

  vim.notify("Updating plugins...", "", {
    title = name,
  })
  vim.cmd("PlugClean")
  vim.cmd("PlugUpdate")
end

local g = vim.g
g.dashboard_default_executive ='telescope'
g.dashboard_custom_section = {
    a = {description = {"  New File"}, command = "DashboardNewFile"},
    b = {description = {"  Recents"}, command = "Telescope oldfiles"},
    c = {description = {"  Workspaces"}, command = "Telescope workspaces"},
    d = {description = {"  Find File"}, command = "Telescope find_files cwd=."},
    e = {description = {"  Color Scheme"}, command = "Telescope colorscheme"},
    f = {description = {"  Update Plugins"}, command = "PlugUpdate"},
    g = {description = {"  Settings"}, command = "edit $MYVIMRC"},
    h = {description = {"  Exit"}, command = "exit"}
}

g.dashboard_custom_footer = {'Usuim 1.7.1'}

EOF
