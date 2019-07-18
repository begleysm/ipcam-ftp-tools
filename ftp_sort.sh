#!/bin/bash
#this bash script will sort a collection of .jpg/.mp4 files into a directory structure as follows
# date
#  hour
#  hour
#  hour
# date
#  hour
#  hour
#  hour
#it will only create directories that will have files in them.  This is useful for taking
#a general ftp upload location for security IP camera and sorting the contents by date and hour

#Sean Begley
#2019-07-14

#first parameter ($1) = path to source directory to be parsed
#second paramter ($1) = path to destination directory for files to be put in (sorted)

#ensure directory contains jpg/mp4 files before proceeding
files=$(shopt -s nullglob dotglob; echo $1/*.jpg $1/*.mp4)
if (( ${#files} ))
then
  #get a list of dates (YYYY-MM-DD) represented by the image/video files
  for each in $1/*.{jpg,mp4}
  do
    date=$(date +%Y-%m-%d-%H -r "$each");
    _DATES+=($date);
    FILES+=(${each##*/});
  done

  #create a folder structure
  DATES=$(printf "%s\n" "${_DATES[@]}" | sort -u);
  for date in ${DATES[@]}; do

    #create YYYY-MM-DD dir if it doesn't exist
    if [ ! -d "$2/${date:0:10}" ]; then
      mkdir "$2/${date:0:10}"
    fi

    #create YYYY-MM-DD/HH dir if it doesn't exist
    if [ ! -d "$2/${date:0:10}/${date:11:2}" ]; then
      mkdir "$2/${date:0:10}/${date:11:2}"
    fi
  done

  #move the files into the new folder structure
  for i in  ${FILES[@]}; do
    date_dir=$(date +%Y-%m-%d -r "$1/$i")
    hour_dir=$(date +%H -r "$1/$i")
    mv $1/$i $2/$date_dir/$hour_dir/$i
  done
fi
