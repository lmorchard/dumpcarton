# dumpcarton

To share static files from my laptop to the web, I wanted something like
[Dropbox](http://dropbox.com)'s automatic background file sync, but only
publishing one-way to my own server and S3.

This seems to do it for me, on my Mac OS X laptop. This may or may not be
useful to you.

## Installation

* Run `sudo gem install s3sync`
* Run `sudo gem install kicker`
* Install [growlnotify](http://growl.info/extras.php#growlnotify)
* Make sure `ssh-agent` is running. This seems to be taken care of under OS X Leopard.
* Edit `conf/config.sh`
* Run `./bin/init.sh`
