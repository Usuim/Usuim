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
    a = {description = {"  New File"}, command = "DashboardNewFile"},
    b = {description = {"  Recents"}, command = "Telescope oldfiles"},
    c = {description = {"  Workspaces"}, command = "Telescope workspaces"},
    d = {description = {"  Find File"}, command = "Telescope find_files cwd=."},
    e = {description = {"  Color Scheme"}, command = "Telescope colorscheme"},
    f = {description = {"  Update Plugins"}, command = "PlugClean | PlugUpdate"},
    g = {description = {"  Settings"}, command = "edit $MYVIMRC"},
    h = {description = {"  Exit"}, command = "exit"}
}

g.dashboard_custom_footer = {'VsVim 1.6.5'}

EOF
