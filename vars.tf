variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "terraformskey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "terraformskey.pub"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.204.5"
}

variable "TERRAFORM_VERSION" {
  default = "0.13.4"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}

variable "DUMMY_SSH_PUB_KEY" {
  description = "public ssh key to put in place if there's no public key defined - to avoid errors in jenkins if it doesn't have a public key"
  default     = ""
}