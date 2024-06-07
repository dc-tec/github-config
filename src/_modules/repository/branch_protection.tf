resource "github_branch_protection" "main" {
  repository_id = github_repository.main.id

  pattern                 = "main"
  enforce_admins          = true
  allows_deletions        = false
  required_linear_history = true
}
