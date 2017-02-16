#!/usr/bin/env bash

LOCALES="fr"
BASEDIR=$(pwd)
INPUTDIR=$BASEDIR/content-weblate/
OUTPUTDIR=$BASEDIR/content-translated/

for MD in `find $INPUTDIR -regex '.*.po'`
do
	filename=$(basename "$MD")
	extension="${filename##*.}"
	filename="${filename%.*}"
	locale="${filename##*.}"
	filename="${filename%.*}"

	echo $filename $extension $locale
done
