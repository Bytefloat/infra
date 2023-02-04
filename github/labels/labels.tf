locals {
  gh_org = var.organization

  colors = {
    "inactive" : "D2DAE1"
    "addition" : "008672"
    "problem" : "ee0701"
    "environment" : "0066ff"
    "pending" : "fbca04"
    "improvement" : "0075ca"
    "ending" : "C7DEF8"
  }
  labels = [
    {
      name : "priority/p0",
      color : local.colors.problem,
      description : "紧急：安全性问题、严重的 Bug 、导致阻塞的问题，每一分钟都会让我们损失钱。停下正在进行的一切直到这个问题解决。"
    },
    {
      name : "priority/p1",
      color : local.colors.problem,
      description : "第二大优先级，应在 P0 优先级问题完成后立即开展工作，P1 级别的问题必须在下一个版本/迭代中解决。"
    },
    {
      name : "priority/p2",
      color : local.colors.improvement,
      description : "正常优先级：意味着「不错的选择」，默认的优先级别。"
    },
    {
      name : "size/XS",
      color : "3CBF00",
      description : "Denotes a PR that changes 0-9 lines."
    },
    {
      name : "size/S",
      color : "5D9801",
      description : "Denotes a PR that changes 10-29 lines."
    },
    {
      name : "size/M",
      color : "7F7203",
      description : "Denotes a PR that changes 30-99 lines."
    },
    {
      name : "size/L",
      color : "A14C05",
      description : "Denotes a PR that changes 100-499 lines."
    },
    {
      name : "size/XL",
      color : "C32607",
      description : "Denotes a PR that changes 500-999 lines."
    },
    {
      name : "size/XXL",
      color : "E50009",
      description : "Denotes a PR that changes 1000+ lines."
    },
    {
      name : "type/dependencies",
      color : local.colors.addition,
      description : "Dependencies: depend on updates from other projects."
    },
    {
      name : "type/documentation",
      color : local.colors.addition,
      description : "Improvements or additions to documentation"
    },
    {
      name : "type/feature-request",
      color : local.colors.addition,
      description : "New feature or request"
    },
    {
      name : "type/performance",
      color : local.colors.improvement,
      description : "Performance: performance related issues."
    },
    {
      name : "type/refactor",
      color : local.colors.improvement,
      description : "Refactor: a code change that neither fixes a bug nor adds a feature."
    },
    {
      name : "type/test",
      color : local.colors.addition,
      description : "Test: tests, examples, or other code snippets."
    },
    {
      name : "type/wontfix",
      color : local.colors.inactive,
      description : "Won't fix: the issue or pull request won't be fixed."
    },
    {
      name : "type/stale",
      color : local.colors.inactive,
      description : "Workaround: the issue or pull request is a temporary workaround."
    },
    {
      name : "type/bug",
      color : local.colors.problem,
      description : "Bug: a bug."
    },
    {
      name : "type/duplicate",
      color : local.colors.inactive,
      description : "Duplicate: the issue or pull request is a duplicate of another issue or pull request."
    },
    {
      name : "type/breaking-change",
      color : local.colors.problem,
      description : "Breaking change: the issue or pull request breaks a previously deployed version."
    },
    {
      name : "type/invalid",
      color : local.colors.inactive,
      description : "Invalid: the issue or pull request is invalid."
    },
    {
      name : "type/need-attention",
      color : local.colors.pending,
      description : "Needs attention: the issue or pull request needs your attention."
    },
    {
      name : "type/need-more-info",
      color : local.colors.pending,
      description : "Needs more info: the issue or pull request needs more information."
    },
    {
      name : "type/question",
      color : local.colors.pending,
      description : "Question: the issue or pull request is a question."
    },
    {
      name : "status/under-consideration",
      color : local.colors.pending,
      description : "Under consideration: the issue or pull request is under consideration."
    },
    {
      name : "status/wait-for-response",
      color : local.colors.pending,
      description : "Waiting for response: the issue or pull request is waiting for a response."
    },
    {
      name : "status/delayed",
      color : local.colors.pending,
      description : "Delayed: the issue or pull request is delayed."
    },
    {
      name : "status/dont-merge",
      color : local.colors.problem,
      description : "Don't merge: the issue or pull request is not ready to be merged."
    },
    {
      name : "status/in-progress",
      color : local.colors.pending,
      description : "In progress: the issue or pull request is in progress."
    },
    {
      name : "status/in-review",
      color : local.colors.pending,
      description : "In review: the issue or pull request is in review."
    },
    {
      name : "status/need-review",
      color : local.colors.pending,
      description : "Need review: the issue or pull request needs review."
    },
    {
      name : "status/ready-to-merge",
      color : local.colors.addition,
      description : "Ready to merge: the issue or pull request is ready to be merged."
    },
    {
      name : "status/confirmed",
      color : local.colors.ending,
      description : "Confirmed: the issue or pull request is confirmed."
    },
    {
      name : "status/fixed",
      color : local.colors.ending,
      description : "Fixed: the issue or pull request is fixed."
    },
    {
      name : "status/implemented",
      color : local.colors.ending,
      description : "Implemented: the issue or pull request is implemented."
    },
    {
      name : "status/merge-conflicts",
      color : local.colors.problem,
      description : "Merge conflicts: the issue or pull request has merge conflicts."
    },
    {
      name : "time/5m",
      color : "f7c6c7",
      description : "5 minutes: the issue or pull request was estimate for 5 minutes."
    },
    {
      name : "time/25m",
      color : "f7c6c7",
      description : "25 minutes: the issue or pull request was estimate for 25 minutes."
    },
    {
      name : "time/1h",
      color : "fadcdd",
      description : "1 hour: the issue or pull request was estimate for 1 hours."
    },
    {
      name : "time/2h",
      color : "f9d7d7",
      description : "2 hours: the issue or pull request was estimate for 2 hours."
    },
    {
      name : "time/4h",
      color : "f8d1d2",
      description : "4 hours: the issue or pull request was estimate for 4 hours."
    },
    {
      name : "time/1d",
      color : "fadcdd",
      description : "1 day: the issue or pull request was estimate for 1 days."
    },
    {
      name: "shipped",
      color: local.colors.ending,
      description : "The issue or pull request has been shipped."
    }
  ]
  repos = data.terraform_remote_state.repos.outputs.repos
  repo_labels = {
    for o in flatten([
      for repo in local.repos :
      [
        for label in local.labels :
        {
          # repo is of form org/repo_name, we require just repo_name
          repo : split("/", repo)[1],
          name : label.name,
          color : label.color,
          description : label.description
        }
      ]
    ]) :
    "${o.repo}/${o.name}" => o
  }
}

resource "github_issue_label" "repo" {
  for_each    = local.repo_labels
  repository  = each.value.repo
  name        = each.value.name
  color       = each.value.color
  description = each.value.description
}
