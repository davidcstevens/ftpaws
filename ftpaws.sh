#!/bin/bash

function usage() {
	echo
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@//////@@///////@@////@@@@@@@@@@@//@@//@@@@@@@@@@//@@////@@@"
	echo "@@//@@@@@@@@//@@@@@//@//@@@@@@@@@////@@//@@@@@@@@//@@//@@@/@@"
	echo "@@////@@@@@@//@@@@@////@@@///@@@//@@//@@//@@//@@//@@@@@//@@@@"
	echo "@@//@@@@@@@@//@@@@@//@@@@@@@@@@////////@@////////@@@@/@@@//@@"
	echo "@@//@@@@@@@@//@@@@@//@@@@@@@@@//@@@@@@//@@//@@//@@@@@@////@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo
	echo "   Parameters:"
	echo
	echo "	-h: print this help doc"
	echo
	echo "	-t: set search tag"
	echo
	echo "	-l: list all domains"
	echo
	echo "	-s: list all domains in a single line"
	echo
	echo "	-a: list all instances with details"
	echo
	echo "	-f: specify path and filename for FTP"
	echo
	echo "	-d: specify destination path and filename on the instance"
	echo
	echo "   Examples:"
	echo 
	echo "	To view a list of all Production instances IDs:"
	echo "		ftpaws.sh -t Production -l"
	echo 
	echo "	To FTP a file to the Cron instances:"
	echo "		ftpaws.sh -f /path/to/local/file -d /path/to/destination/directory"
	echo
}

function ftpaws() {
	if [[ $# == "0" ]]; then
		# listdomains "-l"
		echo 
		echo "Nothing to do"
		echo "Type 'ftpaws.sh -h' for help"
		echo 
	else
		echo
		switchboard $@
	fi
}

function switchboard() {
	while getopts ":ht:slaf:" optname
	do
		case "$optname" in
			"h")
				printhelp
				exit
				;;
			"t")
				settag $OPTARG
				;;
			"l" | "s" | "a")
				if [[ -z $listparam ]]; then
					listparam=$optname
				fi
				;;
			"f")
				filepath=$OPTARG
				;;
			"d")
				destination=$OPTARG
				;;
			"?")
				echo "Unknown option $OPTARG"
				;;
			":")
				case "$OPTARG" in
					"f")
						echo "Argument $OPTARG requires a filename"
						exit
						;;
					"t")
						echo "Argument $OPTARG requires a tag name"
						exit
						;;
					*)
						echo "Argument $OPTARG requires a value"
						;;
				esac
				;;
			*)
				# Should not occur
				echo "Nothing to do"
				;;
		esac
		# echo "OPTIND is now $OPTIND"
	done
	if [[ -z $listparam ]] && [[ -z $filepath ]] && [[ -z $destination ]]; then
		usage
		exit 1
	elif [[ $listparam ]]; then
		listdomains
	elif [[ $filepath ]] || [[ $destination ]]; then
		sendftp
	else 
		usage
		exit 1
	fi
}

function settag() {
	tag=$1
	echo "Search tag set to '$tag'"
}

function listdomains() {
	echo "Getting instance details..."
	data=$(ec2-describe-instances)
	tags=$(echo "$data" | grep TAG)
	instances=$(echo "$data" | grep INSTANCE)
	ids=(); ## declare array
	domains=(); ## declare array
	while read line; ## gets each instance matching the tag
	do
		set $line ## $5 = instance tag, $3 = instance id
		if [ -z "$tag" ]; then
			ids+=(${3})
		else
			if [[ $5 == $tag ]]; then
				ids+=(${3})
			fi
		fi
	done <<< "$tags"
	while read line; ## gets each instance domain name
	do
		set $line ## $2 = instance tag, $4 = domain name
		for x in "${ids[@]}"
		do
			if [[ $2 == "$x" ]]; then
				domains+=(${4})
			fi
		done
	done <<< "$instances"
	if [[ $listparam == "s" ]]; then
		listfunctions $param
	elif [[ $listparam == "l" ]]; then
		listfunctions $param
	elif [[ $listparam == "a" ]]; then
		listfunctions $param
	fi
	echo
}

function listfunctions() {
	case "$listparam" in
		"l")
			for x in "${domains[@]}"
			do
				echo $x
			done
			;;
		"s")
			echo ${domains[@]}
			;;
		"a")
			for x in "${instances[@]}"
			do
				echo "$x"
			done
			;;
		*)
			echo
			;;
	esac
	echo 
}

function sendftp() {
	if [[ ${#domains[@]} == 0 ]]; then
		listdomains
	fi
	if [[ -z $filepath ]] || [[ -z $destination ]]; then
		echo "Both the source file path and destination need to be set"
		echo "Type 'ftpaws.sh -h' for help"
		exit 1
	fi
	echo "filepath=$filepath"
	echo "destination=$destination"
	echo "${domains[@]}"
	echo 
	echo "Connecting to server..."
	sftp -n -v $HOST << EOT
	ls
	quit
	EOT
}

ftpaws $@