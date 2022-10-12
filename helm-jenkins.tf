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

}
*/