#!/usr/bin/env bash
# This scripts takes our documentation (DOCDIR)
# copies it to the standard Pelican directory (OUTPUTDIR)
# calls po4a to update po files
# calls po4a to generate localized markdown into standard Pelican directory
# calls babel to update po files
# calls babel to compile po files to mo files for in-browser usage
# the website generation is using the standard Pelican behavior

DOCDIR=content-v2/
OUTPUTDIR=content/
PO4ACONF=po4a.cfg

# clean all
if [ -d $OUTPUTDIR ]; then
	rm -r $OUTPUTDIR*
else
	mkdir $OUTPUTDIR
fi

# copy file structure and english content
cp -r $DOCDIR* $OUTPUTDIR

cat >$PO4ACONF <<'EOT'
[po4a_langs] fr
[po4a_paths] l10n/po/documentation.pot $lang:l10n/po/documentation.$lang.po
[options] opt:"-o markdown -k 50 -o keyvalue"
EOT

# update list of file to translate
# if we want to exclude some files, we'll have to change this script
dir="content-v2"
for file in $( find -L $DOCDIR -name "*.md" ); do
    basename=`basename -s .md $file`
    dirname=`dirname $file`
    path=`echo ${dirname#$dir/}`
    echo $path
    if [ "$dirname" = "$dir" ]; then
        potname="$basename.\$lang.md"
    else
        potname="$path/$basename.\$lang.md"
    fi
    # update list of file to translate
    echo "[type: text] $file \$lang:$OUTPUTDIR$potname"
    echo "[type: text] $file \$lang:$OUTPUTDIR$potname" >> $PO4ACONF
done

# generate po files and generate translated content
po4a $PO4ACONF \
	--package-name "YunoHost-Documentation" \
	--package-version `date +%Y%m%d`\
	--msgid-bugs-address contrib@list.yunohost.org \
	--master-charset utf8

# extract template translation
pybabel extract --mapping babel.cfg --output ./l10n/po/ynh_template.pot .

pybabel update --input-file ./l10n/po/ynh_template.pot \
	--output-dir ./l10n/po/ \
	--domain ynh_template

pybabel compile --directory ./l10n/po/ --domain ynh_template
