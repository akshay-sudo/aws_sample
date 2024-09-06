provider "aws" {
   // Specify the AWS profile to be used for authentication
   #profile    = "default"
   // Specify the AWS region where the resources will be created
  #region     = "eu-west-3"
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  
}