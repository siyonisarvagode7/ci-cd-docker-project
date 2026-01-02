#!/bin/bash
set -e

echo "Pulling latest images..."
docker pull siyo22/backend:latest
docker pull siyo22/frontend:latest

echo "Stopping old containers..."
docker compose -f docker-compose.staging.yml down --remove-orphans

echo "Starting new containers..."
docker compose -f docker-compose.staging.yml up -d

echo "Running database migrations..."
docker run --rm siyo22/backend:latest python migrate.py

echo "Verifying deployment..."
curl -f http://localhost:5000/health || exit 1

echo "Deployment successful"
