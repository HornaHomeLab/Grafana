resource "grafana_rule_group" "rule_group_7f266e298a8ed69c" {
  org_id           = 1
  name             = "Critical"
  folder_uid       = "beurdrjuvk2dcc"
  interval_seconds = 30

  rule {
    name      = "Sealed HCP Vault"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"(\\n  (vault_core_unsealed{job=\\\"Vault\\\"} == 0)\\n  OR\\n  absent(vault_core_unsealed{job=\\\"Vault\\\"})\\n)\\nOR on() vector(0)\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "30s"
    annotations = {
      __dashboardUid__ = "vaults"
      __panelId__      = "47"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
}
