provider "vault" {
  address = "https://vault.horna.local"

  # AppRole authentication
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

data "vault_generic_secret" "grafana_creds" {
  path = "infrastructure/grafana.horna.local"
}
data "vault_generic_secret" "certs" {
  for_each = toset([
    "prometheus.horna.local",
    "loki.horna.local"
  ])
  path = "cert_secrets/${each.value}"
}
data "vault_generic_secret" "gh_oauth_grafana" {
  path = "external_providers/GH_o_auth_app_Grafana"
}
