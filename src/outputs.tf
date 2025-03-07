output "repository_urls" {
  description = "URLs of all managed repositories"
  value = {
    for name, repo in module.repository : name => {
      html_url  = "https://github.com/${var.github_owner}/${name}"
      ssh_url   = "git@github.com:${var.github_owner}/${name}.git"
      clone_url = "https://github.com/${var.github_owner}/${name}.git"
    }
  }
}
