#! /usr/bin/env bash
bun pm ls -g | sed 's/\x1B\[[0-9;]*[mK]//g' | awk '/├── |└── /{print $2}' > packages.txt
