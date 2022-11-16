resource "kubernetes_namespace" "k8s-ns-development" {
  metadata {
    name = "development"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}

resource "kubernetes_namespace" "k8s-ns-production" {
  metadata {
    name = "production"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}

/*
resource "kubernetes_namespace" "k8s-ns-test" {
  metadata {
    name = "test"
  }
  #depends_on = [azurerm_kubernetes_cluster.aks]
  depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]
}


resource "kubernetes_deployment" "deployment-dev-1" {
  metadata {
    name = "deployment-nginx"
    namespace = kubernetes_namespace.k8s-ns-development.metadata.0.name
    labels = {
      deployement = "deployment-web-frontend"
    }
  }
 
  spec {
    replicas = 2
    
    selector {
      match_labels = {
        app = "web-frontend"
      }
    }
  
    template {
      metadata {
        labels = {
          app  = "web-frontend"
        }
      }
  
      spec {
        container {
          name  = "nginx"
          image = "nginx:1.19.4"

          resources {
            requests = {
              cpu = "50m"
              memory = "128M"              
            }
            limits = {
              cpu = "100m"
              memory = "256M"              
            }
          }
        }
      }
    }
  }
}



resource "kubernetes_service" "service-web_frontend" {
  metadata {
    name = "service-web-frontend"
    namespace = kubernetes_namespace.k8s-ns-development.metadata.0.name
  }
  
  spec {
    selector = {
      app = "web-frontend"
    }
    session_affinity = "ClientIP"
    
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

*/