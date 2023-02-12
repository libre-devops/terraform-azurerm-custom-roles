resource "azurerm_role_definition" "roles" {
  for_each    = var.assign_role == true ? { for idx, value in var.role_assignments: value.role_assignment_name => merge(value { index = idx }) } : null
  name        = each.value.role_definition_name
  scope       = each.value.role_definition_scope
  description = try(each.value.description, null)

  permissions {
    actions     = tolist(each.value.role_definition_permissions)
    not_actions = []
  }
}