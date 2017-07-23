#This bash script will delete files ina directory that don't end in .jpg
#This is useful for removing "crud" from an FTP upload folder from IP
#cameras that occasionally upload garbage.

#Sean Begley
#2017-07-23

#first parameter ($1) is the directory to work on

#only run if a working directory argument is supplied
if [ ! -z "$1" ]; then
  #delete any file that doesn't end in .jpg
	find $1 -type f ! -name '*.jpg' -delete
fi
