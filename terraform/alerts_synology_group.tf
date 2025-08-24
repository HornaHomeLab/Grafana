resource "grafana_rule_group" "rule_group_77af393e131f9db4" {
  org_id             = 1
  name               = "1m"
  folder_uid         = grafana_folder.folders["Synology"].uid
  interval_seconds   = 60
  disable_provenance = true

  rule {
    name      = "High System Temperature"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"temperature{job=\\\"Synology\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[80],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "2e2c4a98-bc92-4dd5-b658-a08726355f7e"
      __panelId__      = "32"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "High Disk Temperature"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"diskTemperature{job=\\\"Synology\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[50],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "2e2c4a98-bc92-4dd5-b658-a08726355f7e"
      __panelId__      = "32"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
}
resource "grafana_rule_group" "rule_group_9ab1b1938a451b90" {
  org_id             = 1
  name               = "5m"
  folder_uid         = grafana_folder.folders["Synology"].uid
  interval_seconds   = 300
  disable_provenance = true

  rule {
    name      = "Unhealthy Disk"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"diskStatus{job=\\\"Synology\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "2e2c4a98-bc92-4dd5-b658-a08726355f7e"
      __panelId__      = "27"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "Unhealthy RAID"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"raidStatus{job=\\\"Synology\\\", raidName=~\\\"Volume [0-9]+$\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "2e2c4a98-bc92-4dd5-b658-a08726355f7e"
      __panelId__      = "28"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "Unhealthy System"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"systemStatus{job=\\\"Synology\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[1],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "5m"
    annotations = {
      __dashboardUid__ = "2e2c4a98-bc92-4dd5-b658-a08726355f7e"
      __panelId__      = "29"
    }
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "No Synology data"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "prometheus-DSM"
      model          = "{\"editorMode\":\"code\",\"expr\":\"up{job=\\\"Synology\\\"}\",\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
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
    labels    = {}
    is_paused = false

    notification_settings {
      contact_point = grafana_contact_point.contact_point_both_slack_email.name
      group_by      = null
      mute_timings  = []
    }
  }
}
