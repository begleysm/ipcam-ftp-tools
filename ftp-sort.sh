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
#2019-07-17

#first parameter ($1) = path to source directory to be parsed
#second paramter ($2) = path to destination directory for files to be put in (sorted)
#third parameter ($3) = comma delimited list of extensions to sort

#example call: ./ftp_sort.sh /path/to/input/ /path/to/output/ jpg,mp4

#create list of extensions from $3
IFS_orig=$IFS
IFS=',' extensions=( $3 )
#command="shopt -s nullglob dotglob; find $1 "
command="find $1 "
for extension in "${extensions[@]}"
do
  command+="-name \"*.$extension\" -or "
done
command=${command::-5}
IFS=${IFS_orig}


#grab a list of all files with extensions from $3
#files=$(shopt -s nullglob dotglob; find ./test/input/ -name "*.jpg" -or -name "*.mp4")
files=$(eval $command)

#print out all of the files in $files
#for each in ${files}
#do
#  echo $each
#done

#ensure directory contains our desired extensions files before proceeding
if (( ${#files} ))
then
  #get a list of dates (YYYY-MM-DD), file paths, and filenames represented by the image/video files
  for each in ${files}
  do
    echo $each
    date=$(date +%Y-%m-%d-%H -r "$each");
    _DATES+=($date);
    FILES+=($each);
    FILENAMES+=(${each##*/});
  done

  #create a folder structure
  DATES=$(printf "%s\n" "${_DATES[@]}" | sort -u);
  for date in ${DATES[@]}; do

    #create YYYY-MM-DD dir if it doesnt exist
    if [ ! -d "$2/${date:0:10}" ]; then
      mkdir "$2/${date:0:10}"
    fi

    #create YYYY-MM-DD/HH dir if it doesnt exist
    if [ ! -d "$2/${date:0:10}/${date:11:2}" ]; then
      mkdir "$2/${date:0:10}/${date:11:2}"
    fi
  done

  #move the files into the new folder structure
  for ((i=0; i<${#FILES[*]}; i++));
  do
    date_dir=$(date +%Y-%m-%d -r "${FILES[i]}")
    hour_dir=$(date +%H -r "${FILES[i]}")
    mv ${FILES[$i]} $2/$date_dir/$hour_dir/"${FILENAMES[$i]}"
  done
  
  #delete remaining folders/files in the input path
  rm -r $1/*
  
fi
