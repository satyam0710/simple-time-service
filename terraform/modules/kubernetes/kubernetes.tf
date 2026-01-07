resource "kubernetes_namespace" "demo_app_namespace" {
  metadata {
    name = "demo-app"
  }
}
