terraform {
  backend "s3" {
    bucket       = "simple-time-service-infra-test"
    use_lockfile = true
    key          = "demo-app/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
  }
}
