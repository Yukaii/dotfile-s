# Completion script for gty - CLI wrapper for ghostty with subcommands

# Main subcommands
complete -c gty -n '__fish_use_subcommand' -a "config-docs" -d "Show ghostty's default configuration documentation" --no-files
complete -c gty -n '__fish_use_subcommand' -a "action-docs" -d "List available actions for ghostty" --no-files
