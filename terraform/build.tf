module "roles" {
  source = "registry.terraform.io/libre-devops/custom-roles/azurerm"

  create_role = true
  assign_role = true

  roles = [
    {
      role_definition_name        = "LibreDevOpsExample"
      role_definition_description = "An example role"
      role_definition_scope       = "/subscriptions/${data.azurerm_client_config.current_creds.subscription_id}"
      role_definition_permissions = [
        {
          actions = [
            "Microsoft.Authorization/*/read",
          ]
        }
      ]
      role_assignment_name                  = "LibreDevOpsCustomRole"
      role_assignment_description           = "This is an example description for role assignment"
      role_assignment_scope                 = "/subscriptions/${data.azurerm_client_config.current_creds.subscription_id}"
      role_assignment_assignee_principal_id = data.azurerm_user_assigned_identity.mgmt_user_assigned_id.principal_id

    }
  ]
}
