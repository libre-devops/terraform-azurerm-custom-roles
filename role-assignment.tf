resource "azurerm_role_assignment" "role_assignment_custom_role" {
  for_each                               = var.assign_role == true && var.create_role == true ? { for idx, value in var.roles : value.role_assignment_name => merge(value, { index = idx }) } : {}
  scope                                  = each.value.role_assignment_scope
  role_definition_id                     = azurerm_role_definition.role_definitions[each.value.role_definition_name].role_definition_resource_id
  principal_id                           = try(each.value.role_assignment_assignee_principal_id, null)
  condition                              = try(each.value.role_assignment_condition, null)
  condition_version                      = try(each.value.role_assignment_condition_version, 2.0)
  delegated_managed_identity_resource_id = try(each.value.role_assignment_delegated_managed_identity_resource_id, null)
  description                            = try(each.value.role_assignment_description, null)
  skip_service_principal_aad_check       = try(each.value.role_assignment_skip_service_principal_aad_check, null)
}

resource "azurerm_role_assignment" "role_assignment_inbuilt_role" {
  for_each                               = var.assign_role == true && var.create_role == false ? { for idx, value in var.roles : value.role_assignment_name => merge(value, { index = idx }) } : {}
  scope                                  = each.value.role_assignment_scope
  role_definition_id                     = try(each.value.role_definition_id, null)
  principal_id                           = try(each.value.role_assignment_assignee_principal_id, null)
  condition                              = try(each.value.role_assignment_condition, null)
  condition_version                      = try(each.value.role_assignment_condition_version, 2.0)
  delegated_managed_identity_resource_id = try(each.value.role_assignment_delegated_managed_identity_resource_id, null)
  description                            = try(each.value.role_assignment_description, null)
  skip_service_principal_aad_check       = try(each.value.role_assignment_skip_service_principal_aad_check, null)
}