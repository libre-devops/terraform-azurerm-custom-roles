resource "azurerm_role_definition" "roles" {
  for_each    = var.create_role == true ? { for idx, value in var.role_definitions : value.role_definition_name => merge(value, { index = idx }) } : null
  name        = try(each.value.name, null)
  description = try(each.value.description, null)

  scope             = try(each.value.scope, null)
  assignable_scopes = try(each.value.assignable_scopes, null)

  dynamic "permissions" {
    for_each = try(each.value.permissions)
    content {
      actions          = lookup(tolist(permissions.value, "actions"), null)
      not_actions      = lookup(tolist(permissions.value, "not_actions"), null)
      data_actions     = lookup(tolist(permissions.value, "data_actions"), null)
      not_data_actions = lookup(tolist(permissions.value, "not_data_actions"), null)
    }
  }
}