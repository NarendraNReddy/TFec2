# resource <resource-type> <resource-name>
resource "aws_instance" "db" {

    #ami = "ami-090252cbe067a9e58"
    ami=var.ami_id

    #vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    vpc_security_group_ids = var.vpc_security_group_ids
    
    #instance_type = "t3.micro"
    instance_type = var.instance_type

    # tags = {
    #     Name = "db"
    # }
    tags=var.tags
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    #terraform block
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "NNR"
    }
}