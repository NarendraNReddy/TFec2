# ami = "ami-090252cbe067a9e58"

variable "ami_id" {
    default = "ami-090252cbe067a9e58"
  
}

#vpc_security_group_ids = [aws_security_group.allow_ssh.id]

variable "vpc_security_group_ids" {
    type = list 
    default = ["sg-035bd444d13fbad2f"]
  
}

# instance_type = "t3.micro"

variable "instance_type" {
    default = "t3.micro"
  
}

# tags = {
#         Name = "db"
#     }
# }

variable "tags" {
  type = map 
  default = {} #not mandatory
}