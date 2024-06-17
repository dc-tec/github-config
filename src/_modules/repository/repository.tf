resource "github_repository" "main" {
  name         = var.repository_name
  description  = var.description
  topics       = var.topics
  homepage_url = var.homepage_url != null ? var.homepage_url : null

  visibility = var.visibility

  has_issues      = true
  has_discussions = var.features[0].discussions
  has_projects    = var.features[0].projects
  has_wiki        = var.features[0].wiki

  allow_merge_commit = var.merge_options[0].merge_commit
  allow_rebase_merge = var.merge_options[0].rebase_merge
  allow_squash_merge = var.merge_options[0].squash_merge
  allow_auto_merge   = var.merge_options[0].auto_merge

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true

  gitignore_template = var.gitignore_template
  license_template   = var.license_template

  archived           = var.is_archived
  archive_on_destroy = true

  dynamic "pages" {
    for_each = { for page in var.pages : page.cname => page }

    content {
      build_type = pages.value.build_type
      cname      = pages.value.cname

      source {
        branch = pages.value.branch
        path   = pages.value.path
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
