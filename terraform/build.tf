module "roles" {
  source = "../../terraform-azurerm-custom-roles"


  role_definitions = [
    {
      name        = "craig-test"
      description = "This is a description"
      scope       = "/subscriptions/09d383ee-8ed0-4374-ad9f-3344cabc323b"
      permissions = {
        actions = [
          "Microsoft.Authorization/*/read",
        ]
      }
    }
  ]
}
