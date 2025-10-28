output "vpc_id" {
    value = aws_vpc.serverless.id
  
}
output "public_subnets" {
    value = [for s in aws_subnet.public : s.id]
  
}