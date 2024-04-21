variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "quyetnn-project1"
}

variable "project_name"{
  description = "The project_name should be used for all resources in this example"
  default = "Project1-IaC"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "South Central US" 
}

variable "username"{
  default = "quyetnn"
}

variable "password"{
  default= "Fpt@123"
}

variable "server_names"{
  type = list
  default = ["uat","int"]
}

variable "packerImageId"{
  default = "/subscriptions/df56a173-611b-429d-901a-af369d7d59b5/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/MyPackerImage"
}

variable "vm_count"{
  default = "2"
}
