variable "resource_group_location" {
  default       = "eastus"
  description   = "Location del RG"
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD/ZSHid9IbDiAJmGsNCdib4mP0KpkjVX6pJgwFp1F4V2gHL+i74xlpkcV9L5illtuBlbVSxh26jTdTPR51i2WWMHMy6Qk62V8R6cSNjhlV/RyZMSvzdI83D3Yx4tLlgJTQaTi7qSazhncfLmsrMz6VF08TMILvrR4PUIdfQ8MRYcjXuEhyDVGOfHwKfxBczxjFUhI31en1g1h60RHK9Ewb0lCjIa6o+TidwI4utphrMeNC4595cn/jPvGkJUCErIc9CEX7y7WkMRp7Ln9RgeUGQZd04C1/vnwX81bWZvaoEXVSyWQyifo1gySx/YgGYDjc6nqmWDs6Ml7wyzYV4dRyqC8SKAvkv5CNaarAzPW0qKgZvoFve5WPWe0dm+4tDp3i722VDfTHFsG8gM4Ct9+93uiph/3C75U81XzeOd814qEC+U38B1p0E/1+KHRlqKgh8fvSGgbmDthTjgqplO7QfGtnHpxt4wdvEo/4DtaBDBlpfiwz2nwPwOiQ1IZiE4k= generated-by-azure"
}

variable "dns_prefix" {
    default = "hca-sample"
}

variable cluster_name {
    default = "k8s-cluster"
}

variable resource_group_name {
    default = "rg-k8s-sample"
}

variable locationk8s {
    default = "eastus"
}

variable aks_service_principal_app_id {
    default= "59e923ac-f661-4daf-81c7-22b5055f1b8d"
}

variable aks_service_principal_client_secret{
    default = "Qsu8Q~JLHjtgjRUhMQAidr91emZkgUQBxOUqgb8j"
}

variable aks_service_principal_object_id {
    default= "f9bf9665-1071-4f5e-acce-b8ea59e025db"
}

variable "subnet_name" {
  default = "subnet-k8s"
}

variable "virtual_network_name" {
  default = "vnet-k8s"
}