variable "location" {
  description = "resource grp location"
  type        = string
  default     = "eastus"
}

variable "vnet_count" {
  description = "number of vnets to create"
  type        = number
  default     = 3
}

variable "vnet_cidr" {
  description = "address space for virtual networks"
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}

variable "subnet_count" {
  description = "number of subnets to create in the first vnet"
  type        = number
  default     = 2
}

variable "subnet_address_prefixes" {
  description = "address prefixes for the subnets"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

