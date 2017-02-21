#!/usr/bin/env bash

BASEDIR=.
DOCDIR=$BASEDIR/content-en/
OUTPUTDIR=$BASEDIR/content/
PO4ACONF=./po4a.cfg

# clean all
rm -r $OUTPUTDIR*

# copy file structure and english content
cp -r $DOCDIR* $OUTPUTDIR

find $DOCDIR -name '*.md' | sed -r 's!(.*)(content)-en(.*)\.md![type: text] \1\2-en\3.md $lang:\1\2\3.$lang.md!' >> $PO4ACONF

awk '!x[$0]++' $PO4ACONF > $PO4ACONF.tmp

cp $PO4ACONF.tmp $PO4ACONF
rm $PO4ACONF.tmp

# generate po files and generate translated content
PERLLIB=./po4a-keyvalue_text/lib ./po4a-keyvalue_text/po4a $PO4ACONF \
	--package-name "YunoHost-Documentation" \
	--package-version `date +%Y%m%d`\
	--msgid-bugs-address contrib@list.yunohost.org \
	--master-charset utf8
