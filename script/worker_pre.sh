#!/bin/bash
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEyzi4T3W0skXsaGXRMnhd4eDJyYOKShNQRij7rJhVzM+N/RcsYtfPZaWByXx6byh7fNJrNQcR28Dua+jF3fkXTCyjpBA6yMsQEoe0cvCXes07v6fYDUO+qrhJKOEh21g5sutn++cc40Ys9PB+Fc6R7BpXIoZb/+U91jr94BwLcJNa/ihOHwDej0M1aGvYJrYUqx/8WOTWw1arnvj90m0KxQfHJRGEfWO8mUn6LELMp8o+TBhAMpVIOSFasQ3yIFlk4duV/jEvh9DFBxZr16aRyp3UBupKPzcpyAZjaHrnOUnlLbMtXrISjwvHmFA+iPxFsuiE9LSodZB6U6Dua4VJ' >> /home/ubuntu/.ssh/authorized_keys
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt -y update
sudo apt install -y openjdk-11-jdk
sudo apt  install -y docker.io
sudo chmod 660 /var/run/docker.sock
sudo usermod -a -G docker ubuntu