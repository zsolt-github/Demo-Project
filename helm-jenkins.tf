# https://artifacthub.io/packages/helm/jenkinsci/jenkins
# https://github.com/jenkinsci/plugins

resource "helm_release" "helm-jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = kubernetes_namespace.k8s-ns-jenkins.metadata.0.name
  depends_on = [helm_release.helm-prometheus]
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]


  values = [
    "${file("./Jenkins-files/jenkins-values.yaml")}"
  ]

  set {
    name  = "controller.numExecutors"
    value = 2
  }

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_admin_password
  }

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

  #set {
  #  name  = "controller.additionalPlugins"
  #  value = "blueocean"
    #value = "cloudbees-disk-usage-simple=178.v1a_4d2f6359a_8 blueocean=1.25.8 prometheus=2.0.11"
    #value = {"cloudbees-disk-usage-simple" = "178.v1a_4d2f6359a_8", "blueocean" = "1.25.8", "prometheus" = "2.0.11"}
  #}

  set {
    name  = "controller.cloudName"
    value = "Zsolt-Kubernetes"
  }

  set {
    name  = "controller.prometheus.enabled"
    value = true
  }

  #set {
  #  name  = "controller.prometheus.serviceMonitorAdditionalLabels"
  #  value = "[release: prometheus]"
  #}

  set {
    name  = "agent.enabled"
    value = true
  }

  set {
    name  = "agent.podName"
    value = "jenkins-agent"
  }

}