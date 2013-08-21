#!/usr/bin/perl

data='RESERVATION     r-2f0d7356      785109311207    elasticbeanstalk-default
INSTANCE        i-1130436e      ami-e1058388    ec2-204-236-206-167.compute-1.amazonaws.com     ip-10-4-25-68.ec2.internal running ZaneRootKeyPair 0               m1.large        2012-11-23T20:45:52+0000        us-east-1b      aki-88aa75e1                       monitoring-enabled      204.236.206.167 10.4.25.68                      ebs       paravirtual      xen     3b737add-3f00-4d8b-aada-25bb98ebc102_us-east-1b_1       sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-a69cdcda    2012-11-23T20:45:56.000Z        true
TAG     instance        i-1130436e      Name    Production
TAG     instance        i-1130436e      aws:autoscaling:groupName       awseb-production-FhHQAwa2F8
RESERVATION     r-158df66c      785109311207    elasticbeanstalk-default
INSTANCE        i-27d8a758      ami-e1058388    ec2-184-73-9-88.compute-1.amazonaws.com ip-10-80-106-178.ec2.internal      running ZaneRootKeyPair 0               m1.large        2012-11-24T09:49:22+0000        us-east-1c      aki-88aa75e1                       monitoring-enabled      184.73.9.88     10.80.106.178                   ebs       paravirtual      xen     0890698e-46af-40eb-aa3c-04f9e4cb0c0c_us-east-1c_1       sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-30d79b4c    2012-11-24T09:49:26.000Z        true
TAG     instance        i-27d8a758      aws:autoscaling:groupName       awseb-production-FhHQAwa2F8
TAG     instance        i-27d8a758      Name    Production
RESERVATION     r-098df670      785109311207    elasticbeanstalk-default
INSTANCE        i-23d8a75c      ami-e1058388    ec2-107-22-155-202.compute-1.amazonaws.com      ip-10-159-61-120.ec2.internal      running ZaneRootKeyPair 0               m1.large        2012-11-24T09:49:22+0000        us-east-1aaki-88aa75e1                     monitoring-enabled      107.22.155.202  10.159.61.120                   ebs       paravirtual      xen     0890698e-46af-40eb-aa3c-04f9e4cb0c0c_us-east-1a_1       sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-35d79b49    2012-11-24T09:49:26.000Z        true
TAG     instance        i-23d8a75c      Name    Production
TAG     instance        i-23d8a75c      aws:autoscaling:groupName       awseb-production-FhHQAwa2F8
RESERVATION     r-70c89c08      785109311207    elasticbeanstalk-default
INSTANCE        i-1ff9036e      ami-976dc3fe    ec2-54-235-225-158.compute-1.amazonaws.com      ip-10-190-46-166.ec2.internal      running ZaneSupportKeyPair      0               m1.small        2013-01-01T16:29:56+0000        us-east-1b aki-88aa75e1                    monitoring-disabled     54.235.225.158  10.190.46.166                   ebsparavirtual     xen     d778820a-7338-46db-88aa-36e12490dbbf_us-east-1b_1       sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-6f42a011    2013-01-01T16:30:00.000Z        true
TAG     instance        i-1ff9036e      aws:autoscaling:groupName       awseb-ZaneBenefitsSupport-D97RkvunHs
TAG     instance        i-1ff9036e      Name    Support
RESERVATION     r-6d52f517      785109311207    elasticbeanstalk-default
INSTANCE        i-aee250dd      ami-976dc3fe    ec2-54-242-96-198.compute-1.amazonaws.com       ip-10-34-130-125.ec2.internal      running ZaneSupportKeyPair      0               m1.small        2013-02-24T03:19:53+0000        us-east-1c aki-88aa75e1                    monitoring-disabled     54.242.96.198   10.34.130.125                   ebsparavirtual     xen     17e9d5b3-6b3b-479b-bebb-add37dd2457c_us-east-1c_1       sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-4ca4bc3d    2013-02-24T03:19:58.000Z        true
TAG     instance        i-aee250dd      Name    Support
TAG     instance        i-aee250dd      aws:autoscaling:groupName       awseb-ZaneBenefitsSupport-D97RkvunHs
RESERVATION     r-bf5f32c5      785109311207    elasticbeanstalk-default
INSTANCE        i-2a742b59      ami-30fd6159    ec2-54-234-209-147.compute-1.amazonaws.com      ip-10-202-29-142.ec2.internal      running ZaneRootKeyPair 0               m1.medium       2013-03-04T22:54:44+0000        us-east-1caki-88aa75e1                     monitoring-disabled     54.234.209.147  10.202.29.142                   ebs       paravirtual      xen     darip1362437684426      sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-53ce7c23    2013-03-04T22:54:48.000Z        true
TAG     instance        i-2a742b59      Name    apilog migration 100
RESERVATION     r-9fd7abe5      785109311207    cron
INSTANCE        i-988fb8eb      ami-1a75e973    ec2-174-129-99-54.compute-1.amazonaws.com       ip-10-190-211-97.ec2.internal      running ZaneRootKeyPair 0               m1.small        2013-03-06T21:41:02+0000        us-east-1baki-88aa75e1                     monitoring-enabled      174.129.99.54   10.190.211.97                   ebs       paravirtual      xen     f14474c4-41bd-4ca3-9cd0-40f6edf199ee_us-east-1b_1       sg-a7c59ccf     default false
BLOCKDEVICE     /dev/sda1       vol-88d853f8    2013-03-06T21:41:07.000Z        true
TAG     instance        i-988fb8eb      aws:autoscaling:groupName       CronScale130306
TAG     instance        i-988fb8eb      Name    Cron
RESERVATION     r-27ade85d      785109311207    elasticbeanstalk-default
INSTANCE        i-54c4fd27      ami-e1058388    ec2-54-234-172-147.compute-1.amazonaws.com      domU-12-31-39-12-F4-89.compute-1.internal  running ZaneRootKeyPair 0               m1.small        2013-03-07T17:39:37+0000        us-east-1b aki-88aa75e1                    monitoring-disabled     54.234.172.147  10.200.247.119                  ebsparavirtual     xen     zgNQI1362677976882      sg-99fbb5f1     default false
BLOCKDEVICE     /dev/sda1       vol-4c63f13c    2013-03-07T17:39:40.000Z        true
TAG     instance        i-54c4fd27      Name    qa';

function ftpaws() {
	if [[ $# == "0" ]]; then
		echo
		echo Getting instance details...
		# $data=(ec2-describe-instances)
		instances=(); ## declare array
		echo "$data" | grep TAG | while read line; # gets each instance matching the tag
		do
			set $line ## $5 = instance tag, $3 = instance id
			if [[ $5 == "Production" ]]; then
				instances+=(${3})
			fi
			echo a ${instances[@]}
		done
		echo b ${instances[@]}
		echo "$data" | grep INSTANCE | while read line; # gets each instance domain name
		do
			set $line ## $2 = instance tag, $4 = domain name
			echo $2
			# echo ${instances[0]}
			for x in "${instances[@]}"
			do
				echo $x
				if [[ $2 == "$x" ]]; then
					echo $4
				fi
			done
		done
	fi
}

ftpaws $@