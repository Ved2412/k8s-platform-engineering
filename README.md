# K8s Platform Engineering & DevSecOps Pipeline

This repository demonstrates a modern, GitOps-driven Kubernetes platform engineering workflow. It combines containerized application deployment, Helm package management, automated CI/CD with shift-left security, and ArgoCD for continuous reconciliation.

## 🧠 Architecture & Flow

- **Infrastructure as Code:** The base infrastructure (VPC, GKE, IAM) is provisioned using the companion repository: `gcp-infra-platform`.
- **Containerization:** A simple Nginx application is packaged using a Dockerfile.
- **Package Management:** The application manifests are templated using Helm (`my-nginx-chart`), allowing for environment-specific configurations.
- **CI/CD & Supply Chain Security:** 
  - GitHub Actions automatically builds the Docker image upon a push to `main`.
  - The pipeline runs Trivy to scan the image for critical CVEs (Shift-Left Security).
  - The secure image is pushed to the GitHub Container Registry (GHCR).
- **GitOps Deployment:** ArgoCD watches this repository. When the Helm `values.yaml` is updated with the new image tag, ArgoCD automatically syncs the cluster, pulling the secure image and updating the deployment with zero downtime.

## 🛠️ Tech Stack

- **Containerization:** Docker
- **Orchestration:** Kubernetes (Local Docker Desktop / GKE Ready)
- **Package Management:** Helm
- **CI/CD:** GitHub Actions
- **Security:** Trivy (CVE Scanning)
- **GitOps:** ArgoCD

## 📁 Repository Structure

- `.github/workflows/ci.yml`: The DevSecOps CI/CD pipeline.
- `my-nginx-chart/`: The Helm chart used for deployment.
- `argocd/`: ArgoCD Application manifests.
- `Dockerfile`: Blueprint for the containerized application.
