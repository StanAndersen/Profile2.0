#!/bin/bash


function main {

	sudo yum -y update

	#tmux
	sudo yum -y install tmux
	sudo yum -y install vim
	sudo yum -y install git
	sudo yum -y install wget
	
	installDocker
	installNode
	
	}


function installDocker {

	#method 2 
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-rep https://download.docker.com/linux/centos/docker-ce.repo

	sudo yum makecache fast
	sudo yum -y install docker-ce
	
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

function installNode {

	#method 2 
	sudo yum -y install epel-release
	sudo yum -y install nodejs
	sudo yum -y install npm
	sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
	sudo yum -y install yarn
	
}

main
