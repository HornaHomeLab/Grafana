resource "grafana_rule_group" "rule_group_b3952b91f32aa265" {
  org_id           = 1
  name             = "Critical"
  folder_uid       = "fev69j4mpct8gb"
  interval_seconds = 30

  rule {
    name      = "Service is down"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"prometheus-DSM\"},\"editorMode\":\"code\",\"expr\":\"up{job=~\\\"Synology|Omada|Vault|grafana|loki|prometheus\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"lt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations    = {}
    labels         = {}
    is_paused      = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = []
    }
  }
}
