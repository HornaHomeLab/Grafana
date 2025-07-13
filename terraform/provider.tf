terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.2.0"
    }
  }
}
provider "grafana" {
  url                  = data.vault_generic_secret.grafana_creds.data["url"]
  auth                 = "${data.vault_generic_secret.grafana_creds.data["username"]}:${data.vault_generic_secret.grafana_creds.data["password"]}"
  insecure_skip_verify = true 
}
