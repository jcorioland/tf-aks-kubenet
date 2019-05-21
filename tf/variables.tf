variable "client_id" {}
variable "client_secret" {}


variable "agent_count" {
    default = 1
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "tf-aksjco"
}

variable cluster_name {
    default = "tf-aksjco"
}

variable resource_group_name {
    default = "tf-aksjco-rg"
}

variable location {
    default = "westeurope"
}

variable network_plugin {
    default = "kubenet"
}

variable kubernetes_version {
    default = "1.12.6"
}