variable "vnet_address_space" {
  description = "address space for virtual network"
  type        = list(string)
  default     = ["192.168.0.0/16"]
}

variable "location" {
  description = "Azure region for resource"
  type        = string
  default     = "eastus"
}

variable "web_subnet_cidr" {
  description = "cidr block for web subnet"
  type        = string
  default     = "10.1.0.0/24"
}

variable "app_subnet_cidr" {
  description = "cidr block for app subnet"
  type        = string
  default     = "10.0.2.0/24"
}
