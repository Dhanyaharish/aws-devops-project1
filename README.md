# AWS DevOps Infrastructure Project

This project implements a fully automated CI/CD pipeline and Infrastructure-as-Code (IaC) deployment for a web application.

## Project Architecture


## Features
- **CI/CD Pipeline:** Automated build and push to Docker Hub using GitHub Actions.
- **Infrastructure as Code:** Provisions AWS EC2 instances using Terraform.
- **Automated Deployment:** Continuous deployment of containerized applications to AWS.

## Technologies Used
- **Cloud:** AWS (EC2)
- **IaC:** Terraform
- **Automation:** GitHub Actions
- **Containerization:** Docker & Docker Hub

## Getting Started
1. Clone the repository.
2. Configure AWS credentials.
3. Use `terraform apply` to provision infrastructure.
4. Push changes to `main` to trigger the CI/CD pipeline.

## Documentation
- [Official Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/get-started/)
