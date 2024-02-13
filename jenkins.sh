#User_Data

# This will Install JAVA 17 and Jenkikns and run the service. 
# Java is pre-requiste with right version for Jenkins to run.
# Note: Not all Java Version are supported hence check Jenkins official website.


#!/bin/bash

#First Install Java
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-17-jdk -y
java -version


#Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

#Reads credential of Initial Admin Pass
sudo su 
echo 'The Intial Admin Password for Jenkins is :' 
cat /var/lib/jenkins/secrets/initialAdminPassword



