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
    c = {description = {"  Find File                 leader f f"}, command = "Telescope find_files"},
    d = {description = {"  Color Scheme              leader m  "}, command = "Telescope colorscheme"},
    e = {description = {"  Update Plugins            leader u  "}, command = "PlugClean | PlugUpdate"},
    f = {description = {"  Settings                  leader e v"}, command = "edit $MYVIMRC"},
    g = {description = {"  Exit                      leader q  "}, command = "exit"}
}

g.dashboard_custom_footer = {'VsVim 1.2.8'}

EOF
