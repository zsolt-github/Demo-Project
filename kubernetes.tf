resource "kubernetes_namespace" "k8s-ns-development" {
  metadata {
    name = "development"
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "kubernetes_namespace" "k8s-ns-test" {
  metadata {
    name = "test"
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "kubernetes_namespace" "k8s-ns-production" {
  metadata {
    name = "production"
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}


/*
resource "kubernetes_deployment" "test" {
  metadata {
    name = "test"
    namespace= kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "test"
      }
    }
    template {
      metadata {
        labels = {
          app  = "test"
        }
      }
      spec {
        container {
          image = "nginx:1.19.4"
          name  = "nginx"

          resources {
            limits = {
              memory = "512M"
              cpu = "1"
            }
            requests = {
              memory = "256M"
              cpu = "50m"
            }
          }
        }
      }
    }
  }
}

resource helm_release nginx_ingress {
  name       = "nginx-ingress-controller"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
*/