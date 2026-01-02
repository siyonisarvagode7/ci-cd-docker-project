#!/bin/bash
docker pull yourdockerhub/backend:latest
docker pull yourdockerhub/frontend:latest

docker-compose down
docker-compose up -d
