output "tap_kubeconfig" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.tap.kube_config_raw
}

output "tap_bootstrap_yaml" {
  sensitive = true
  value     = <<-EOT
apiVersion: v1
kind: Secret
metadata:
  name: bootstrap-credentials
  namespace: tanzu-cluster-essentials-bootstrap
type: Opaque
stringData:
  INSTALL_REGISTRY_USERNAME: ${var.tanzu_net_username}
  INSTALL_REGISTRY_PASSWORD: ${var.tanzu_net_password}
EOT
}

output "tap_yaml" {
  sensitive = true
  value     = <<-EOT
apiVersion: v1
kind: Secret
metadata:
  name: gitops-values
  namespace: tap-gitops
type: Opaque
stringData:
  values.yml: |
    tap:
      title: ${var.tap_title}
      version: "${var.tap_version}"
      profile: full
      ingress:
        domain: ${var.tap_ingress_domain}
      catalog: ${var.tap_catalog}
      registry:
        username: ${var.tap_registry_username}
        password: ${var.tap_registry_password}
        hostname: ${var.tap_registry_hostname}
        repo: ${var.tap_registry_repo}
      db:
        hostname: ${module.tap_gui_db.db_host}
        username: ${module.tap_gui_db.db_user}
        password: ${module.tap_gui_db.db_password}
    github:
      accessToken: ${var.github_access_token}
      oidc:
        clientId: ${var.github_oidc_clientId}
        clientSecret: ${var.github_oidc_clientSecret}
---
apiVersion: v1
kind: Secret
metadata:
  name: github-credentials
  namespace: tap-gitops
type: Opaque
stringData:
  username: github
  password: ${var.github_access_token}
EOT
}
