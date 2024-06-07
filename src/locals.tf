locals {
  repositories = yamldecode(file("${path.module}/_configuration/repositories.yaml")...)
}
