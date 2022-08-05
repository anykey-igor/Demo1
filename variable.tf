#-------------------------------------
# Global Variable
#-------------------------------------
variable "orchestration" {
  description = "Type of Orchestration"
  default     = "Terraform"
}
variable "createdby" {
  description = "Created by"
  default     = "Anikeiev Ihor"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "Demo project"
}
variable "environment" {
  description = "Environment for service"
  default     = "TEST"
}

#-------------------------------------
# Instance Variable
#-------------------------------------
variable "ami_instance" {
  description = "AMI -id"
  default     = "ami-0c9354388bb36c088"
}
variable "type_instance" {
  description = "Type of instance"
  default     = "t2.micro"
}

#-------------------------------------
# User data link
#-------------------------------------
variable "ud_prod" {
  description = "Preconfig script for Prod Server"
  default     = "./script/prod_pre.sh"
}
variable "ud_worker" {
  description = "Preconfig script for Jenkins Worker Node"
  default     = "./script/worker_pre.sh"
}
variable "ud_jmaster" {
  description = "Preconfig script for Jenkins Master"
  default     = "./tfpl/master_prep.tpl"
}

#-------------------------------------
# Route53 Variable
#-------------------------------------
variable "r53_zone" {
  default = "Z0024400C15GKK3Q8HT2"
}
variable "r53_zone_ttl" {
  default = "5"
}
variable "r53_zone_type" {
  default = "A"
}
variable "r53_zone_name_prod" {
  default = ""
}
variable "r53_zone_name_jmaster" {
  default = "jenkins"
}
#-------------------------------------
# Security Group Variable
#-------------------------------------
variable "jmaster_allow_ports" {
  type = list(string)
  default = ["50000", "8080", "22", "80"]
}
variable "worker_allow_ports" {
  type = list(string)
  default = ["50000", "22"]
}
variable "prod_allow_ports" {
  type = list(string)
  default = ["22", "80"]
}
#
#
#
variable "j_login" {
  type = string
}
variable "j_pass" {
  type = string
}
variable "dh_login" {
  type = string
}
variable "dh_token" {
  type = string
}
variable "dh_repo" {
  type = string
}
variable "jw_user" {
  type = string
}
variable "prod_key" {}
variable "git_key" {}

variable "jw_key" {
  type = string
}
variable "gh_token" {
  type = string
}
variable "gh_repo_app" {
  type = string
}
variable "gh_repo_pipe" {
  type = string
}