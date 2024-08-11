#!/bin/bash
router=${1,,}
ip=''
as=13
if [ "$router" == "zuri" ]
then
  ip=158.$as.10.2;
elif [ "$router" == "base" ]
then
  ip=158.$as.11.2;
elif [ "$router" == "gene" ]
then
  ip=158.$as.12.2;
elif [ "$router" == "luga" ]
then
  ip=158.$as.13.2;
elif [ "$router" == "muni" ]
then
  ip=158.$as.14.2;
elif [ "$router" == "lyon" ]
then
  ip=158.$as.15.2;
elif [ "$router" == "vien" ]
then
  ip=158.$as.16.2;

elif [ "$router" == "mila" ]
then
  ip=158.$as.17.2;
fi

if [ -n "$ip" ] && [ -n "$2" ] && [ -n "$3" ];
 then echo $ip $2 $3
 eval "ssh root@$ip 'cat $2' > ""$3"";"
else
 echo "missing argument(s)"
 echo "usage is:"
 echo "   ./copy-from-host.sh [router-name] [file-to-copy] [file-to-save]"
 echo "example: ./copy-from-host.sh ZURI apache.pcap apache-copy.pcap"
fi
