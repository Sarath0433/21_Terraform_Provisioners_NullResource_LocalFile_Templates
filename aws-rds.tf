resource "aws_db_subnet_group" "default" {
  name       = "devopsb29subnetgroup"
  subnet_ids = [aws_subnet.subnet1-public.id, aws_subnet.subnet2-public.id, aws_subnet.subnet3-public.id]

  tags = {
    Name = "DevOpsB29SubnetGroup"
  }
}


resource "aws_db_instance" "myrds1" {
  allocated_storage = 10
  #identifier = "myrds1" #Uncomment This Before Deploying.
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t2.medium"
  db_name              = "devopsb29instance1"
  db_subnet_group_name = aws_db_subnet_group.default.name
  # Manually Created secrets from AWS Secrets Manager
  username = local.db_creds.username
  password = local.db_creds.password
  #final_snapshot_identifier = true
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  depends_on             = [aws_db_subnet_group.default]
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_db_instance" "myrds2" {
  allocated_storage = 10
  #identifier = "myrds2" #Uncomment This Before Deploying.
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t2.medium"
  db_name              = "devopsb29instance2"
  db_subnet_group_name = aws_db_subnet_group.default.name
  # Manually Created secrets from AWS Secrets Manager
  username = local.db_creds_2.username
  password = local.db_creds_2.password
  #final_snapshot_identifier = true
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  depends_on             = [aws_db_subnet_group.default]
  lifecycle {
    prevent_destroy = false
  }
}