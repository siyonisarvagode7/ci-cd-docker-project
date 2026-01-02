# Application Architecture

The application follows a containerized 2-tier architecture.

## Components

- Frontend (Nginx)
- Backend (Flask API)
- Database (PostgreSQL)

## Flow

User → Frontend → Backend → Database

Each service runs in its own Docker container and communicates
over a Docker bridge network.
