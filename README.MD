CI/CD Pipeline with Docker & GitHub Actions
 Project Overview

This project demonstrates a complete CI/CD pipeline using GitHub Actions and Docker to automatically build, test, scan, and deploy a simple containerized web application into a staging environment.

The main objective of this project is to understand and implement real-world DevOps practices, including containerization, image optimization, automated testing, security scanning, and deployment automation.

 Project Goals

Build a simple 2-tier web application

Containerize the application using Docker best practices

Automate the CI/CD process using GitHub Actions

Scan container images for vulnerabilities

Deploy the application automatically to a staging environment

Create clear documentation for architecture, pipeline, and operations

 Application Architecture
Components

Frontend

Static HTML/CSS

Served using Nginx

Backend

Python Flask application

Exposes simple API endpoints

Database

PostgreSQL

Persistent data using Docker volumes

CI/CD

GitHub Actions for automation

Container Registry

Docker Hub

Architecture Flow
User
  ↓
Frontend (Nginx Container)
  ↓
Backend (Flask Container)
  ↓
PostgreSQL Database


All components run as separate containers connected via Docker networking.

 Project Structure
ci-cd-docker-app/
│
├── backend/                 # Flask backend service
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── tests/
│       └── test_app.py
│
├── frontend/                # Static frontend (Nginx)
│   ├── index.html
│   ├── styles.css
│   ├── nginx.conf
│   └── Dockerfile
│
├── database/
│   └── init.sql             # Database initialization script
│
├── docker-compose.yml       # Local & staging orchestration
│
├── scripts/                 # Deployment & utility scripts
│   ├── deploy-staging.sh
│   ├── migrate-db.sh
│   └── health-check.sh
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml        # GitHub Actions pipeline
│
├── docs/                    # Project documentation
│   ├── architecture.md
│   ├── pipeline.md
│   ├── runbook.md
│   └── troubleshooting.md
│
├── .env
└── README.md

 Docker Implementation
Docker Best Practices Used

Multi-stage builds

Reduces final image size

Keeps runtime images lightweight

Non-root user

Improves container security

Layer caching

Faster builds during CI

Environment variables

Cleaner configuration management

Minimal base images

python:slim, nginx:alpine

 CI/CD Pipeline (GitHub Actions)

The CI/CD pipeline is triggered automatically on every push to the main branch.

Pipeline Stages

Checkout Code

Pulls the latest code from GitHub

Build Docker Images

Backend image

Frontend image

Run Unit Tests

Backend tests executed inside containers

Security Scanning

Trivy scans images for known vulnerabilities

Push Images

Images are tagged and pushed to Docker Hub

Deploy to Staging

Latest images are pulled

Old containers are stopped

New containers are started

Health check is performed

 GitHub Actions Setup
Workflow File
.github/workflows/ci-cd.yml

Required GitHub Secrets
Secret Name	Description
DOCKER_USERNAME	Docker Hub username
DOCKER_PASSWORD	Docker Hub password or token
 Local Development
Prerequisites

Docker Desktop

Docker Compose

Git

Start Application Locally
docker-compose up -d

Verify Services

Frontend: http://localhost

Backend Health Check:

http://localhost:5000/health

 Deployment (Staging)

Deployment is handled using shell scripts.

Deploy to Staging
bash scripts/deploy-staging.sh

Verify Deployment
bash scripts/health-check.sh

 Security Considerations

Container images are scanned using Trivy

Non-root containers reduce attack surface

Secrets are stored securely using GitHub Secrets

Database data persists using Docker volumes

 Documentation Included

Document	            Purpose
architecture.md  	Application & container architecture
pipeline.md	        CI/CD pipeline flow explanation
runbook.md	        Deployment and rollback procedures
troubleshooting.md	Common issues and fixes