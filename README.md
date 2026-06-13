# DevOps Portfolio — Full-Scale CI/CD Pipeline

Full-scale CI/CD pipeline — Java app built with Maven, scanned with SonarQube and Trivy, containerized with Docker, and deployed to Kubernetes on EKS via ArgoCD GitOps automation.
<img width="1447" height="736" alt="full-scale-project" src="https://github.com/user-attachments/assets/d7f2e5b6-4b81-49b1-817b-42cc3c13840e" />

## Pipeline Flow

```
Developer git push
      ↓
GitHub Repository
      ↓
Jenkins CI (webhook trigger)
      ↓
SonarQube scan → Quality Gate
      ↓
Maven build (mvn clean package)
      ↓
Docker build image
      ↓
Trivy security scan
      ↓
Push to DockerHub
      ↓
Update image tag in deployment.yaml → push to GitHub
      ↓
ArgoCD detects change → syncs to EKS
      ↓
Kubernetes rolling update → Live app
```

## Tech Stack
Java • Maven • Jenkins • SonarQube • Trivy • Docker • DockerHub • ArgoCD • Kubernetes • EKS • AWS

## Project Structure
- `src/` — Java web application source code
- `deploymentfiles/` — Kubernetes manifests (watched by ArgoCD)
- `Dockerfile` — Builds WAR into Tomcat image
- `Jenkinsfile` — Full CI/CD pipeline definition
- `pom.xml` — Maven build configuration

## Infrastructure
| Server | Type | Purpose |
|--------|------|---------|
| Jenkins | t3.medium | CI pipeline execution |
| SonarQube | t3.medium | Code quality analysis |
| EKS Nodes | t3.small × 2 | Kubernetes workloads |

## Author
**Vamshidhar Reddy Neelipally**
AWS Certified Cloud Practitioner
[LinkedIn](https://www.linkedin.com/in/n-vamshidhar-reddy/) • [DockerHub](https://hub.docker.com/u/vamshi82) • [GitHub](https://github.com/VAMSHIDHARREDDYn)
