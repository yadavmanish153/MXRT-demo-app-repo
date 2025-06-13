#!/bin/bash

set -e

# Check if at least 3 arguments are passed
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <docker-username> <pat> <tag>"
    exit 1
fi

# Set your Docker Hub username
DOCKER_USERNAME="$1"
PAT = "$2"
TAG = "$3"

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo "$PAT" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Get all image names that belong to your Docker Hub username
images=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep "^$DOCKER_USERNAME/")

# Push each image
for image in $images; do
  echo "Pushing $image..."
  docker push "$image"
done

echo "✅ All images pushed to Docker Hub."
