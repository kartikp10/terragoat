resource "aws_rds_cluster" "app1-rds-cluster" {
  cluster_identifier      = "app1-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 0
  tags = {
    yor_trace = "f8f7b140-835d-4897-bf5c-cd3f454dcec9"
  }
}

resource "aws_rds_cluster" "app2-rds-cluster" {
  cluster_identifier      = "app2-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 1
  tags = {
    yor_trace = "23c3ffd9-229d-49ac-b496-9b4afecf4062"
  }
}

resource "aws_rds_cluster" "app3-rds-cluster" {
  cluster_identifier      = "app3-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 15
  tags = {
    yor_trace = "659bfca8-be71-4722-bd5a-a11bc02f17d2"
  }
}

resource "aws_rds_cluster" "app4-rds-cluster" {
  cluster_identifier      = "app4-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 15
  tags = {
    yor_trace = "585b62a2-47d1-4f68-a4d4-4847c1b77191"
  }
}

resource "aws_rds_cluster" "app5-rds-cluster" {
  cluster_identifier      = "app5-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 15
  tags = {
    yor_trace = "1ad4d722-e36f-45bd-b39e-53b07e1dfa7f"
  }
}

resource "aws_rds_cluster" "app6-rds-cluster" {
  cluster_identifier      = "app6-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 15
  tags = {
    yor_trace = "d95dd50a-9ad6-467c-96bb-26bdd004f07f"
  }
}

resource "aws_rds_cluster" "app7-rds-cluster" {
  cluster_identifier      = "app7-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 25
  tags = {
    yor_trace = "d83b0e06-a3fe-499f-a401-2352dbab7fa0"
  }
}

resource "aws_rds_cluster" "app8-rds-cluster" {
  cluster_identifier      = "app8-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 25
  tags = {
    yor_trace = "867d6fc2-76d9-48ed-9978-ad9396583e6c"
  }
}

resource "aws_rds_cluster" "app9-rds-cluster" {
  cluster_identifier      = "app9-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 25
  tags = {
    yor_trace = "5cb16563-865c-4d5d-93f1-2bd6ce783fcc"
  }
}
