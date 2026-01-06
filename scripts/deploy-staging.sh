#!/bin/bash
set -e

echo "🚀 Starting STAGING deployment..."

docker pull siyo22/backend:staging
docker pull siyo22/frontend:staging

docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d

echo "✅ Staging deployment completed"
docker ps
