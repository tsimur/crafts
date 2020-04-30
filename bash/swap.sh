#!/bin/bash
# Use first parametr to set size of swap fil.
# Example:
#	./swap.sh 5
# This means 5Gig swap
# Or use char d to disable swap and delete swapfile, which was created by this script
# Example:
# 	./swap.sh d
# !!! Be careful, this script does not have check free disk space before creating a swap file


re='^[0-9]+$'



if [[ "$1" == "d" ]]; then
	sudo swapoff /swapfile
	sudo rm /swapfile
	echo "delete"
elif [[ $1 =~ $re ]]; then
	sudo fallocate -l $1G /swapfile
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
fi
