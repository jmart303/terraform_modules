
resource "aws_dynamodb_table" "new_terraform_locks" {
  name         = "${var.namespace}_terraform-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}