# Disable file completions globally for PM2
complete -c pm2 -f

# Helper function to check if PM2 is missing a subcommand
function __fish_pm2_no_subcommand --description "Check if PM2 has not received a subcommand"
  for i in (commandline -opc)
    if contains -- $i start stop restart delete reload list logs monit jlist status dashboard flush kill info describe trigger deploy pid create scale profile:mem profile:cpu startOrRestart startOrReload startOrGracefulReload sendSignal ping updatePM2 update install module:update module:generate uninstall package publish set multiset get conf config unset report link unlink monitor unmonitor open plus login logout dump cleardump send attach resurrect unstartup startup logrotate ecosystem reset desc show env list ps sysmonit slist prettylist monit imonit forward backward deepUpdate serve autoinstall examples
      return 1
    end
  end
  return 0
end

# Dynamic process names completion
function __fish_pm2_process_names --description "Fetch list of PM2 processes"
  pm2 jlist | jq -r '.[].name' 2>/dev/null
end

# Root-level subcommands with descriptions
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "start" -d "Start and daemonize an app"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "stop" -d "Stop a running process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "restart" -d "Restart a process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "delete" -d "Stop and delete a process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "del" -d "Alias for 'delete'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "reload" -d "Reload processes (for apps using HTTP/HTTPS)"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "list" -d "List all processes"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "ls" -d "Alias for 'list'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "logs" -d "Stream logs for processes"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "monit" -d "Launch terminal monitoring"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "jlist" -d "List all processes in JSON format"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "status" -d "Alias for 'list'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "dashboard" -d "Launch dashboard with monitoring and logs"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "dash" -d "Alias for 'dashboard'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "flush" -d "Flush logs"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "kill" -d "Kill the PM2 daemon"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "info" -d "Describe all parameters of a process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "desc" -d "Alias for 'info'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "show" -d "Alias for 'info'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "trigger" -d "Trigger process action"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "deploy" -d "Deploy your JSON"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "pid" -d "Return PID of an app or all apps"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "create" -d "Create a new process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "scale" -d "Scale up/down a process"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "profile:mem" -d "Sample PM2 heap memory"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "profile:cpu" -d "Profile PM2 CPU"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "startOrRestart" -d "Start or restart JSON file"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "startOrReload" -d "Start or gracefully reload JSON file"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "startOrGracefulReload" -d "Start or gracefully reload JSON file"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "updatePM2" -d "Update PM2"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "update" -d "Alias for 'updatePM2'"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "serve" -d "Serve a directory over HTTP"
complete -c pm2 -n '__fish_pm2_no_subcommand' -a "expose" -d "Alias for 'serve'"

# Subcommand-specific completions
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

# Dynamic process name completion for specific commands
for cmd in stop restart delete reload logs info describe trigger
  complete -c pm2 -n "__fish_seen_subcommand_from $cmd" -a "(__fish_pm2_process_names)" -d "PM2 process names"
end
