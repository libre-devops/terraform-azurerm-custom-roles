```hcl
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
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.role_assignment_custom_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.role_assignment_inbuilt_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_definition.role_definitions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_role"></a> [assign\_role](#input\_assign\_role) | Whether or not a role should be assigned to a scope | `bool` | `true` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether a role definition should be created | `bool` | `false` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | The object needed to create and assign custom roles | <pre>list(object({<br>    role_assignment_name                                   = optional(string)<br>    role_assignment_scope                                  = optional(string)<br>    role_assignment_assignee_principal_id                  = optional(string)<br>    role_assignment_description                            = optional(string)<br>    role_assignment_condition                              = optional(string)<br>    role_assignment_condition_version                      = optional(number)<br>    role_assignment_delegated_managed_identity_resource_id = optional(string)<br><br>    role_definition_id                = optional(string)<br>    role_definition_name              = optional(string)<br>    role_definition_description       = optional(string)<br>    role_definition_scope             = optional(string)<br>    role_definition_assignable_scopes = optional(list(string), [])<br>    role_definition_permissions = optional(list(object({<br>      actions          = optional(list(string), [])<br>      not_actions      = optional(list(string), [])<br>      data_actions     = optional(list(string), [])<br>      not_data_actions = optional(list(string), [])<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |

## Outputs

No outputs.
