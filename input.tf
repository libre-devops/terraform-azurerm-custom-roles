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

variable "role_assignments" {
  type = list(object({
    role_assignment_name = string
  }))
  description = "The list object of role assignments to be created"
  default     = null
}

variable "role_definition_settings" {
  type = map(object({
    permissions = object({
      actions          = list(string)
      not_actions      = list(string)
      data_actions     = list(string)
      not_data_actions = list(string)
    })
  }))

  description = "The settings object for role definition settings"
  default     = null
}

variable "role_definitions" {
  type = list(object({
    name        = string
    description = string
    scope       = list(string)
    permissions = object({
      actions          = optional(list(string))
      not_actions      = optional(list(string))
      data_actions     = optional(list(string))
      not_data_actions = optional(list(string))
    })

  }))
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
