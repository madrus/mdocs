## Installation

Taken from [this website](http://wiljenumdesign.nl/getting-started/).

### Installing MkDocs
Before installing MkDocs, you need to make sure you have Python and pip – the Python package manager – up and running. You can verify if you're already good to go with the following commands:

python --version
# Python 2.7.13
pip --version
# pip 9.0.1
Installing and verifying MkDocs is as simple as:

pip install mkdocs && mkdocs --version
# mkdocs, version 0.17.1
Material requires MkDocs >= 0.17.1.

Installing Material
using pip
Material can be installed with pip:

pip install mkdocs-material
using choco
If you're on Windows you can use Chocolatey to install Material:


choco install mkdocs-material
This will install all required dependencies like Python and MkDocs.

cloning from GitHub
Material can also be used without a system-wide installation by cloning the repository into a subfolder of your project's root directory:


git clone https://github.com/squidfunk/mkdocs-material.git
This is especially useful if you want to extend the theme and override some parts of the theme. The theme will reside in the folder mkdocs-material/material.

Troubleshooting
Installation on macOS

When you're running the pre-installed version of Python on macOS, pip tries to install packages in a folder for which your user might not have the adequate permissions. There are two possible solutions for this:

Installing in user space (recommended): Provide the --user flag to the install command and pip will install the package in a user-site location. This is the recommended way.

Switching to a homebrewed Python: Upgrade your Python installation to a self-contained solution by installing Python with Homebrew. This should eliminate a lot of problems you may be having with pip.

Error: unrecognized theme 'material'

If you run into this error, the most common reason is that you installed MkDocs through some package manager (e.g. Homebrew or apt-get) and the Material theme through pip, so both packages end up in different locations. MkDocs only checks its install location for themes.

Alternative: Using Docker
If you're familiar with Docker, the official Docker image for Material comes with all dependencies pre-installed and ready-to-use with the latest version published on PyPI, packaged in a very small image. Pull it with:


docker pull squidfunk/mkdocs-material
The mkdocs executable is provided as an entrypoint, serve is the default command. Start the development server in your project root with:


docker run --rm -it -p 8000:8000 -v `pwd`:/docs squidfunk/mkdocs-material
Usage
In order to enable the theme just add one of the following lines to your project's mkdocs.yml. If you installed Material using pip:


theme:
  name: 'material'
If you cloned Material from GitHub:


theme:
  name: null
  custom_dir: 'mkdocs-material/material'
MkDocs includes a development server, so you can review your changes as you go. The development server can be started with the following command:


mkdocs serve
Now you can point your browser to http://localhost:8000 and the Material theme should be visible. From here on, you can start writing your documentation, or read on and customize the theme.

Configuration
Color palette
A default hue is defined for every primary and accent color on Google's Material Design color palette, which makes it very easy to change the overall look of the theme. Just set the primary and accent colors using the following variables:


theme:
  palette:
    primary: 'indigo'
    accent: 'indigo'
Color names are case-insensitive, but must match the names of the Material Design color palette. Valid values are: red, pink, purple, deep purple, indigo, blue, light blue, cyan, teal, green, light green, lime, yellow, amber, orange, deep orange, brown, grey, blue grey and white. The last four colors can only be used as a primary color.

If the color is set via this configuration, an additional CSS file that defines the color palette is automatically included. If you want to keep things lean, clone the repository and recompile the theme with your custom colors set. See the guide on customization for more information.

Primary colors
Default: indigo

Click on a tile to change the primary color of the theme:

Red Pink Purple Deep Purple Indigo Blue Light Blue Cyan Teal Green Light Green Lime Yellow Amber Orange Deep Orange Brown Grey Blue Grey White

Accent colors
Default: indigo

Click on a tile to change the accent color of the theme:

Red Pink Purple Deep Purple Indigo Blue Light Blue Cyan Teal Green Light Green Lime Yellow Amber Orange Deep Orange

Font family
Default: Roboto and Roboto Mono

By default the Roboto font family is included with the theme, specifically the regular sans-serif type for text and the monospaced type for code. Both fonts are loaded from Google Fonts and can be changed to other fonts, like for example the Ubuntu font family:


theme:
  font:
    text: 'Ubuntu'
    code: 'Ubuntu Mono'
The text font will be loaded in weights 400 and 700, the monospaced font in regular weight. If you want to load fonts from other destinations or don't want to use the Google Fonts loading magic, just set font to false:


theme:
  font: false
Logo
Default icon: school

Your logo should have rectangular shape with a minimum resolution of 128x128, leave some room towards the edges and be composed of high contrast areas on a transparent ground, as it will be placed on the colored header bar and drawer. Simply create the folder docs/images, add your logo and embed it with:


theme:
  logo: 'images/logo.svg'
Additionally, the default icon can be changed by setting an arbitrary ligature (or Unicode code point) from the Material Design icon font, e.g.


theme:
  logo:
    icon: 'cloud'
Language
Localization
Default: en

Material for MkDocs supports internationalization (i18n) and provides translations for all template variables and labels in English en, French fr, German de, Spanish es, Italian it, Danish da, Portugese pt, Polish pl, Norwegian no, Dutch nl, Swedish sv, Korean kr, Russian ru, Japanese ja, Chinese (Simplified) zh and Chinese (Traditional) zh-Hant. Specify the language with:


theme:
  language: 'en'
If the language is not specified, Material falls back to English. To create a translation for another language, copy the localization file of an existing language, name the new file using the 2-letter language code and adjust all translations:


cp partials/language/en.html partials/language/jp.html
Feel free to contribute your localization to Material for MkDocs by opening a Pull Request.

Site search
Default: en

Site search is implemented using lunr.js, which includes stemmers for the English language by default, while stemmers for other languages are included with lunr-languages, both of which are integrated with this theme. Support for other languages and even multilingual search can be activated in your project's mkdocs.yml:


extra:
  search:
    language: 'en, de, ru'
All defined languages are used only for stemming. This will automatically load the stemmers for the specified languages and set them up with site search.

At the time of writing, the following languages are supported: English en, French fr, German de, Spanish es, Italian it, Dutch du, Danish da, Portguese pt, Finnish fi, Romanian ro, Hungarian hu, Russian ru, Norwegian no, Swedish sv, Japanese jp and Turkish tr.

Search language support for Chinese

lunr-languages currently doesn't include a stemmer for Chinese or other Asian languages, but some users reported the Japanese stemmer to work quite well for those cases.

Only specify the languages you really need

Be aware that including support for other languages increases the general JavaScript payload by around 20kb (without gzip) and by another 15-30kb per language.

The separator for tokenization can be customized which makes it possible to index parts of words that are separated by - or .:


extra:
  search:
    tokenizer: '[\s\-\.]+'
Favicon
Default: assets/images/favicon.png

The default favicon can be changed by setting the favicon variable to an .ico or image file:


theme:
  favicon: 'assets/images/favicon.ico'
Features
Tabs
Default: false

Material supports another layer on top of the main navigation for larger screens in the form of tabs. This is especially useful for larger documentation projects with only few top-level sections. Tabs can be enabled by setting the respective feature flag to true:


theme:
  feature:
    tabs: true
Customization
Adding a source repository
To include a link to the repository of your project within your documentation, set the following variables via your project's mkdocs.yml:


repo_name: 'squidfunk/mkdocs-material'
repo_url: 'https://github.com/squidfunk/mkdocs-material'
The name of the repository will be rendered next to the search bar on big screens and as part of the main navigation drawer on smaller screen sizes. Furthermore, if repo_url points to a GitHub, BitBucket or GitLab repository, the respective service logo will be shown next to the name of the repository. Additionally, for GitHub, the number of stars and forks is shown.

If the repository is hosted in a private environment, the service logo can be set explicitly by setting extra.repo_icon to github, gitlab or bitbucket.

Why is there an edit button at the top of every article?

If the repo_url is set to a GitHub or BitBucket repository, and the repo_name is set to GitHub or BitBucket (implied by default), an edit button will appear at the top of every article. This is the automatic behavior that MkDocs implements. See the MkDocs documentation on more guidance regarding the edit_uri attribute, which defines whether the edit button is shown or not.

Adding social links
Social accounts can be linked in the footer of the documentation using the automatically included FontAwesome webfont. The type must denote the name of the social service, e.g. github, twitter or linkedin and the link must contain the URL you want to link to:


extra:
  social:
    - type: 'github'
      link: 'https://github.com/squidfunk'
    - type: 'twitter'
      link: 'https://twitter.com/squidfunk'
    - type: 'linkedin'
      link: 'https://linkedin.com/in/squidfunk'
The links are generated in order and the type of the links must match the name of the FontAwesome glyph. The fa is automatically added, so github will result in fa fa-github.

More advanced customization
If you want to change the general appearance of the Material theme, see this article for more information on advanced customization.

Integrations
Google Analytics
MkDocs makes it easy to integrate site tracking with Google Analytics. Besides basic tracking, clicks on all outgoing links can be tracked as well as how site search is used. Tracking can be activated in your project's mkdocs.yml:

``` yaml
google_analytics:
  - 'UA-XXXXXXXX-X'
  - 'auto'
```

---

## Disqus

Material for MkDocs is integrated with Disqus, so if you want to add a comments section to your documentation set the shortname of your Disqus project in your `mkdocs.yml`:

extra:
  disqus: 'mkdocs-material'

The comments section is inserted on every page, except the index page. Additionally, a new entry at the bottom of the table of contents is generated that is linking to the comments section. The necessary JavaScript is automatically included.

Requirements

site_url value must be set in mkdocs.yml for the Disqus integration to load properly.

---

## Extensions

MkDocs supports several Markdown extensions. The following extensions are not enabled by default (see the link for which are enabled by default) but highly recommended, so they should be switched on at all times:

``` yaml
markdown_extensions:
  - admonition
  - codehilite:
      guess_lang: false
  - toc:
      permalink: true
```

For more information, see the following list of extensions supported by the Material theme including more information regarding installation and usage:

- `Admonition`
- `Codehilite`
- `Footnotes`
- `Metadata`
- `Permalinks`
- `PyMdown Extensions`

---

## Full example

Below is a full example configuration for a mkdocs.yml:

``` yaml
# Project information
site_name: 'Material for MkDocs'
site_description: 'A Material Design theme for MkDocs'
site_author: 'Martin Donath'
site_url: 'https://squidfunk.github.io/mkdocs-material/'

# Repository
repo_name: 'squidfunk/mkdocs-material'
repo_url: 'https://github.com/squidfunk/mkdocs-material'

# Copyright
copyright: 'Copyright &copy; 2016 - 2017 Martin Donath'

# Configuration
theme:
  name: 'material'
  language: 'en'
  palette:
    primary: 'indigo'
    accent: 'indigo'
  font:
    text: 'Roboto'
    code: 'Roboto Mono'

# Customization
extra:
  social:
    - type: 'github'
      link: 'https://github.com/squidfunk'
    - type: 'twitter'
      link: 'https://twitter.com/squidfunk'
    - type: 'linkedin'
      link: 'https://linkedin.com/in/squidfunk'

# Google Analytics
google_analytics:
  - 'UA-XXXXXXXX-X'
  - 'auto'

# Extensions
markdown_extensions:
  - admonition
  - codehilite:
      guess_lang: false
  - toc:
      permalink: true
```
