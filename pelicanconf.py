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
PATH_METADATA = 'pages/(?P<path>.*)\..*'

I18N_UNTRANSLATED_ARTICLES = 'keep'
I18N_UNTRANSLATED_PAGES = 'keep'

I18N_SUBSITES = {
    'fr': {
        'SITENAME': 'Documentation en français',
        'SITEMAP' : {'format': 'xml'},
        }
    }

JINJA_ENVIRONMENT = {'extensions':['jinja2.ext.i18n']}

I18N_GETTEXT_LOCALEDIR = './l10n/po/'
I18N_GETTEXT_DOMAIN = 'ynh_template'

DEFAULT_PAGINATION = False
DISPLAY_PAGES_ON_MENU = False

SITEMAP = {'format': 'xml'}

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
