local g = vim.g

g.dashboard_custom_header = {
'██╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗',
'██║   ██║██╔════╝██║   ██║██║████╗ ████║',
'██║   ██║███████╗██║   ██║██║██╔████╔██║',
'██║   ██║╚════██║██║   ██║██║██║╚██╔╝██║',
'╚██████╔╝███████║╚██████╔╝██║██║ ╚═╝ ██║',
' ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝',
}

g.dashboard_default_executive ='telescope'
g.dashboard_custom_section = {
    a = {description = {"  New File"}, command = "DashboardNewFile"},
    b = {description = {"  Recents"}, command = "Telescope oldfiles"},
    c = {description = {"  Workspaces"}, command = "Telescope workspaces"},
    d = {description = {"  Find File"}, command = "Telescope find_files cwd=."},
    e = {description = {"  Color Scheme"}, command = "Telescope colorscheme"},
    f = {description = {"  Update Plugins"}, command = "PlugUpdate"},
    g = {description = {"  Settings"}, command = "lua vim.cmd('edit ' .. vim.fn.expand('~/.config/usuim/settings.vim'))"},
    h = {description = {"  Exit"}, command = "exit"}
}

g.dashboard_custom_footer = {'Usuim 1.7.3'}
