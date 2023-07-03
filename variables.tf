# AWS Regions / Zones

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "key_name" {
  default = "test"
  type    = string
}

# Private subnets

variable "subnet2_private" {
  description = "Create private  subnets for bizzabo"
  default     = ["10.0.100.0/24", "10.0.150.0/24"]
}

# Public  subnets

variable "subnet1_public" {
  description = "Create public  subnets for bizzabo"
  default     = ["10.0.1.0/24", "10.0.50.0/24"]
}

# Resource naming

variable "vpc_name" {
  description = "Name of bizzabo VPC"
  default     = "vpc_main"
}

variable "cidr_network" {
  default     = "10.0.0.0/16"
  description = "CIDR of the bizzabo VPC"

}
# Tags 
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}