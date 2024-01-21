# Creates Security Group For Public ALB

resource "aws_security_group" "allows_public-alb" {
    count       = var.INTERNAL ? 0 : 1
    name        = "roboshop-${var.ENV}-public-alb-security-group"
    description = "roboshop-${var.ENV}-public-alb-security-group"
    vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID 

    ingress {
        description = "roboshop-${var.ENV}-public-alb-security-group"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "roboshop-${var.ENV}-public-alb-security-group"
    }
}

# Creates Security Group For Private ALB

resource "aws_security_group" "allows_private-alb" {
    count       = var.INTERNAL ? 1 : 0
    name        = "roboshop-${var.ENV}-private-alb-security-group"
    description = "roboshop-${var.ENV}-private-alb-security-group"
    vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID 

    ingress {
        description = "roboshop-${var.ENV}-private-alb-security-group"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR, data.terraform_remote_state.vpc.outputs.VPC_CIDR]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "roboshop-${var.ENV}-private-alb-security-group"
    }
}