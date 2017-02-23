YunoHost Documentation - POC Pelican + po4a

# Dependences

## Pelican (python)

Install Pelican >=3.7 and markdown.

> virtualenv ./

> source bin/activate

> pip install pelican markdown

## Po4a

Go to po4a-keyvalue_text and run:

> perl Build.PL

> ./Build

Po4a will ask you to install needed packages.
It's a clone of Brian Excelbierd's repository https://github.com/bexelbie/po4a/tree/keyvalue_text

## Babel

> dnf install babel

# Test it

## Build translation

Run the build script (it will go to Makefile someday):

> ./build-translation

## Generate content

Run the development server:

> ./develop_server.sh start 8080

Then go on firefox to see the static website with http://localhost:8080
