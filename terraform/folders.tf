locals {
  folders = {
    "Vault" : "vault-uid",
    "Omada" : "omada-uid",
    "Grafana LGTM" : "grafana-lgtm-uid",
  }
}

resource "grafana_folder" "folders" {
  for_each = local.folders
  title    = each.key
  uid      = each.value
}
