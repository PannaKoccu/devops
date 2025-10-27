terraform {
  backend "s3" {
    bucket         = "pofiknanvsem"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}