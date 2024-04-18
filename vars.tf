variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "azure-devops-project1"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "username" {
  description = "The VM users name."
  default = "fpt-quyetnn"
}

variable "password" {
  description = "The VM users password:"
  sensitive = true
}

variable "number_of_vms" {
  description = "The number of Virtual Machines to be deployed."
  type        = number
  default     = "2"
}

variable "packer_image" {
  description = "The ID of the image created by packer tool."
  default = "/subscriptions/e2c7cd99-c3c5-4a90-9109-02e7d50f8311/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/Ubuntu1804Image"
}

variable "subscription" {
  description = "The subscription for which the resources are going to be deployed."
  default = "/subscriptions/e2c7cd99-c3c5-4a90-9109-02e7d50f8311"
}