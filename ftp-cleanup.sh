#!/bin/bash
#This bash script will delete all files under a directory based
#on how old those files are.  Empty directories will be deleted as well.
#This is useful for security camera footage repositories where you want to
#only keep content for a certain number of days

#Sean Begley
#2019-07-14

#first parameter ($1) = path to directory to cleanup
#second parameter ($2) = number of days of content to keep
#example usage = ./ftp_cleanup.sh /path/to/parent/directory/ 14

age=$(($2-1));
find $1 -mindepth 1 -mtime +$age -type f -delete
find $1 -mindepth 1 -type d -empty -delete
