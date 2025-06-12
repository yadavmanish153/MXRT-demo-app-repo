
# Define image name and tag
IMAGE_NAME="my-app"
IMAGE_TAG="latest"


echo "Building Docker image: $IMAGE_NAME:$IMAGE_TAG"

# Build the Docker image
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

echo "Docker image built successfully!"
