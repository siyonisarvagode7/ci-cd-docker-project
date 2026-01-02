#!/bin/bash

echo "Running database migrations..."

docker exec -i postgres-db psql \
  -U appuser \
  -d appdb \
  < database/init.sql

echo "Database migration completed."
