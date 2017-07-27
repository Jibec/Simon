This is a proof of concept for an automation of translation of YunoHost's Documentation. It uses Pelican for the static website generation and po4a to convert from _.md_ to _.po_ and _.po_ to _.md_. All packages are available for standard distribution like Debian (used by YunoHost).

## Benefits

The po4a's documentation explain pretty well the benefits of such a system: "The po4a (PO for anything) project goal is to **ease translations (and more interestingly, the maintenance of translations)** using gettext tools on areas where they were not expected like documentation."

* Allow easy addition of new language
* Allow usage of our translation platform
* 
* It can still use the javascript that does in-browser text eddition & commits (not activated yet)

## Downsides

* Requires to write documentation in English
* It requires to rework our landing page (actually using too much html to use the internal link mechanism)
* Extent the text-based system we currently have

## Migration

Our documentation needs cleaning and this new system needs to add a few headers and to correct internal links. It means work, but it also is an opportunity to do something really needed.

## Fedora tooling system

The fedora documentation system is actually being rebuild with similar tooling. You can have a demonstration on [Bex's website](https://bex.fedorapeople.org/fedora-docs-web/index.html). They decided to use asciidocs instead of markdown, and I'm currently working on bringing the same internationalization mechanism.

I used Pelican because I'm using it for my personnal website and won't mind replacing it by the same system Fedora uses if the team find it more appropriate.

# Dependencies

## Pelican (python), babel and markdown

Install Pelican >=3.7, babel markdown. You may use _pip + virtualenv_ if those are not yet packaged for your distribution.

## Po4a

Go to the folder _po4a-keyvalue_text_ and run:

```
$ perl Build.PL
$ ./Build
```

Po4a will ask you to install needed perl packages.
It's a clone of Brian Excelbierd's repository https://github.com/bexelbie/po4a/tree/keyvalue_text

Note this code [has been upstreamed](https://github.com/mquinson/po4a/commit/b0a06421ba89c218d927efe36913686981a2ecc0), I assume it will land in _v0.52_.

# Test it

## Build translation

Run the build script (it will go to Makefile someday):

```
$ ./build-translation
$ ./develop_server.sh start 8080
```

Then go on firefox to see the static website with [http://localhost:8080](http://localhost:8080).

In case of extensive testing, you'll probably run this global command pretty often to refresh the whole content:
```
$ ./develop_server.sh stop && ./build-translation.sh && ./develop_server.sh start 8080
```

# How-to

## Add a new language

1. Edit pelicanconf.py and add your locale
2. Edit po4a.cf and add your locale
3. Run this script and replace *fr* by the appropriate locale:

```:bash
pybabel init --input-file ./l10n/po/ynh_template.pot \
	--output-dir ./l10n/po/ \
	--locale fr \
	--domain ynh_template
```
