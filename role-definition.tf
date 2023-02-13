resource "azurerm_role_definition" "role_definitions" {
  for_each    = var.create_role == true ? { for idx, value in var.roles : value.role_definition_name => merge(value, { index = idx }) } : {}
  name        = try(each.value.role_definition_name, null)
  description = try(each.value.role_definition_description, null)

  scope             = try(each.value.role_definition_scope, null)
  assignable_scopes = try(each.value.role_definition_assignable_scopes, null)

  dynamic "permissions" {
    for_each = lookup(each.value, "role_definition_permissions")
    content {
      actions          = tolist(permissions.value.actions)
      not_actions      = tolist(permissions.value.not_actions)
      data_actions     = tolist(permissions.value.data_actions)
      not_data_actions = tolist(permissions.value.not_data_actions)
    }
  }
}