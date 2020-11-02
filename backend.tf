terraform {
 backend "s3" {
   bucket = "terraform-state-XXXXXXX"
   key    = "terraform.tfstate"
   region = "us-east-1"
 }
}
