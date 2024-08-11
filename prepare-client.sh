#!/bin/bash
hosts=("ZURI" "BASE" "GENE" "LUGA" "MUNI" "LYON" "VIEN" "MILA")
for i in ${hosts[@]}
do 
	ases=$(sudo docker ps --format '{{.Names}}'| grep 'ssh')
	for a in $ases
	do
		as=${a//[^0-9]}
		sudo docker cp apk-client ${as}_${i}host:/home/
		sudo docker exec -w /home ${as}_${i}host apk add apk-client/curl/*
		sudo docker exec -w /home ${as}_${i}host apk add apk-client/python/*
		sudo docker exec -w /home ${as}_${i}host rm -r apk-client
	done
done	
