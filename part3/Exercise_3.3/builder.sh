#!/bin/bash

# Usage
# ./builder.sh mluukkai/express_app accentut/testing

set -e  # exit immediately if a command fails

# --- Validate arguments ---
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github_owner/repo> <dockerhub_user/repo>"
  exit 1
fi

GITHUB_REPO="$1"
DOCKER_REPO="$2"
REPO_NAME=$(basename "$GITHUB_REPO")

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
