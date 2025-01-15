# fish completion for ff-branch command
# The ff-branch command usage:
# ff-branch <branch> [remote]
#
# - The first argument is a branch name to fast-forward.
# - The second optional argument is a remote name (defaults to origin if omitted).

# A helper function to list local branches
function __fish_git_local_branches
  # Strip the leading * and spaces from current branch listings
  git branch --no-color 2>/dev/null | sed 's/^..//'
end

# A helper function to list configured remotes
function __fish_git_remotes
  git remote 2>/dev/null
end

# Complete the first argument (branch) if none is provided yet
complete \
  -c ff-branch \
  -n 'not __fish_seen_argument 1' \
  -a '(__fish_git_local_branches)' \
  -d 'Name of the local branch to fast-forward'

# Complete the second argument (remote) if a branch has been chosen and remote not yet provided
complete \
  -c ff-branch \
  -n '__fish_seen_argument 1; and not __fish_seen_argument 2' \
  -a '(__fish_git_remotes)' \
  -d 'Name of the remote repository (default: origin)'
