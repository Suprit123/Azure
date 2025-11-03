# Hub Config
variable "location" {
  description = "Location for the resoruces"
  type        = string
  default     = "East US"
}

variable "Hub_VNet_Space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "Hub_Subnets" {
  description = "Subnets that will be created for Hub Vnet"
  type        = map(string)
  default = {
    "DB"  = "10.0.11.0/24"
    "APP" = "10.0.12.0/24"
    "WEB" = "10.0.13.0/24"
  }
}

variable "VNGW_Bool" {
  description = "Boolean values for active_active and bgp enable"
  type        = bool
  default     = false
}

# Spoke 1 Config

variable "Spoke1_VNet_Space" {
  description = "Vnet address space for spoke1"
  type        = string
  default     = "10.0.1.0/16"
}

variable "Spoke1_Subnet" {
  description = "Subnet for Spoke1"
  type        = string
  default     = "10.0.1.0/24"
}


# Spoke 2 Config

variable "Spoke2_VNet_Space" {
  description = "Vnet address space for spoke2"
  type        = string
  default     = "10.0.2.0/16"
}

variable "Spoke2_Subnet" {
  description = "Subnet for Spoke2"
  type        = string
  default     = "10.0.2.0/24"
}
