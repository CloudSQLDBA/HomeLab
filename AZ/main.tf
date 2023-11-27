resource "azurerm_resource_group" "rg" {
  name     = "labsqlrg"
  location = "eastus"
}

resource "azurerm_mssql_server" "server" {
  name                         = "labsqlsvr1-123456"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "labsqldb" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.server.id
}

resource "azurerm_mssql_firewall_rule" "fwr" {
  name                = "labfirewallrule1"
  server_id           = azurerm_mssql_server.server.id
  start_ip_address    = var.my_IP
  end_ip_address      = var.my_IP
}

resource "azurerm_resource_group" "rg2" {
  name     = "labsqlrg2"
  location = "eastus2"
}

resource "azurerm_mssql_server" "server2" {
  name                         = "labsqlsvr2-123456"
  resource_group_name          = azurerm_resource_group.rg2.name
  location                     = azurerm_resource_group.rg2.location
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_firewall_rule" "fwr2" {
  name                = "labfirewallrule2"
  server_id           = azurerm_mssql_server.server2.id
  start_ip_address    = var.my_IP
  end_ip_address      = var.my_IP
}

resource "azurerm_mssql_failover_group" "labsqlfg123456" {
  name      = "labsqlfg123456"
  server_id = azurerm_mssql_server.server.id
  databases = [
    azurerm_mssql_database.labsqldb.id
  ]

  partner_server {
    id = azurerm_mssql_server.server2.id
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 80
  }
}