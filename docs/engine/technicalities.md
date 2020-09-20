# Technical Information

## Installing prerequisites

if you want to create your own project like this one, you need to have the latest version of __Python 2.7__ installed, which can be downloaded from [here](https://www.python.org/downloads/).

After that, install __mkdocs__ and related packages:

``` bash
pip install -U mkdocs mkdocs-material
pip install -U fontawesome-markdown
pip install -U pygments pymdown-extensions
```

---

## Project Layout

``` yaml
mkdocs.yml    # The configuration file.
docs/
    index.md  # The documentation homepage.
    ...       # Other markdown pages, and other files.
    /images   # Images used in the documents
```

---

## Running the project in DEV

Open the command prompt in the project root directory and type:

``` bash
mkdocs serve
```

Or, if you need to run it on a specific port, e.g. 8080, you can do one of the following:

``` bash
mkdocs serve --dev-addr:8080
mkdocs serve -a :8080
```

Then open your browser and navigate to <http://localhost:8000> or whatever port number you have configured.

### Some Useful Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

---

### Font Awesome

[Font Awesome](https://fortawesome.github.io) gives you scalable vector icons that can instantly be customized -- size, color, drop shadow, and anything that can be done with the power of CSS. For more inpiration see these [examples](http://fontawesome.io/examples/).

[Font Awesome Markdown](http://bmcorser.github.io/fontawesome-markdown/) is a Markdown extension that looks for things like `:fa-coffee:` ( :fa-coffee: ) or `:fa-beer:` ( :fa-beer: ) and replaces them with the Font Awesome icon markup.

#### Examples

This examples use the fontawesome_markdown extension:

```none
What would you drink, :fa-coffee: or :fa-beer: ?
```

What would you drink, :fa-coffee: or :fa-beer: ?

For this example, you must install the `fontawesome_markdown` extension with `pip` or install the latest version directly from the github repository:

``` bash
pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
```

You may need to include __-U__ in the above command if you already have this extension installed.

Then add the below to your `mkdocs.yml` file.

``` yaml
markdown_extensions:
  - fontawesome_markdown
```

In my case, this appeared to be not enough. I had to add the link to the Font Awesome stylesheet inside the `main.html` of my custom theme:

``` html
{% extends "base.html" %}

{% block styles %}
{{ super() }}
...
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
  crossorigin="anonymous">
{% endblock %}
```

---

## Deployment

### Deployment to GitHub Pages directly

To publish the project to __GitHub Pages__ as a subdomain, e.g. `/mdocs` of the main <your-github-login.github.io> website, you need first to create a repository with that name, e.g. `mdocs` and add it to your project as a remote.

Next make sure you have a __gh-pages__ branch that exists. If it doesn't:

``` bash
git checkout -b gh-pages
git rm -rf .
git push --set-upstream origin gh-pages
```

Now, open the command prompt in the root directory (on the `master` branch) and type:

``` bash
mkdocs gh-deploy
```

This will push the __master__  branch to the remote __gh-pages__. After that, the project website is available at <your-github-login.github.io/mdocs>.

### Deployment to GitHub pages via Travis CI

Go to your GitHub account and create a new __Personal access token__ in your Developer settings. Copy the hash string.

!!! warning "Keep well the hash string!"
    You will see it only once when you create it.

In the Travis CI settings of your project add a new __GITHUB_TOKEN__ environment variable with the value of the hash string your have just copied. Don't forget to turn in __ON__ and to __ADD__.

Configure the `.travis.yml` file. You may start with something like this:

``` yaml
sudo: false
language: python
python: '2.7'
install:
- pip install --upgrade pip
- pip install -r requirements.txt
- pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
script:
- git config credential.helper "store --file=.git/credentials"
- echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
- mkdocs build
- if [ $TRAVIS_TEST_RESULT == 0 ]; then
    mkdocs gh-deploy --force;
  fi
```

The credentials here are necessary for the Travis agent to be able to connect to your Github repository and perform the necessary actions with it. Note that the credentials are based on the __Personal access token__ you have created.

Also, I have put deployment inside the __script__ fase instead of __after_success__ as a workaround (see the tip of Chronial on this [Travis issue #758](https://github.com/travis-ci/travis-ci/issues/758)). Otherwise, the batch succeeds with a successful build even if deploy __fails__ after it.

Next, you need to have __travis__ Rubygem installed on your local machine. If not, install it:

``` bash
gem install travis
```

Using __travis__, add the encrypted token to `.travis.yml`:

``` bash
travis encrypt GITHUB_TOKEN="the-token-from-github" --add
```

This will add the following block at the end of the file:

``` yaml
env:
  global:
  - secure: "lots-of-seemingly-random-characters"
```

Now, when you push your changes to the remote __master__, Travis CI should publish the compiled website to __GitHub Pages__ if the build succeeds.
