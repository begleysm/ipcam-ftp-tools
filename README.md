# ipcam-ftp-tools

Sean Begley (begleysm@gmail.com)

https://steamforge.net/wiki

https://github.com/begleysm/ipcam-ftp-tools

2019-07-17

This repository contains scripts I wrote for administering a FTP server that acts as a host for uploaded images/videos from IP Cameras.  These scripts should also be useful in other applications.

## bin-by-date
`bin-by-date` will recursivly copy or move "unsorted" files from a source directory to a destination directory where it will create a structure of "date" folders and in each "date" folder will be a set of "hour" folders.  Each "hour" folder will contain all of the uploaded files, with specified extensions, from that "date"/"hour".  The source folder can optionally be deleted afterwards.
first parameter `$1` = path to source directory to be parsed `/path/to/source/dir/`
second paramter `$2` = path to destination directory for files to be put in (sorted) `/path/to/destination/dir/`
third parameter `$3` = comma delimited list of extensions to sort `jpg,mp4`
fourth parameter `$4` = mode: `copy` or `move` or `move-delete`
                        1.) if set to `copy` then files will be copied from the source dir
                            to the destination dir and the source dir will be left unmodified
                        2.) if set to `move` then files will be moved from the source dir
                            to the destintion dir but any other files not moved will be left
                            unmodified
                        3.) if set to `move-delete` then files will be moved from the source dir
                            to the destination dir and then all other files in the source dir will
                            be deleted

example usage: `./bin-by-date /path/to/input/ /path/to/output/ jpg,mp4 move-delete`

## del-older-than
`del-older-than` will delete all files older than X number of days and will delete empty folders.  I use it on `bin-by-date`'s destination directory to ensure that I only keep a weeks worth of IP Camera images/videos.

first parameter `$1` = path to directory to cleanup `/path/to/dir`
second parameter `$2` = number of days of content to keep `14`

example usage: `./del-older-than /path/to/parent/directory/ 14`

## del-not-ext
`del-not-ext` will delete files that don't end in an extension specified when calling the script.  One of my IP Cameras will, sometimes, upload garabage filenames.  Another one uploads .idx files I don't care about.  I can run this script to delete those files before executing other operations.

first parameter `$1` is the directory to work on `/path/to/dir`
second parameter `$2` is a comma delimited list of file extensions to NOT delete `jpg,mp4`

example usage: `./del-not-ext /path/to/directory jpg,mp4`
