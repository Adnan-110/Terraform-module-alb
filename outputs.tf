output "ALB_ARN" {
  value = aws_lb.alb.arn
}

output "ALB_ADDRESS" {
  value = aws_lb.alb.dns_name
}

output "LISTENER_ARN" {
  value = aws_lb_listener.private.*.arn
}