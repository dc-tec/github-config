resource "github_repository" "main" {
  for_each = local.repositories

  name        = each.value.name
  description = each.value.description

  visibility = "public" ? each.value.public : "private"

}
