# CI/CD Pipeline Flow

The CI/CD pipeline is implemented using GitHub Actions.

## Pipeline Steps

1. Code is pushed to the main branch
2. GitHub Actions checks out the code
3. Docker images are built for frontend and backend
4. Unit tests are executed inside the backend container
5. Trivy scans images for vulnerabilities
6. Images are pushed to Docker Hub
7. Application is deployed to staging environment
