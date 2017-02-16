#!/usr/bin/env bash
#TODO: handle already existing OUTPUTFILE exist, if so delete it and update

BASEDIR=$(pwd)
INPUTDIR=$BASEDIR/content-pot/
OUTPUTDIR=$BASEDIR/content-weblate/
OUTPUTFILE=$OUTPUTDIR"documentation.pot"

for POT in `find $INPUTDIR -regex '.*.pot'`
do
	msgcat $POT $OUTPUTFILE --output-file=$OUTPUTFILE
done
