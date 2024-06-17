<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.8.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.106.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.106.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.main](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/actions_secret) | resource |
| [github_actions_variable.main](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/actions_variable) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/branch_protection) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/repository) | resource |
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions"></a> [actions](#input\_actions) | n/a | <pre>list(object({<br>    secrets = list(object({<br>      name                  = string<br>      key_vault_secret_name = string<br>    }))<br>    variables = list(object({<br>      name  = string<br>      value = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the repository | `string` | n/a | yes |
| <a name="input_features"></a> [features](#input\_features) | n/a | <pre>list(object({<br>    discussions = bool<br>    projects    = bool<br>    wiki        = bool<br>  }))</pre> | <pre>[<br>  {<br>    "discussions": false,<br>    "projects": false,<br>    "wiki": false<br>  }<br>]</pre> | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | The gitignore template of the repository | `string` | n/a | yes |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | The homepage URL of the repository | `string` | n/a | yes |
| <a name="input_is_archived"></a> [is\_archived](#input\_is\_archived) | The archived status of the repository | `bool` | `false` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | The license template of the repository | `string` | `"unlicense"` | no |
| <a name="input_merge_options"></a> [merge\_options](#input\_merge\_options) | n/a | <pre>list(object({<br>    merge_commit = bool<br>    rebase_merge = bool<br>    squash_merge = bool<br>    auto_merge   = bool<br>  }))</pre> | <pre>[<br>  {<br>    "auto_merge": false,<br>    "merge_commit": false,<br>    "rebase_merge": false,<br>    "squash_merge": true<br>  }<br>]</pre> | no |
| <a name="input_pages"></a> [pages](#input\_pages) | n/a | <pre>list(object({<br>    build_type = string<br>    cname      = string<br>    branch     = string<br>    path       = string<br>  }))</pre> | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | The required approving review count of the repository | `number` | `0` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The topics of the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the repository | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->