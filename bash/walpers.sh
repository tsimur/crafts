#!/bin/bash

################## PARAMETRS ######################
first_arg=$1
second_arg=$2
third_arg=$3
################### /PARAMETRS #####################

################### FUNCTIONS ######################
show_help () { #display help msg
  echo -e "\e[46;1;37mUsage:\e[0m"
  echo "walpers.sh [keyword,keyword] [image resolution width] [image resolution height]"
	echo -e "\n"
	echo -e "\e[46;1;37mExemple:\e[0m"
	echo -e "\t walpers.sh lake"
	echo "or"
  echo -e "\t walpers.sh lake 1366 768"
	echo "or"
	echo -e "\t walpers.sh city,usa 1024 768"
	echo "or"
	echo -e "\t walpers.sh usa,city 3840 2160"
	echo -e "\n"
	echo -e "\e[46;1;37mPlease note:\e[0m"
	echo "The aspect ratio of the image may differ from the aspect ratio of your monitor. Therefore, some images are partially displayed on the screen and therefore will look with low definition. If this happens, just repeat the script again to get another picture on your desktop."
	echo -e "\n"
	echo -e "By default if you do not specify image resolution parameters will be used 1920x1080"

}

make_script_global () {
  if [[ -d "$HOME/scripts" ]]
  then
    cp "$(readlink -f $0)" "$HOME/scripts"
  else
    mkdir $HOME/scripts
    cp "$(readlink -f $0)" "$HOME/scripts"
  fi

  if grep -Fxq "export PATH=$PATH:~/scripts" ~/.bashrc
  then
      echo "OK"
  else
      echo "export PATH=$PATH:~/scripts" >> $HOME/.bashrc
  fi

}

change_imge () {
	# selection of keywords by which to find the image. If the keyword was not entered then user default keyqwords "road,pine"
	if [ -z "$first_arg" ]
	then
		imgage_search_keyword=road,pine
	else
	  imgage_search_keyword=$first_arg
	fi

	# file name generation
	filename_body=$(date '+%m-%d-%y-%H-%M-%S')
	filename_addition=$(echo "$imgage_search_keyword" | tr ',' '-')
	file_ext="jpg"
	filename=$filename_addition'-'$filename_body'.'$file_ext

	# set image save path
	save_path=/home/$USER/Pictures/

	# set image resolution
  if [ -z "$second_arg" ]||[ -z "$third_arg" ]
  then
    resolution_w=1920
    resolution_h=1080
  else
    resolution_w=$second_arg
    resolution_h=$third_arg
  fi

	resolution_in_uri=$resolution_w'x'$resolution_h

	#download and setup background
	wget https://source.unsplash.com/$resolution_in_uri/?$imgage_search_keyword --output-document=$save_path$filename
	gsettings set org.gnome.desktop.background picture-uri file://$save_path$filename

  echo -e "\e[46;1;37mtype $0 --help to see more option\e[0m"
}
################### /FUNCTIONS ######################


################### SCRIPT LOGIC ####################
if [[ $first_arg = "--help" ]]||[[ $first_arg = "-h" ]]; then
	show_help
elif [[ $first_arg = "--any" ]]; then
  make_script_global
else
	change_imge
fi
################### /SCRIPT LOGIC ###################





####### to do ##########
# make help multyline
