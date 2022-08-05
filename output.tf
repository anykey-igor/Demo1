output "jenkins_dns_public_ip" {
  description = "Jenkins host name"
  value       = aws_instance.jenkins.public_ip
}
output "jenkins_dns_name_asso" {
  description = "Jenkins host name"
  value       = aws_instance.jenkins.associate_public_ip_address
}
output "prod_public_ip" {
  value = aws_instance.prod.public_ip
}
output "worker_public_ip" {
  value = aws_instance.worker.public_ip
}
