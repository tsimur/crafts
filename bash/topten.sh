#!/bin/bash

error=false
arg_quant=$#
first_arg=$1

######## FUNCTIONS ########


error_handling_arguments () { #errors with arguments

	if [ $arg_quant -eq 0 ] #no arg error
	then
		error=true
		echo -e "\e[1;31merr: (missing Arguments! Pls use at least one argument with $0 script)\e[0m"
		help_msg
		exit 1
	else
		if [ $arg_quant -gt 1 ] #more then 1 arguments
		then
			error=true
			echo -e "\e[1;31merr: (Too much argumets! Pls input only one argument)\e[0m"
			help_msg
			exit 2
		fi
	fi
}

error_handling_path () { #error with path handler
	if test -e $first_arg #err - not exist
	then
		if test -d $first_arg #err - no dir
			then
				echo
			else
				error=true
				echo -e "\e[1;31merr: ($PWD/\e[5;31m$first_arg\e[0;1;31m is not a directory)\e[0m"
				help_msg
				exit 3
		fi
	else
		error=true
		echo -e "\e[1;31merr: (patch $PWD/\e[5;31m$first_arg\e[0;1;31m not exist)\e[0m"
		help_msg
		exit 4
	fi
}



show_help () { #display help msg
	echo -e "\e[46;1;37mHELP PAGE ABOUT SCRIPT $0 \e[0m"
	echo "The script is designed to search for the 10 largest files in the folder specified as the first argument when invoking the script. The script accepts only one argument, otherwise it returns an error.

Command usage:
$0 DIRECTORY"

}

help_msg () { #call to get help if have some trouble
	echo -e "\e[46;1;37mIf you want to get help, then use key -h or --help\e[0m"
}


######## /FUNCTIONS ########






######## MAIN ########



if [[ $first_arg = "--help" ]]||[[ $first_arg = "-h" ]] #exception check
then
	show_help
else
	error_handling_arguments
	error_handling_path

fi

if [[ $error = "false" ]]&&[[ $first_arg != "-h" ]]&&[[ $first_arg != "--help" ]]
then
	find "$PWD/$first_arg" -type f -exec du -h {} \; | sort -nr | head -10
	exit 0
fi

echo $error
######## /MAIN ########
