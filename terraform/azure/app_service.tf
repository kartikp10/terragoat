resource azurerm_app_service_plan "example" {
  name                = "terragoat-app-service-plan-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Dynamic"
    size = "S1"
  }
  tags = {
    yor_trace = "fe0a5245-07f2-4cee-829c-e29b6e87ede4"
  }
}

resource azurerm_app_service "app-service1" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = false
  site_config {
    min_tls_version = "1.1"
  }
  tags = {
    yor_trace = "79a06bf1-6bb0-4a71-9257-d9603fc5d8d4"
  }
}

resource azurerm_app_service "app-service2" {
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = var.location
  name                = "terragoat-app-service-${var.environment}${random_integer.rnd_int.result}"
  resource_group_name = azurerm_resource_group.example.name
  https_only          = true

  auth_settings {
    enabled = false
  }
  tags = {
    yor_trace = "1547a5bf-00f0-4b5b-a55a-69d53a29d409"
  }
}

