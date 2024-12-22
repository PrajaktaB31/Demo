


resource "azuread_user" "User-p" {
  user_principal_name = "User-p@praju2bgmail.com.onmicrosoft.com"
  display_name        = "User-p"
  password            = "Azure@123"
}

resource "azurerm_role_assignment" "User-p1-role" {
  scope                 = azurerm_resource_group.rg.id
  role_definition_name  = "Reader"
  principal_id          = azuread_user.User-p.object_id
}

