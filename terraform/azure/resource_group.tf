resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "7128f693-816a-4c05-aeea-d28df588530c"
  }
}