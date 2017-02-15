# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'YunoHost team'
SITENAME = 'YunoHost - Documentation'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = 'en'

THEME="./themes/yunohost/"

PAGE_URL = '{slug}/'
PAGE_SAVE_AS = '{slug}/index.html'
SLUGIFY_SOURCE = 'basename'

I18N_UNTRANSLATED_ARTICLES = 'remove'
I18N_UNTRANSLATED_PAGES = 'remove'

I18N_SUBSITES = {
    'fr': {
        'SITENAME': 'Documentation en français',
        }
    }

DEFAULT_PAGINATION = False
DISPLAY_PAGES_ON_MENU = False

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (('Pelican', 'http://getpelican.com/'),
         ('Python.org', 'http://python.org/'),
         ('Jinja2', 'http://jinja.pocoo.org/'),
         ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

PLUGIN_PATHS = ["plugins"]
PLUGINS = ['sitemap', 'i18n_subsites', 'page_hierarchy']

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
