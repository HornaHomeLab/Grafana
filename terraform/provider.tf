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
terraform {
  backend "http" {
    address = "http://10.0.10.11:8001/state/Grafana/prod"
  }
}
data "terraform_remote_state" "foo" {
  backend = "http"
  config = {
    address = "http://10.0.10.11:8001/state/Grafana/prod"
  }
}
