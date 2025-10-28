terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucketproject9"
    key            = "dev/ecs-fargate-assignment.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
