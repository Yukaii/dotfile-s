#!/bin/bash
# because you clearly can’t live without benchmarking specific shells.

# function to test spawn time for a given shell and calculate average
test_shell_time() {
  local shell_name=$1
  local iterations=$2
  local total_time=0

  # check if the shell exists on the system
  if ! command -v "$shell_name" &>/dev/null; then
    echo "error: $shell_name not found on this system. maybe install it first?"
    return
  fi

  echo "benchmarking $shell_name for $iterations runs..."

  for i in $(seq 1 "$iterations"); do
    # benchmark using time and extract the 'real' time
    local spawn_time=$( ( time $shell_name -c "exit" ) 2>&1 | grep real | awk '{print $2}' )

    # parse and convert 'm:ss.ms' to milliseconds
    local minutes=$(echo "$spawn_time" | awk -F'm' '{print $1}')
    local seconds=$(echo "$spawn_time" | awk -F'm' '{print $2}' | awk -F's' '{print $1}')
    local total_time_ms=$(echo "$minutes * 60000 + $seconds * 1000" | bc)

    total_time=$(echo "$total_time + $total_time_ms" | bc)
  done

  # calculate average time
  local average_time=$(echo "scale=3; $total_time / $iterations" | bc)
  echo "$shell_name average spawn time over $iterations runs: ${average_time} ms"
}

# main script: test specified shell(s) or all of them
iterations=${1:-10} # default to 10 runs if no argument provided
specific_shell=${2:-all} # default to testing all shells

# define list of shells to benchmark
shells=("bash" "sh" "zsh" "fish")

echo "benchmarking shell spawn times for $iterations iterations..."

if [[ $specific_shell == "all" ]]; then
  # benchmark all shells
  for shell in "${shells[@]}"; do
    test_shell_time "$shell" "$iterations"
  done
else
  # benchmark specific shell
  test_shell_time "$specific_shell" "$iterations"
fi
