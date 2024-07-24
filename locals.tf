locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

locals {
  db_creds_2 = jsondecode(
    aws_secretsmanager_secret_version.sversion.secret_string
  )
}