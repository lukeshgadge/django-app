#!/bin/bash

###################
# user-lukesh
# date - 23/10/24
#
# shell used foe django appliactions 
#
#####################

gitcheckout() {
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

requirements() {
        sudo apt-get update -y
	sudo install docker.io -y
        sudo apt install nginx -y

}

service_start() {
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo systemctl start nginx

}


contenarised() {
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest

}

gitcheckout

requirements


service_start



contenarised
