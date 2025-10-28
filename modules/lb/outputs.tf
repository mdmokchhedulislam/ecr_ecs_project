output "aws_lb_target_group_arn" {
    value = aws_lb_target_group.this.arn
  
}

output "lb_listener_arn" {
  value = aws_lb_listener.http.arn
}