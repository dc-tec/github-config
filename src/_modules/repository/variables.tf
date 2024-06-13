variable "repository_name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "The description of the repository"
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository"
}

variable "features" {
  type = list(object({
    discussions = bool
    projects    = bool
    wiki        = bool
  }))
}

variable "merge_options" {
  type = list(object({
    merge_commit = bool
    rebase_merge = bool
    squash_merge = bool
    auto_merge   = bool
  }))
}

variable "topics" {
  type        = list(string)
  description = "The topics of the repository"
  default     = []
}

variable "gitignore_template" {
  type        = string
  description = "The gitignore template of the repository"
}

variable "license_template" {
  type        = string
  description = "The license template of the repository"
}

variable "is_archived" {
  type        = bool
  description = "The archived status of the repository"
}

variable "actions" {
  type = list(object({
    secrets = list(object({
      name                  = string
      key_vault_secret_name = string
    }))
    variables = list(object({
      name  = string
      value = string
    }))
  }))

  validation {
    condition     = alltrue([for action in var.actions : can(regex("^GITHUB_", action.secrets[0].name)) == false])
    error_message = "The secret name cannot start with 'GITHUB_'."
  }
}

variable "required_approving_review_count" {
  type        = number
  description = "The required approving review count of the repository"
  default     = 0
}
