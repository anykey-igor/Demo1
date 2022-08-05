resource "aws_instance" "prod" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  vpc_security_group_ids = [aws_security_group.prod_sg.id]
  key_name               = "jenkins_master"
  user_data              = file("${var.ud_prod}")
  tags = {
    Name          = "PROD server"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
    Createdby     = "${var.createdby}"
  }
}