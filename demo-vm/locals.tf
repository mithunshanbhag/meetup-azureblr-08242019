#region network interface

locals {
  ip_configuration_name        = "ip-configuration"
  private_ip_allocation_method = "static"
}

#endregion network interface

#region managed disk

locals {
  storage_os_disk_storage_account_type = "StandardSSD_LRS" # case-sensitive
  storage_os_disk_create_option        = "fromimage"
  storage_os_disk_os_type              = "linux"
}

#endregion managed disk

#region platform image

locals {
  platform_image_publisher = "openlogic"
  platform_image_offer     = "centos"
  platform_image_sku       = "7.6"
  platform_image_version   = "7.6.20190402"
}

#endregion platform image
