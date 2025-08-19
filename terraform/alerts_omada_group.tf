resource "grafana_rule_group" "rule_group_fa7ce5e576608fff" {
  org_id             = 1
  name               = "Critical"
  folder_uid         = grafana_folder.folders["Omada"].uid
  interval_seconds   = 30
  disable_provenance = true

  rule {
    name      = "WAN Packet loss"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"port_internet_loss{job=\\\"Omada\\\"}\\n* on (macAddress, portID) group_left(portName, portMode)\\n  max(port_info{job=\\\"Omada\\\", portMode=\\\"WAN\\\"} == 1) by (macAddress, portID, portName, portMode)\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[5],\"type\":\"gte\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "KeepLast"
    for            = "30s"
    annotations = {
      __dashboardUid__ = "ddw9t1fudd88wb"
      __panelId__      = "9"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack and Email"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "No Active WAN Ports"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"count(port_upstream_state{job=\\\"Omada\\\"} == 1)\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
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
    exec_err_state = "KeepLast"
    for            = "30s"
    annotations = {
      __dashboardUid__ = "ddw9t1fudd88wb"
      __panelId__      = "7"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack and Email"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "Device Heartbeat missing"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"time() - (device_last_seen{job=\\\"Omada\\\"}/1000)\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[120],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "KeepLast"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "d8f7ba8c-a7b5-4d9a-a1d7-8dc57a053f66"
      __panelId__      = "8"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack and Email"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "No Omada data"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"up{job=\\\"Omada\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
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
    annotations = {
      __dashboardUid__ = "9728820d-9ed8-4215-beff-8d591d3a467e"
      __panelId__      = "1"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack and Email"
      group_by      = null
      mute_timings  = null
    }
  }
}
resource "grafana_rule_group" "rule_group_04db20b6c60eef48" {
  org_id           = 1
  name             = "Warning"
  folder_uid       = grafana_folder.folders["Omada"].uid
  interval_seconds = 300
  disable_provenance = true

  rule {
    name      = "Pending updates"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"device_upgrade_needed{job=\\\"Omada\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "KeepLast"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "d8f7ba8c-a7b5-4d9a-a1d7-8dc57a053f66"
      __panelId__      = "8"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack-channel"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "Increased WAN Latency"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"port_internet_latency{job=\\\"Omada\\\"}\\n* on (macAddress, portID) group_left(portName, portMode)\\n  max(port_info{job=\\\"Omada\\\", portMode=\\\"WAN\\\"} == 1) by (macAddress, portID, portName, portMode)\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "KeepLast"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "ddw9t1fudd88wb"
      __panelId__      = "10"
    }
    is_paused = false

    notification_settings {
      contact_point = "Slack-channel"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "Radio Interference"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"radio_interference{job=\\\"Omada\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[5],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "KeepLast"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "bdwa3qd4rwidce"
      __panelId__      = "4"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
}
