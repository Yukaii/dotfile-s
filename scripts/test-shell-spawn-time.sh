#!/bin/bash
# you're welcome for this gift of multi-shell benchmarking.

# function to test spawn time for a given shell
test_shell_time() {
    local shell_name=$1

    # check if the shell exists on the system
    if ! command -v "$shell_name" &>/dev/null; then
        echo "error: $shell_name not found on this system. maybe install it first?"
        return
    fi

    # benchmark using time and extract the 'real' time
    local spawn_time=$( ( time $shell_name -c "exit" ) 2>&1 | grep real | awk '{print $2}' )

    # parse and convert 'm:ss.ms' to milliseconds
    local minutes=$(echo "$spawn_time" | awk -F'm' '{print $1}')
    local seconds=$(echo "$spawn_time" | awk -F'm' '{print $2}' | awk -F's' '{print $1}')
    local total_time_ms=$(echo "$minutes * 60000 + $seconds * 1000" | bc)

    echo "$shell_name spawn time: ${total_time_ms} ms"
}

# main script: test all specified shells
echo "benchmarking shell spawn times..."

for shell in bash sh zsh fish; do
    test_shell_time "$shell"
done
