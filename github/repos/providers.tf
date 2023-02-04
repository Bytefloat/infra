provider "github" {
  owner = var.organization
}

module "repos" {
  source = "StarUbiquitous/github-repos/module"
  for_each = {
    for repo in local.repos : repo.name => {
      description : repo.description,
      visibility : can(repo.visibility) ? repo.visibility : "public",
      # by default use templated repos,if not set to false
      templated : can(repo.templated) ? repo.templated : false
      # create secrets if set
      secrets : can(repo.secrets) ? repo.secrets : {}
      # create status_checks if set
      status_checks : can(repo.status_checks) ? repo.status_checks : []
      # set dependabot alerts, default to true
      vulnerability_alerts : can(repo.vulnerability_alerts) ? repo.vulnerability_alerts : true
      # require codeowner reviews, default to true
      require_code_owner_reviews : can(repo.require_code_owner_reviews) ? repo.require_code_owner_reviews : true
      # enfore admins
      enforce_admins : can(repo.enforce_admins) ? repo.enforce_admins : false
      # auto delete branch after merging PR
      delete_branch_on_merge : can(repo.delete_branch_on_merge) ? repo.delete_branch_on_merge : true
      # topics
      topics : can(repo.topics) ? repo.topics : null
      # has_downloads
      has_downloads : can(repo.has_downloads) ? repo.has_downloads : false
      # allows_deletions
      allows_deletions : can(repo.allows_deletions) ? repo.allows_deletions : false
      # allows_force_pushes
      allows_force_pushes : can(repo.allows_force_pushes) ? repo.allows_force_pushes : true
      # push_restrictions
      push_restrictions : can(repo.push_restrictions) ? repo.push_restrictions : [data.terraform_remote_state.teams.outputs.teams.ci.node_id]
    }
  }
  gh_org                     = var.organization
  repo_name                  = each.key
  description                = each.value.description
  visibility                 = each.value.visibility
  secrets                    = each.value.secrets
  status_checks              = each.value.status_checks
  vulnerability_alerts       = each.value.vulnerability_alerts
  require_code_owner_reviews = each.value.require_code_owner_reviews
  enforce_admins             = each.value.enforce_admins
  delete_branch_on_merge     = each.value.delete_branch_on_merge
  topics                     = each.value.topics
  has_downloads              = each.value.has_downloads
  push_restrictions          = each.value.push_restrictions
  allows_deletions           = each.value.allows_deletions
  allows_force_pushes        = each.value.allows_force_pushes

  template_repo_name = each.value.templated ? "startup" : ""
}
