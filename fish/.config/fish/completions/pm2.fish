# Disable file completions globally for pm2
complete -c pm2 -f

# Helper function to get PM2 process names
function __fish_pm2_process_names
    pm2 jlist | jq -r '.[].name' 2>/dev/null
end

# Helper function to check if any subcommand is used
function __fish_pm2_using_subcommand
    set -l cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 1
    end
    return 0
end

# Root subcommand completions - only show when no subcommand is used
complete -c pm2 -n 'not __fish_pm2_using_subcommand' -a "start stop restart delete reload list logs monit jlist status dashboard flush kill info describe trigger deploy pid create scale profile:mem profile:cpu startOrRestart startOrReload startOrGracefulReload" -d "PM2 subcommands"

# Context-aware subcommand completions
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--watch' -d "Watch for file changes"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--fresh' -d "Start fresh"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--daemon' -d "Run in daemon mode"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--container' -d "Run in container mode"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--dist' -d "Specify dist path"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--image-name' -d "Specify image name"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--node-version' -d "Specify Node.js version"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '--dockerdaemon' -d "Run with Docker daemon"
complete -c pm2 -n '__fish_seen_subcommand_from start' -a '-h --help' -d "Show help"

complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--json' -d "Output in JSON format"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--format' -d "Format output"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--raw' -d "Raw output"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--err' -d "Only error logs"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--out' -d "Only output logs"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--lines' -d "Number of lines"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--timestamp' -d "Add timestamps"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--nostream' -d "No streaming"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '--highlight' -d "Highlight output"
complete -c pm2 -n '__fish_seen_subcommand_from logs' -a '-h --help' -d "Show help"

complete -c pm2 -n '__fish_seen_subcommand_from monit' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from dashboard' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from flush' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from kill' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from deploy' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from create' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from scale' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from profile:mem' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from profile:cpu' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from startOrRestart' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from startOrReload' -a '-h --help' -d "Show help"
complete -c pm2 -n '__fish_seen_subcommand_from startOrGracefulReload' -a '-h --help' -d "Show help"

# Dynamic process name completions for specific commands
for cmd in start stop restart delete reload logs info describe trigger
    complete -c pm2 -n "__fish_seen_subcommand_from $cmd" -a "(__fish_pm2_process_names)" -d "PM2 process names"
end
