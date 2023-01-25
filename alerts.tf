resource "azurerm_monitor_action_group" "ag1" {
  name                = "myactiongroup1"
  resource_group_name = var.resource_group_name
  short_name          = "ag1"

}

resource "azurerm_monitor_metric_alert" "alert1" {
  name                = "alert1"
  resource_group_name = var.resource_group_name
  scopes              = ["/subscriptions/cdc3c0fa-a22b-420a-ac28-6c56ec56eb7a/resourceGroups/rg/providers/Microsoft.Compute/virtualMachines/vm"]
  description         = "description"
  target_resource_type = "Microsoft.Compute/virtualMachines"
  
  criteria { 
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = var.threshold

  }

  action {
    action_group_id = azurerm_monitor_action_group.ag1.id
  }
}