resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    =  var.INTERNAL == true ? aws_security_group.allows_private-alb.*.id :aws_security_group.allows_public-alb.*.id
  subnets            =  var.INTERNAL ? data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS : data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNET_IDS

  enable_deletion_protection = false

  tags ={
    Name =var.ALB_NAME
  }

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }
}

