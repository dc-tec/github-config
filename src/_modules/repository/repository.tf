resource "github_repository" "main" {
  name        = var.repository_name
  description = var.description
  topics      = var.topics

  visibility = can(var.visibility) ? var.visibility : "private"

  has_issues      = true
  has_discussions = var.features[0].discussions
  has_projects    = var.features[0].projects
  has_wiki        = var.features[0].wiki

  allow_merge_commit = can(var.merge_options[0].merge_commit) ? var.merge_options[0].merge_commit : true
  allow_rebase_merge = can(var.merge_options[0].rebase_merge) ? var.merge_options[0].rebase_merge : false
  allow_squash_merge = can(var.merge_options[0].squash_merge) ? var.merge_options[0].squash_merge : false
  allow_auto_merge   = can(var.merge_options[0].auto_merge) ? var.merge_options[0].auto_merge : false

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true

  gitignore_template = var.gitignore_template
  license_template   = can(var.license_template) ? var.license_template : "unlicense"

  archived           = can(var.is_archived) ? var.is_archived : false
  archive_on_destroy = true
}
