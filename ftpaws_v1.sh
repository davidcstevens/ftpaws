#!/bin/bash

function printhelp() {
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
	echo "	-l: list all domains"
	echo
	echo "	-p: list all domains in a single line"
	echo
	echo "	-f: specify path and filename"
	echo
}

function ftpaws() {
	if [[ $# == "0" ]]; then
		# listdomains "-l"
		echo 
		echo "Nothing to do"
		echo 
		echo "	Use 'ftpaws -h' for help"
		echo 
	else
		for ((x=1; x<="$#"; x++))
		do
			y=$((${x}+1))
			switchboard ${!x} ${!y}
		done
	fi
}

function switchboard() {
	case "$1" in
		"-h")
			printhelp
			break 2
			;;
		"-l")
			listdomains $1
			break 2
			;;
		"-p")
			listdomains $1
			break 2
			;;
		"-f")
			file=$2
			sendftp $file
			;;
		*)
			;;
	esac
}

function listdomains() {
	echo
	echo Getting instance details...
	echo
	param=$1
	data=$(ec2-describe-instances)
	tags=$(echo "$data" | grep TAG)
	instances=$(echo "$data" | grep INSTANCE)
	ids=(); ## declare array
	domains=(); ## declare array
	while read line; ## gets each instance matching the tag
	do
		set $line ## $5 = instance tag, $3 = instance id
		if [[ $5 == "Production" ]]; then
			ids+=(${3})
		fi
	done <<< "$tags"
	while read line; ## gets each instance domain name
	do
		set $line ## $2 = instance tag, $4 = domain name
		for x in "${ids[@]}"
		do
			if [[ $2 == "$x" ]]; then
				domains+=(${4})
				if [[ $param == "-l" ]]; then
					echo $4
				fi
			fi
		done
	done <<< "$instances"
	if [[ $param == "-p" ]]; then
		if [[ ${#domains[@]} > 0 ]]; then
			exit
		else
			echo ${domains[@]}
		fi
	fi
}

function sendftp() {
	if [[ ${#domains[@]} == 0 ]]; then
		listdomains
	fi
	echo "${domains[@]}"
}

ftpaws $@