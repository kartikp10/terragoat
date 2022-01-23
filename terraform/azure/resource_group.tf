resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "3bd72807-01b0-4dff-91ea-86d506999c68"
  }
}