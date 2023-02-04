output "teams" {
  value = {
    for team, teams in github_team.team :
    team => ({
      id      = teams.id
      node_id = teams.node_id,
    })
  }
  description = "Created teams id"
}

output "teams_id" {
  value       = [for team in github_team.team : team.id]
  description = "Created teams id"
}

output "teams_node_id" {
  value       = [for team in github_team.team : team.node_id]
  description = "Created teams node id"
}

output "teams_slug" {
  value       = [for team in github_team.team : team.slug]
  description = "Created teams slug"
}
