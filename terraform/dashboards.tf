locals {
  dashboard_folders = {
    "Vault.json"              = lookup(local.folders, "Vault", null),
    "AccessPoint.json"        = lookup(local.folders, "Omada", null),
    "Router.json"             = lookup(local.folders, "Omada", null),
    "Switch.json"             = lookup(local.folders, "Omada", null),
    "Site_Overview.json"      = lookup(local.folders, "Omada", null),
    "Loki.json"               = lookup(local.folders, "Grafana LGTM", null),
    "Prometheus.json"         = lookup(local.folders, "Grafana LGTM", null),
    "Prometheus_Targets.json" = lookup(local.folders, "Grafana LGTM", null),
    "Synology.json"           = lookup(local.folders, "Synology", null),
    "UPS.json"                = lookup(local.folders, "Synology", null),
  }
}

resource "grafana_dashboard" "oob_dashboards" {
  depends_on  = [grafana_folder.folders]
  for_each    = fileset("${path.module}/../Dashboards", "*.json")
  config_json = file("${path.module}/../Dashboards/${each.value}")
  folder      = lookup(local.dashboard_folders, each.value, null)
  overwrite   = true
}
