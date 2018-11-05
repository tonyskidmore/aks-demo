variable "resource_group_name" {
  description = "The name of the resource group"
  default = "terraform"
}

variable "rg_prefix" {
  description = "The shortened abbreviation to represent your resource group that will go on the front of some resources."
  default     = "rg"
}

variable "nsg_source_address_prefix" {
  description = "CIDR source prefix for network security group."
  default     = "*"  
}

variable "lb_ssh_frontend_port" {
  description = "Front end port for redirection to SSH."
  default     = "80"  
}

variable "lb_https_frontend_port" {
  description = "Front end port for redirection to SSH."
  default     = "443"  
}

variable "location" {
  description = "The location/region where the resource group is created. Changing this forces a new resource to be created."
  default = "uksouth"
}

variable "ssh_key_data" {
    description = "Public SSH key to be used for passwordless SSH access"
}

variable "hostname" {
  description = "VM name referenced also in storage-related names."
  default     = "jenkins"
}

variable "admin_username" {
  description = "Admin username"
  default     = "cloud_admin"
}
variable "admin_password" {
  description = "Admin password"
  default     = "Testing123"
}