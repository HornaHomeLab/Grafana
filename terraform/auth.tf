resource "grafana_sso_settings" "github_sso_settings" {
  provider_name = "github"
  oauth2_settings {
    name                       = "Github"
    client_id                  = data.vault_generic_secret.gh_oauth_grafana.data["client_id"]
    client_secret              = data.vault_generic_secret.gh_oauth_grafana.data["client_secret"]
    allow_sign_up              = true
    auto_login                 = false
    scopes                     = "user:email,read:org"
    role_attribute_path        = <<EOT
      contains(groups[*], '@HornaHomeLab/gf-admin') && 'GrafanaAdmin' ||
      contains(groups[*], '@HornaHomeLab/gf-editor') && 'Editor' ||
      'Viewer'
    EOT
    allow_assign_grafana_admin = true
  }
}
