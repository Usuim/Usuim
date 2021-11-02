let g:dashboard_custom_header = [
\'██╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗',
\'██║   ██║██╔════╝██║   ██║██║████╗ ████║',
\'██║   ██║███████╗██║   ██║██║██╔████╔██║',
\'╚██╗ ██╔╝╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║',
\' ╚████╔╝ ███████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
\'  ╚═══╝  ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
\ ]

lua <<EOF
local g = vim.g
g.dashboard_default_executive ='telescope'
g.dashboard_custom_section = {
    a = {description = {"  New File                  leader e n"}, command = "DashboardNewFile"},
    b = {description = {"  Recents                   leader f h"}, command = "Telescope oldfiles"},
    c = {description = {"  Find File                 leader f f"}, command = "Telescope find_files"},
    d = {description = {"  Bookmarks                 leader m  "}, command = "Telescope marks"},
    e = {description = {"  Update Plugins            leader u  "}, command = "PlugUpdate"},
    f = {description = {"  Settings                  leader e v"}, command = "edit $MYVIMRC"},
    g = {description = {"  Exit                      leader q  "}, command = "exit"}
}

g.dashboard_custom_footer = {'type  :help<Enter>  or  <F1>  for on-line help'}

EOF