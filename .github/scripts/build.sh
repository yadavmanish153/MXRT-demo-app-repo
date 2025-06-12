#!/bin/bash

# Root directory to start searching from (can also be set to a specific path)
ROOT_DIR="./apps"

# Find all build.sh files in subdirectories
find "$ROOT_DIR" -type f -name "build.sh" | while read -r build_script; do
    # Get the directory of the build.sh script
    dir=$(dirname "$build_script")
    echo "Executing build.sh in $dir"
    
    # Change to that directory
    cd "$dir"
    ls
    chmod +x build.sh
    
    # Optional: check if it succeeded
    if [ $? -ne 0 ]; then
        echo "Error: build.sh failed in $dir"
    fi
done