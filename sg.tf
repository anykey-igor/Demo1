#-------------------------------------
# Jenkins Master - security group
#-------------------------------------
resource "aws_security_group" "jenkins_sg" {
  dynamic "ingress" {
    for_each = var.jmaster_allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name          = "Jenkins Master SG"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
  Createdby = "${var.createdby}" }
}

#-------------------------------------
# Jenkins Worker Node - security group
#-------------------------------------
resource "aws_security_group" "worker_sg" {
  dynamic "ingress" {
    for_each = var.worker_allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name          = "Jenkins Worker Node SG"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
    Createdby     = "${var.createdby}"
  }
}

#-------------------------------------
# Prod server - security group
#-------------------------------------
resource "aws_security_group" "prod_sg" {
  dynamic "ingress" {
    for_each = var.prod_allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name          = "PROD SG"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
    Createdby     = "${var.createdby}"
  }
}