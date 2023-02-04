locals {
  teams = [
    {
      name : "CI",
      description : "Continuous Integration",
      privacy : "secret",
    },
    {
      name : "Infra",
      description : "Team of Cloud and Platform Engineers",
    },
    {
      name : "Eng",
      description : "Team of Development Engineers",
    }
  ]
  each_teams = {
    for team in local.teams : replace(lower(team.name), " ", "-") => {
      name : team.name,
      description : team.description,
      privacy : can(team.privacy) ? team.privacy : "closed",
      parent_team_id : can(team.parent_team_id) ? team.parent_team_id : null,
      create_default_maintainer : can(team.create_default_maintainer) ? team.create_default_maintainer : false
    }
  }
}

resource "github_team" "team" {
  for_each                  = local.each_teams
  name                      = each.value.name
  description               = each.value.description
  privacy                   = each.value.privacy
  parent_team_id            = each.value.parent_team_id
  create_default_maintainer = each.value.create_default_maintainer
}

resource "github_team_repository" "eng_repos" {
  count      = length(data.terraform_remote_state.repos.outputs.repo_names)
  team_id    = github_team.team["eng"].slug
  repository = data.terraform_remote_state.repos.outputs.repo_names[count.index]
  permission = "push"
}

resource "github_team_repository" "ci_repos" {
  count      = length(data.terraform_remote_state.repos.outputs.repo_names)
  team_id    = github_team.team["ci"].slug
  repository = data.terraform_remote_state.repos.outputs.repo_names[count.index]
  permission = "admin"
}

