#!/bin/bash
set -e

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <docker-username> <tag>"
    exit 1
fi

# Set your Docker Hub username
DOCKER_USERNAME="$1"
TAG="$2"

# Root directory to start searching from (can also be set to a specific path)
ROOT_DIR="./apps"

# Find all Dockerfile files in subdirectories
find "$ROOT_DIR" -type f -name "Dockerfile" | while read -r build_script; do
    # Get the directory of the Dockerfile script
    dir=$(dirname "$build_script")
    echo "Executing Dockerfile in $dir"
    
    # Build Docker image
    cd "$dir"
    echo $(basename "$dir")
    image_name=$(basename "$dir")
    tag="latest"
    echo "image_name is $image_name"
    docker build -t $image_name:$tag .
    docker tag $image_name:$TAG $DOCKER_USERNAME/$image_name:$tag
    
    # Optional: check if it succeeded
    if [ $? -ne 0 ]; then
        echo "Error: docker-build.sh failed in $dir"
    fi
done