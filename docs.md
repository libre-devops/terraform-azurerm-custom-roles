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
| [azurerm_role_definition.roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_role"></a> [assign\_role](#input\_assign\_role) | Whether or not a role should be assigned to a scope | `bool` | `true` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether a role definition should be created | `bool` | `false` | no |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | The list object of role assignments to be created | <pre>list(object({<br>    role_assignment_name = string<br>  }))</pre> | `null` | no |
| <a name="input_role_definition_settings"></a> [role\_definition\_settings](#input\_role\_definition\_settings) | The settings object for role definition settings | <pre>map(object({<br>    permissions = object({<br>      actions          = list(string)<br>      not_actions      = list(string)<br>      data_actions     = list(string)<br>      not_data_actions = list(string)<br>    })<br>  }))</pre> | `null` | no |
| <a name="input_role_definitions"></a> [role\_definitions](#input\_role\_definitions) | n/a | <pre>list(object({<br>    name        = string<br>    description = string<br>    scope       = list(string)<br>    permissions = object({<br>      actions          = optional(list(string))<br>      not_actions      = optional(list(string))<br>      data_actions     = optional(list(string))<br>      not_data_actions = optional(list(string))<br>    })<br><br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |

## Outputs

No outputs.
