#This bash script will delete all files under a directory based
#on how old those files are.  Empty directories will be deleted as well.
#This is useful for security camera footage repositories where you want to
#only keep content for a certain numbe of days

#Sean Begley
#2017-07-23

#first parameter ($1) = path to directory to cleanup
#second parameter ($2) = number of days of content to keep
age=$(($2-1));
find $1 -mindepth 1 -mtime +$age -type f -delete
find $1 -mindepth 1 -type d -empty -delete
# find /volume1/Security_Cams/ -mindepth 1 -size +40k -type f -delete
