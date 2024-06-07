data "azurerm_key_vault" "main" {
  name                = "kv-lab-infra-prd-westeu"
  resource_group_name = "rg-dct-prd-westeu"
}

data "azurerm_key_vault_secret" "main" {
  for_each = { for secret in var.actions[0].secrets : secret.name => secret }

  name         = each.value.key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "github_actions_secret" "main" {
  for_each = { for secret in var.actions[0].secrets : secret.name => secret }

  repository      = github_repository.main.name
  secret_name     = each.value.name
  plaintext_value = data.azurerm_key_vault_secret.main[each.key].value
}

resource "github_actions_variable" "main" {
  for_each = { for variable in var.actions[0].variables : variable.name => variable }

  repository    = github_repository.main.name
  variable_name = each.value.name
  value         = each.value.value
}
