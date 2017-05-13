#!/bin/bash


function main {

	sudo yum -y update

	#tmux
	sudo yum -y install tmux
	sudo yum -y install vim
	sudo yum -y install git
	
	installDocker 	wait

	}


function installDocker {

	#method 2 
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-rep https://download.docker.com/linux/centos/docker-ce.repo

	sudo yum makecache fast
	sudo yum install docker-ce
	
	sudo usermod -aG docker $(whoami)
	#sudo systemctl daemon-reload
	sudo systemctl start docker
	sudo systemctl enable docker
	
	#Docker compose
	curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose
	sudo cp /tmp/docker-compose /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose 
	rm /tmp/docker-compose
}

##tomcat 
# https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-centos-7-via-yum

main
