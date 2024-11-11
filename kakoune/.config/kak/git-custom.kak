define-command -params ..1 git-pr-diff -docstring %{
  Show pull request diff against the default branch or a specified base branch.
} %{
  evaluate-commands %sh{
    default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    compare_branch=${1:-$default_branch}
    diffBase=$(git merge-base HEAD $compare_branch)
    echo "git diff $diffBase HEAD"
  }
}

map global git P ':git-pr-diff<ret>' -docstring "PR diff against base branch"
