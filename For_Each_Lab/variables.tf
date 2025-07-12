variable "location" {
  description = "rgp location"
  type        = string
  default     = "eastus"
}

variable "vnet_config" {
  description = "map of vnets"
  type        = map(string)
  default = {
    "prod"    = "10.0.0.0/16"
    "staging" = "10.1.0.0/16"
    "dev"     = "10.2.0.0/16"
  }
}

variable "subnet_config" {
  description = "map of subnet"
  type        = map(string)
  default = {
    "web"  = "10.0.1.0/24"
    "app"  = "10.0.2.0/24"
    "data" = "10.0.3.0/24"
  }
}