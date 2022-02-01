resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "393cebcc-f89f-4cdb-9462-08ac5bdf130c"
  }
}