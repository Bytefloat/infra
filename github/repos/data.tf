data "terraform_remote_state" "teams" {
  backend = "cos"
  config = {
    bucket = "tf-state-1315804574"
    region = "ap-chengdu"
    prefix = "bytefloat/github/teams"
  }
}
