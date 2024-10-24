#!/bin/bash

###################
# user-lukesh
# date - 23/10/24
#
# shell used foe django appliactions 
#
#####################

set -xe

gitcheckout() {
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

requirements() {
        sudo apt-get update -y
	sudo install docker.io -y
        sudo apt install nginx 
        sudo apt install docker-compose -y
}

service_start() {
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo systemctl start nginx

}


contenarised() {
        sudo chown $USER /var/run/docker.sock 

	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
        docker-compose up -d
}

echo "*********** Deployment start ***********"
if ! gitcheckout; then
	echo "code already exists in folder"
	cd django-notes-app
fi

if ! requirements; then
        echo " need to look"
	exit 1

fi


if ! service_start; then 
	echo "service not started"
	exit 1

fi

if ! contenarised; then 
	echo "app not running"
	exit 1
fi

echo "************ Deployment Done*********"
