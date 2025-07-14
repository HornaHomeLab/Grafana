resource "grafana_data_source" "prometheus" {
  type               = "prometheus"
  name               = "prometheus"
  uid                = "prometheus-DSM"
  url                = "https://prometheus.horna.local"
  basic_auth_enabled = false
  is_default         = true

  json_data_encoded = jsonencode({
    httpMethod        = "POST"
    cacheLevel        = "High"
    prometheusType    = "prometheus"
    prometheusVersion = "> 2.50.x"
    serverName        = "",
    tlsAuth           = false,
    tlsAuthWithCACert = true
  })
  secure_json_data_encoded = jsonencode({
    tlsCACert = data.vault_generic_secret.certs["prometheus.horna.local"].data["certificate"]
  })
}
resource "grafana_data_source" "loki" {
  type               = "loki"
  name               = "loki"
  uid                = "loki-DSM"
  url                = "https://loki.horna.local"
  basic_auth_enabled = false
  is_default         = false

  json_data_encoded = jsonencode({
    serverName        = "",
    tlsAuth           = false,
    tlsAuthWithCACert = true
  })
  secure_json_data_encoded = jsonencode({
    tlsCACert = data.vault_generic_secret.certs["loki.horna.local"].data["certificate"]
  })
}
resource "grafana_data_source" "influx" {
  type               = "influxdb"
  name               = "influxDB"
  uid                = "influxdb-dsm"
  url                = data.vault_generic_secret.influx_creds.data["url"]
  basic_auth_enabled = false
  is_default         = false

  json_data_encoded = jsonencode({
    "httpMode"     = "POST",
    "organization" = "Horna",
    "version"      = "Flux"
  })

  secure_json_data_encoded = jsonencode({
    token = data.vault_generic_secret.influx_creds.data["grafana_token"]
  })
}
