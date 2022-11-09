
resource "helm_release" "helm-jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  # namespace  = kubernetes_namespace.k8s-ns-development.metadata.0.name
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

  # https://stackoverflow.com/questions/67603287/terraform-helm-set-array-of-environment-variables-in-terraform
  
  #set {
  #  name  = "installPlugins"
  #  value = {"- kubernetes" = "3706.vdfb_d599579f3", "- workflow-aggregator" = "590.v6a_d052e5a_a_b_5", "- git" = "4.11.5", "- configuration-as-code" = "1512.vb_79d418d5fc8", "- blueocean" = "1.25.8"}
  #}

  # or

  #set {
  #  name  = "installPlugins[0].name"
  #  value = "- kubernetes"
  #}  
  #set {
  #  name  = "installPlugins[0].value"
  #  value = "3706.vdfb_d599579f3"
  #}  
  #set {
  #  name  = "installPlugins[1].name"
  #  value = "- workflow-aggregator"
  #}  
  #set {
  #  name  = "installPlugins[1].value"
  #  value = "590.v6a_d052e5a_a_b_5"
  #}  


}