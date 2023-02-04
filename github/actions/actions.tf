resource "github_actions_organization_secret" "TENCENTCLOUD_APP_ID" {
  secret_name = "TENCENTCLOUD_APP_ID"
  visibility  = "all"

  plaintext_value = var.TENCENTCLOUD_APP_ID
}

