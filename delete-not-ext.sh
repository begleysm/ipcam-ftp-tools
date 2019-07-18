#!/bin/bash
#This bash script will delete files in a directory that don't have one
#of the extensions specified in the 2nd parameter.

#Sean Begley
#2019-07-14

#first parameter ($1) is the directory to work on
#second parameter ($2) is a comma delimited list of file extensions to NOT delete
#Example call: ./delete_not_jpg.sh /path/to/directory jpg,mp4

#create list of extensions from $2
IFS=',' extensions=( $2 )

#only run if a working directory argument is supplied
if [ ! -z "$1" ]; then

  #begin constructing our find command
  command="find $1 -type f "

  #create conditions from extension for the find command
  for extension in "${extensions[@]}"
  do
    command+="! -name *.$extension "
  done
  
  #finish our find command
  command+="-delete"
  
  #delete any file that doesn't end in $extension
  bash -c $command
fi
