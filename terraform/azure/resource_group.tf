resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "9039d6cb-5ba9-4ddd-9973-6799bd1e14a9"
  }
}