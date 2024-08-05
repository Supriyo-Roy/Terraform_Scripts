terraform {
  required_providers {
    kubernetes ={
        source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
# provider "helm" {
#   kubernetes {
#     config_path    = "~/.kube/config"
#     config_context = "minikube"
#   }
# }

provider "helm" {
  kubernetes {
    host                   = "https://192.168.49.2:8443"
    cluster_ca_certificate = file("/root/.minikube/ca.crt")
    client_certificate     = file("/root/.minikube/profiles/minikube/client.crt")
    client_key             = file("/root/.minikube/profiles/minikube/client.key")
  }
}




