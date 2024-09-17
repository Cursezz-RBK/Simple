resource "aws_iam_policy" "rds_full_access" {
  name        = var.iam_rds_policy
  description = "Full access to Amazon RDS"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "rds:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_full_access" {
  name        = var.iam_s3_policy
  description = "Full access to Amazon S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:*"
        Resource = "*"
      }
    ]
  })
}



resource "aws_iam_role" "ec2_role" {
  name               = var.iam_ec2_policy
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_rds_policy" {
  policy_arn = aws_iam_policy.rds_full_access.arn
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  policy_arn = aws_iam_policy.s3_full_access.arn
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.iam_ec2_profile
  role = aws_iam_role.ec2_role.name
}


