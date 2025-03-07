variable "repository_name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "The description of the repository"
}

variable "homepage_url" {
  type        = string
  description = "The homepage URL of the repository"
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository"

  validation {
    condition     = contains(["private", "public", "internal"], var.visibility)
    error_message = "Visibility must be either private, public, or internal."
  }
}

variable "features" {
  type = list(object({
    discussions = bool
    projects    = bool
    wiki        = bool
  }))
  default = [{
    discussions = false
    projects    = false
    wiki        = false
  }]
}

variable "merge_options" {
  type = list(object({
    merge_commit = bool
    rebase_merge = bool
    squash_merge = bool
    auto_merge   = bool
  }))
  default = [{
    merge_commit = false
    rebase_merge = false
    squash_merge = true
    auto_merge   = false
  }]

}

variable "pages" {
  type = list(object({
    build_type = string
    cname      = string
    branch     = string
    path       = string
  }))

  validation {
    condition     = length(var.pages) <= 1
    error_message = "Only one page is allowed."
  }
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
  default     = "unlicense"

  validation {
    condition     = contains(["mit", "apache-2.0", "gpl-3.0", "unlicense"], var.license_template)
    error_message = "License must be a valid GitHub license template."
  }
}

variable "is_archived" {
  type        = bool
  description = "The archived status of the repository"
  default     = false
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
