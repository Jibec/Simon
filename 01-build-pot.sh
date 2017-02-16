#!/usr/bin/env bash
#TODO: test what happens when two pages have the same name in some directories

BASEDIR=$(pwd)
INPUTDIR=$BASEDIR/content/
OUTPUTDIR=$BASEDIR/content-pot/

for MD in `find $INPUTDIR -regex '.*.md'`
do
	filename=$(basename "$MD")
	extension="${filename##*.}"
	filename="${filename%.*}"
	outputfilename="$OUTPUTDIR$filename.pot"
	po4a-gettextize -f text -m $MD --master-charset utf8 -p $outputfilename
done
