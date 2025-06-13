#!/bin/bash

set -e

# Set your Docker Hub username
DOCKER_USERNAME="manishyadav153@gmail.com"
PAT = "dckr_pat_1Ew9nI5jtxgXcyiIaN8R_9uJmXM"
TAG = "latest"

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
