# ipcam-ftp-tools

Sean Begley
2017-07-23

This repository contains scripts useful for administering a FTP server that acts as a host for uploaded images from IP Cameras.

ftp_sort.sh
ftp_sort.sh will move "unsorted" files from an FTP upload folder to another directory where it will create a structure of "date" folders and in each "date" folder will be a set of "hour" folders.  Each "hour" folder will contain all of the uploaded images from that "date"/"hour".

ftp_cleanup.sh
ftp_cleanup.sh will delete all files older than X number of days and will delete empty folders.  This is useful for cleaning up a directory created/populated by ftp_sort.sh.  I use it to ensure that I only keep a weeks worth of IP Camera images.

delete_not_jpg.sh
delete_not_jpg.sh simply deletes files that don't end in ".jpg".  One of my IP Cameras will, sometimes, upload garabage filenames.  I run this script to delete those garbage files before running ftp_sort.sh
