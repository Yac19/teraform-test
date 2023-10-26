terraform {
  backend "s3" {
    bucket = "nuumfactory-terraform-backend"
    key = "terraform.tfstate"
    region = "eu-west-3"
    profile = "nuumfactory-student"             
    #workspace_key_prefix = "04" 
  }
}