#!/usr/bin/env bash

BASEDIR=$(pwd)
DOCDIR=$BASEDIR/content-en/
OUTPUTDIR=$BASEDIR/content/

# clean all
rm -r $OUTPUTDIR*

# copy file structure and english content
cp -r $DOCDIR* $OUTPUTDIR

# generate po files and generate translated content
po4a po4a.cfg \
	--package-name "YunoHost-Documentation" \
	--package-version `date +%Y%m%d`\
	--msgid-bugs-address contrib@list.yunohost.org
