This is a proof of concept to bring internationalization of YunoHost's Documentation. It uses Pelican for the static website generation and po4a to convert from _.md_ to _.po_ and _.po_ to _.md_. All packages are available for standard distribution like Debian (used by YunoHost).

## Benefits

The po4a's documentation explain pretty well the benefits of such a system: "The po4a (PO for anything) project goal is to **ease translations (and more interestingly, the maintenance of translations)** using gettext tools on areas where they were not expected like documentation."

* Allow easy addition of new language
* Allow usage of our translation platform
* It can still use the javascript that does in-browser text eddition & commits (not activated yet)

## Downsides

* Requires to write documentation in English
* It requires to rework our landing page (actually using too much html to use the internal link mechanism)
* Extent the text-based system we currently have

## Migration

Our documentation needs cleaning and this new system needs to add a few headers and to correct internal links. It means work, but it also is an opportunity to do something really needed.

## Fedora tooling system

The fedora documentation system is actually being rebuild with similar tooling. You can have see it live on [docs.fedoraproject.org](https://docs.fedoraproject.org/). They decided to use asciidocs instead of markdown, and we are nearly close to publish the same internationalization mechanism.

I used Pelican because I'm using it for my personnal website and won't mind replacing it by the same system Fedora uses if the team finds it more appropriate.

# Dependencies

Install Pelican >=3.7, babel and markdown. You may use _pip + virtualenv_ if those are not yet packaged for your distribution.
You need po4a >= 0.51

# Test it

## Build translation

Run the build script (it will go to Makefile someday):

```
$ ./build-translation
$ ./develop_server.sh start 8080
```

Access your static website with [http://localhost:8080](http://localhost:8080).

# How-to

## Add a new language

1. Edit pelicanconf.py and add your locale
2. Edit build-translation and add your locale
3. Run this script and replace *fr* by the appropriate locale:

```:bash
pybabel init --input-file ./l10n/po/ynh_template.pot \
	--output-dir ./l10n/po/ \
	--locale fr \
	--domain ynh_template
```
