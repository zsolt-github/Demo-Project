# https://artifacthub.io/packages/helm/jenkinsci/jenkins
# https://github.com/jenkinsci/plugins

resource "helm_release" "helm-jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  # namespace  = kubernetes_namespace.k8s-ns-development.metadata.0.name
  # depends_on = [kubernetes_namespace.k8s-ns-development]
  depends_on = [helm_release.helm-prometheus]


  values = [
    "${file("./Jenkins-files/jenkins-values.yaml")}"
  ]

/*

  set {
    name  = "controller.numExecutors"
    value = 5
  }

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_admin_password
  }

  set {
    name  = "controller.additionalPlugins"
    value = {"cloudbees-disk-usage-simple" = "178.v1a_4d2f6359a_8", "blueocean" = "1.25.8", "prometheus" = "2.0.11"}
  }

  set {
    name  = "controller.cloudName"
    value = "Zsolt-Kubernetes"
  }

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

  set {
    name  = "agent.podName"
    value = "jenkins-agent"
  }

  set {
    name  = "serviceAccount.name"
    value = "jenkins-serviceaccount"
  }




*/
  # https://stackoverflow.com/questions/67603287/terraform-helm-set-array-of-environment-variables-in-terraform
  
  #set {
  #  name  = "controller.additionalPlugins"
  #  value = {"cloudbees-disk-usage-simple" = "178.v1a_4d2f6359a_8", "blueocean" = "1.25.8", "prometheus" = "2.0.11"}
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