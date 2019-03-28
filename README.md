# ipcam-ftp-tools

Sean Begley
2017-07-23

This repository contains scripts useful for administering a FTP server that acts as a host for uploaded images from IP Cameras.

FTP_SORT.SH
ftp_sort.sh will move "unsorted" files from an FTP upload folder to another directory where it will create a structure of "date" folders and in each "date" folder will be a set of "hour" folders.  Each "hour" folder will contain all of the uploaded images from that "date"/"hour".
example usage: ./ipwatch.py ./config.txt

FTP_CLEANUP.SH
ftp_cleanup.sh will delete all files older than X number of days and will delete empty folders.  This is useful for cleaning up a directory created/populated by ftp_sort.sh.  I use it to ensure that I only keep a weeks worth of IP Camera images.
example usage: ./ftp_cleanup.sh /path/to/parent/directory/ 14

DELETE_NOT_JPG.SH
delete_not_jpg.sh simply deletes files that don't end in ".jpg".  One of my IP Cameras will, sometimes, upload garabage filenames.  I run this script to delete those garbage files before running ftp_sort.sh
example usage: ./delete_not_jpg.sh /path/to/directory
