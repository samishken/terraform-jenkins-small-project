terraform {
 backend "s3" {
   bucket = "terraform-state-kebele27sh"
   key    = "terraform.tfstate"
   region = "us-east-1"
 }
}