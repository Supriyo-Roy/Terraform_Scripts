# Production-Level EKS Cluster Deployment with Terraform and Terraform Cloud

This repository contains Terraform configurations and modules for deploying a production-level Amazon EKS (Elastic Kubernetes Service) cluster using Terraform and Terraform Cloud. The deployment ensures robust infrastructure management and adheres to best practices for infrastructure as code (IaC).

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Terraform Sentinel Policies](#terraform-sentinel-policies)
- [Contributing](#contributing)
- [License](#license)

## Overview
This project demonstrates the deployment of a highly available and scalable EKS cluster in AWS using Terraform. By leveraging Terraform Cloud, we ensure that all configurations pass through necessary policy checks before being applied, thus maintaining compliance and best practices.

## Technologies Used
- **Terraform**: Infrastructure as Code tool for building, changing, and versioning infrastructure safely and efficiently.
- **Terraform Cloud**: A service for remote operations, policy enforcement, and state management. The remote state backend is managed by Terraform Cloud.
- **Amazon EKS**: Managed Kubernetes service for running Kubernetes at scale.
- **GitHub**: Version control and collaboration platform.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS credentials configured locally or through an IAM role.
- A Terraform Cloud account.

## Terraform Sentinel Policies
This project includes Sentinel policies to enforce:
1. **Instance Size Restriction**: Ensuring no instances larger than `t2.medium` are created.
2. **Node Label Requirement**: Ensuring all Kubernetes nodes have at least one label.

## How to integrate github with Terraform cloud 

'''
https://medium.com/techbeatly/automating-cloud-infrastructure-with-terraform-cloud-a-deep-dive-into-its-capabilities-9bc9d0aff929
'''
