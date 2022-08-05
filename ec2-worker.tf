resource "aws_instance" "worker" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  vpc_security_group_ids = [aws_security_group.worker_sg.id]
  user_data              = file("${var.ud_worker}")
  key_name               = "jenkins_master"

  tags = {
    Name          = "Jenkins Worker Node - ${var.environment}"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
    Createdby     = "${var.createdby}"
  }
}


