output "repos" {
  value       = [for repo in module.repos : repo.repo_full_name]
  description = "Created repo names"
}

output "repo_names" {
  value       = [for repo in module.repos : trimprefix(repo.repo_full_name, "Bytefloat/")]
  description = "Created repo names without org name"
}
