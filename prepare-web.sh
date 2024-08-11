#!/bin/bash 
#Script untuk menjalankan setup container untuk praktikum modul 10 dan 11.
#usage: prepare-web.sh [nama-container-host-server]
#contoh: prepare-web.sh 2_GENE
webcontainer=$1

sudo docker cp apk-server  $webcontainer:/root/
sudo docker exec -w /root $webcontainer apk add apk-server/apache2/*
sudo docker cp for-protected/private $webcontainer:/var/www/localhost/htdocs/
sudo docker cp for-protected/httpd.conf $webcontainer:/etc/apache2/
sudo docker exec -w /root $webcontainer httpd
sudo docker exec -w /root $webcontainer rm -r apk-server
