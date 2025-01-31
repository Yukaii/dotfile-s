function cdr
    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)

    if test -z "$repo_root"
        echo "Error: Not in a Git repository" >&2
        return 1
    end

    cd $repo_root
end

