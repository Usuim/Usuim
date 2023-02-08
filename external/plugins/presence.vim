lua << EOF
-- RPC
require("presence"):setup({
    workspace_text = function(git_project_name, buffer)
        local project_name = git_project_name
        if not git_project_name then
            project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        return string.format("Workspace: %s", project_name)
    end,
})
EOF
