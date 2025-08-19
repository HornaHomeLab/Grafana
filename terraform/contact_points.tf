resource "grafana_contact_point" "contact_point_slack" {
  name = "Slack-channel"

  slack {
    url     = data.vault_generic_secret.slack_creds.data["slack-app-grafana-webhook-grafana-alerts"]
    text = file("${path.module}/../Templates/alert_slack_message.tpl")
  }
}

resource "grafana_contact_point" "contact_point_both_slack_email" {
  name = "Slack and Email"

  slack {
    url     = data.vault_generic_secret.slack_creds.data["slack-app-grafana-webhook-grafana-alerts"]
    text = file("${path.module}/../Templates/alert_slack_message.tpl")
  }

  email {
    addresses = ["stanislawhorna@outlook.com"]

  }
}
