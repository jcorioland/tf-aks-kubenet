variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}


variable "agent_count" {
    default = 1
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "aksjco2"
}

variable cluster_name {
    default = "aksjco2"
}

variable resource_group_name {
    default = "aksjco2-rg"
}

variable location {
    default = "westeurope"
}

variable network_plugin {
    default = "kubenet"
}