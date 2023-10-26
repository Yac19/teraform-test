###########--Declaring variables imported from the file "developpement.tfvars"--########

variable "vpc" {
  description = "L'ID de mon VPC pour terraform"
  type        = string
}

variable "environment" {
  description = "L'environnement de dev de nos VM"
  type        = string
}

variable "digit" {
  description = "Code personnel pour la création de mes VM"
  type        = string
}

variable "ami" {
  description = "Identifiant AMI pour mon instance à Paris"
  type        = string
}

variable "elb_subnets" {
  description = "Les IDs de mon subnet public 1 puis celle de mon subnet public 2"
  type        = list(string)
}

variable "ec2_subnet" {
  description = "L'ID de mon subnet public 1"
  type        = string
}

variable "ec2_type" {
  description = "type de ressource pour ma VM"
  type        = string
}