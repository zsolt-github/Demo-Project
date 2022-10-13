/*
resource "helm_release" "helm-jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = kubernetes_namespace.k8s-ns-development.metadata.0.name
  depends_on = [kubernetes_namespace.k8s-ns-development]

  values = [
    "${file("jenkins-values.yaml")}"
  ]

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_admin_password
  }

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

  #set {
  #  name  = "installPlugins"
  #  value = "- blueocean:1.25.8"
  #}

}
*/