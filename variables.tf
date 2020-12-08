variable "network_name" {   default="terraform-network-test" }

variable "instance_name" {  default="terradata-training-instance"  }

variable "machine_type_dev" {  default =     "n1-standard-1" }

variable "machine_type_prod" {  default =     "n1-standard-4" }

variable "vpc_network" {  default ="terraform-practice-vpc" }

variable "environment" { default = "dev" }

variable "image" { default = "debian-cloud/debian-9" }



variable "name_count" { default=["ce11"] }