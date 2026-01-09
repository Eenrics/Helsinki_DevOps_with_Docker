#!/bin/sh

set -e

# --- Validate arguments ---
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github_owner/repo> <dockerhub_user/repo>"
  exit 1
fi

GITHUB_REPO="$1"
DOCKER_REPO="$2"
REPO_NAME=$(basename "$GITHUB_REPO")

# --- Check Docker Hub credentials ---
if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PWD" ]; then
  echo "Please provide DOCKER_USER and DOCKER_PWD environment variables"
  exit 1
fi

# --- Login to Docker Hub ---
echo "Logging in to Docker Hub as $DOCKER_USER"
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin

# --- Clone repository ---
echo "Cloning https://github.com/$GITHUB_REPO.git"
git clone "https://github.com/$GITHUB_REPO.git"
cd "$REPO_NAME"

# --- Build Docker image ---
echo "Building Docker image $DOCKER_REPO:latest"
docker build -t "$DOCKER_REPO:latest" .

# --- Push to Docker Hub ---
echo "Pushing image to Docker Hub"
docker push "$DOCKER_REPO:latest"

echo "✅ Done!"
