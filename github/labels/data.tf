data "terraform_remote_state" "repos" {
  backend = "cos"
  config = {
    bucket = "tf-state-1315804574"
    region = "ap-chengdu"
    prefix = "bytefloat/github/repos"
  }
}
