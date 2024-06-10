# Copyright (c) 2021 Cisco and/or its affiliates.

# This software is licensed to you under the terms of the Cisco Sample
# Code License, Version 1.1 (the "License"). You may obtain a copy of the
# License at

#                https://developer.cisco.com/docs/licenses

# All use of the material herein must be in accordance with the terms of
# the License. All rights not expressly granted by the License are
# reserved. Unless required by applicable law or agreed to separately in
# writing, software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied.

# Declare required provider

provider "meraki" {
  # Configuration options
}

provider "iosxe" {
  username = var.device_username
  password = var.device_password
  devices  = local.devices_list
}

locals {
  catalyst_switches = { for d in data.meraki_devices.catalyst_switches.items : d.name => {
    name = d.name
    url  = "https://${d.lan_ip}"
  }}

  devices_list = values(local.catalyst_switches)

  access_switches = { for d in data.meraki_devices.access_switches.items : d.name => {
    name = d.name
    url  = "https://${d.lan_ip}"
  }}
}

# Data source declaration for Meraki devices

data "meraki_devices" "catalyst_switches" {
  organization_id = var.organization_id
  tags            = ["catalyst-switch"]
}

data "meraki_devices" "access_switches" {
  organization_id = var.organization_id
  tags            = ["access-switch"]
}

# Output to display the devices
output "devices" {
  value = local.access_switches
}

module "iosxe_vlans" {
  source      = "../modules/vlans"

  for_each    = local.access_switches
  device      = each.value
  vlans       = var.vlans
  shutdown    = false
}

module "ios_switchports" {
  source      = "../modules/switchports"

  for_each    = local.access_switches
  device      = each.value
  type        = "GigabitEthernet"
  switchports = var.switchports
  mode_access = true
}