#!/bin/bash 
readarray -t dockers <<<$(sudo docker ps --format '{{.Names}}'| grep 'ssh')
#output=$(sudo docker ps --format '{{.Names}}'| grep 'test')
#echo $output
echo ${dockers[@]}
for i in ${dockers[@]};
do 
	group=${i//[^0-9]}
	if [[ -n "$group" ]]; 
	then
		sed -i "4s/.*/as=$group/" copy-from-host.sh
		sudo docker cp copy-from-host.sh ${group}_ssh:/root 
	fi

done
