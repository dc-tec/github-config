locals {
  repositories = {
    for repo in yamldecode(file("${path.module}/_configuration/repositories.yaml")).repositories : repo.name => repo...
  }
}
