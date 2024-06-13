resource "github_branch_protection" "main" {
  repository_id = github_repository.main.id

  pattern                 = "main"
  enforce_admins          = true
  allows_deletions        = false
  required_linear_history = true

  required_pull_request_reviews {
    required_approving_review_count = var.required_approving_review_count != null ? var.required_approving_review_count : 0
  }
}
