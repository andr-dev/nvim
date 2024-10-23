local Worktree = require('git-worktree')

Worktree.setup()

Worktree.on_tree_change(function(op, metadata)
    if op == Worktree.Operations.Switch then
        vim.cmd('NERDTreeCWD')
    end
end)

require("telescope").load_extension("git_worktree")


