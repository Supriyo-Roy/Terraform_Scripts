# Deploying Kubernetes Resources: Terraform Helm Provider vs. Manual Deployment

## Introduction

When managing Kubernetes applications, you can deploy resources using various methods. Two common approaches are utilizing the Helm provider with Terraform and deploying manually. This guide explains these methods, their benefits, and provides example configurations.

## 1. Deploying with Terraform Helm Provider

### Overview

The Helm provider in Terraform allows you to manage Helm charts as Terraform resources. Helm is a package manager for Kubernetes that simplifies application deployment and management.

### Benefits

- **Declarative Management**: Define Helm charts and configurations as code, making deployments predictable and reproducible.
- **Infrastructure as Code (IaC)**: Integrates with Terraform’s IaC approach, managing both infrastructure and application deployments in one place.
- **Version Control**: Version Helm charts and Terraform configurations for rollback and history tracking.
- **Consistency**: Ensures uniform configurations across different environments.

### Example Configuration

Here’s how you can define a Helm release for an Nginx application using Terraform:

```hcl
provider "helm" {
  kubernetes {
    host                   = "https://192.168.49.2:8443"
    cluster_ca_certificate = file("/root/.minikube/ca.crt")
    client_certificate     = file("/root/.minikube/profiles/minikube/client.crt")
    client_key             = file("/root/.minikube/profiles/minikube/client.key")
  }
}

resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  version    = "9.3.9"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
