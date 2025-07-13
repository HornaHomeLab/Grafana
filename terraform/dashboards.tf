resource "grafana_dashboard" "oob_dashboards" {
  for_each = fileset("${path.module}/../Dashboards", "*.json")
  config_json = file("${path.module}/../Dashboards/${each.value}")
  overwrite = true
}
