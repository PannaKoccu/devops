variable "region" {
    description = "us-east-1"
    type        = string
    default     = "us-east-1"
}

variable "public_key" {
  description = "SSH public key for EC2 access"
  type        = string
}