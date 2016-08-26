#!/bin/bash

DL_STR_FILE=$1;
DL_STR=`cat $DL_STR_FILE`;

aspera_bin=/home/cczysz/.aspera/connect/bin/ascp;
aspera_key=/home/cczysz/.aspera/connect/etc/asperaweb_id_dsa.openssh;

idx=0
echo $idx
for i in $DL_STR; do
	case $idx in
		9)	key=$i
			;;
		10)	addr=$i
			;; 	
	esac
	idx=$(( $idx + 1 ));
	echo $idx
done

echo $key
echo $addr

mkdir -p /data

echo "Starting download"

$aspera_bin -v -l 500M -k 1 -i $aspera_key -W $key $addr /data
