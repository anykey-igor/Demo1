data "template_file" "user_data_master" {
  #template = file(var.ud_jmaster)
  #vars = {
  template = templatefile(var.ud_jmaster, {
    J_LOGIN      = var.j_login,
    J_PASS       = var.j_pass,
    JW_USER      = var.jw_user,
    JW_KEY       = file(var.jw_key),
    PROD_KEY     = file(var.prod_key),
    GIT_KEY      = file(var.git_key)
    GH_TOKEN     = var.gh_token,
    GH_REPO_APP  = var.gh_repo_app,
    GH_REPO_PIPE = var.gh_repo_pipe,
    DH_LOGIN     = var.dh_login,
    DH_TOKEN     = var.dh_token,
    DH_REPO      = var.dh_repo,
    #JM_IP        = aws_instance.jenkins.public_ip
    JNODE_IP = aws_instance.worker.public_ip,
    PROD_IP  = aws_instance.prod.public_ip
  })
}

resource "aws_instance" "jenkins" {
  ami                    = var.ami_instance
  instance_type          = var.type_instance
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = data.template_file.user_data_master.rendered # element(data.template_file.user_data_master.*.rendered, count.index) #data.template_file.user_data_master.rendered
  key_name               = "jenkins_master"
  #user_data             = file(var.ud_jmaster)
  # user_data            = file("${var.ud_prod}")

  tags = {
    Name          = "Jenkins Master"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
    Createdby     = "${var.createdby}"
  }
}
