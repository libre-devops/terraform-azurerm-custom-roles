variable "assign_role" {
  type        = bool
  description = "Whether or not a role should be assigned to a scope"
  default     = true
}

variable "create_role" {
  type        = bool
  description = "Whether a role definition should be created"
  default     = false
}

variable "roles" {
  type = list(object({
    role_assignment_name                                   = optional(string)
    role_assignment_scope                                  = optional(string)
    role_assignment_assignee_principal_id                  = optional(string)
    role_assignment_description                            = optional(string)
    role_assignment_condition                              = optional(string)
    role_assignment_condition_version                      = optional(number)
    role_assignment_delegated_managed_identity_resource_id = optional(string)

    role_definition_id                = optional(string)
    role_definition_name              = optional(string)
    role_definition_description       = optional(string)
    role_definition_scope             = optional(string)
    role_definition_assignable_scopes = optional(list(string), [])
    role_definition_permissions = optional(list(object({
      actions          = optional(list(string), [])
      not_actions      = optional(list(string), [])
      data_actions     = optional(list(string), [])
      not_data_actions = optional(list(string), [])
    })), [])
  }))
  description = "The object needed to create and assign custom roles"
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
