#!/bin/bash

# Root directory to start searching from (can also be set to a specific path)
ROOT_DIR="./apps"

# Find all Dockerfile files in subdirectories
find "$ROOT_DIR" -type f -name "Dockerfile" | while read -r build_script; do
    # Get the directory of the Dockerfile script
    dir=$(dirname "$build_script")
    echo "Executing Dockerfile in $dir"
    
    # Change to that directory
    (cd "$dir" && chmod +x Dockerfile && ./Dockerfile)
    image_name=basename "$PWD"
    echo "image_name is $image_name"
    docker build -t image_name .
    
    # Optional: check if it succeeded
    if [ $? -ne 0 ]; then
        echo "Error: docker-build.sh failed in $dir"
    fi
done