terraform {
  backend "s3" {
    bucket         = "my-linked-tf-test-bucket33"
    key            = "dev/ecs-fargate-assignment.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
