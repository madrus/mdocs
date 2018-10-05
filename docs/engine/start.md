# Getting Started

## Installing prerequisites

If you want to participate in development of this project, you need to carry out a couple of simple steps described below.

Clone the repository to your local machine.

Have the latest version of __Python 3.6__ installed, which can be downloaded from [here](https://www.python.org/downloads/).

Add the following two paths to your Windows `Path` user environment variable:

- `C:\Users\YourUserName\AppData\Local\Programs\Python\Python36-32`
- `C:\Users\YourUserName\AppData\Local\Programs\Python\Python36-32\Scripts`

Now, run any shell script (`cmd`, `git-bash` or `PowerShell`) and install/upgrade __mkdocs__ and related packages:

``` bash
pip install -U mkdocs mkdocs-material fontawesome-markdown pymdown-extensions
```

---

## Project Layout

``` yaml
mkdocs.yml    # The configuration file
docs/
    index.md  # The documentation homepage
    ...       # Other markdown pages, and other files
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

Then open your browser and navigate to [http://localhost:8000](http://localhost:8000/) or whatever port number you have configured.

---

## Useful Commands

- `mkdocs new [dir-name]` - Create a new project.
- `mkdocs serve` - Start the live-reloading docs server.
- `mkdocs build` - Build the documentation site.
- `mkdocs help` - Print this help message.

---

## FontAwesome

!!! WARNING "Up to Python 3.4?"

    Python versions above 3.4 are probably not supported yet. See the [setup.py](https://github.com/bmcorser/fontawesome-markdown/blob/master/setup.py) file for the `classifiers` section, it mentions Python versions up to 3.4.

!!! NOTE "Does not work on my website (yet)"

    FontAwesome Markdown does not work on this documentation website. I am trying to figure out why but so far no success.

[FontAwesome](https://fortawesome.github.io) gives you scalable vector icons that can instantly be customized -- size, color, drop shadow, and anything that can be done with the power of CSS. For more inpiration see these [examples](http://fontawesome.io/examples/).

[FontAwesome Markdown](http://bmcorser.github.io/fontawesome-markdown/) is a Markdown extension that looks for things like `:fa-coffee:` (:fa-coffee:) or `:fa-beer:` (:fa-beer:) and replaces them with the FontAwesome icon markup.

### Examples

This example uses the `fontawesome_markdown` extension:

``` none
What would you drink, :fa-coffee: or :fa-beer:?
```

What would you drink, :fa-coffee: or :fa-beer:?

For this example, you must install the `fontawesome_markdown` extension with `pip`. Right now version `0.2.5` is the latest but it doesn't work out of the box. Instead, you have to install the latest version from the github repository. You can do that with the command below:

``` bash
pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
```

You may need to include __-U__ in the above command if you already have this extension installed.

Then add the below to your `mkdocs.yml` file.

``` none
markdown_extensions:
  - fontawesome_markdown
```

---

## Deployment to GitHub Pages

### Direct Deployment

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

This will push the __master__  branch to the remote __gh-pages__. After that, the project website is available at `your-github-login.github.io/mdocs`.

### Travis CI Deployment

Go to your GitHub account and create a new __Personal access token__ in your Developer settings. Copy the hash string.

!!! WARNING "Keep well the hash string!"

    You will see it only once when you create it.

In the Travis CI settings of your project add a new __GITHUB_TOKEN__ environment variable with the value of the hash string your have just copied. Don't forget to turn in __ON__ and to __ADD__.

Configure the `.travis.yml` file. You may start with something like this:

``` yaml
sudo: false
language: python
python: '3.6'
install:
- pip install -U pip
- pip install -r requirements.txt
- pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
script:
- git config credential.helper "store --file=.git/credentials"
- echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
- mkdocs build --verbose --clean --strict
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

---

## References

Here are the most important links that have inspired me:

- Latest official MkDocs [documentation](http://mkdocs.readthedocs.io/en/latest/)
- MkDocs [User Guide](http://www.mkdocs.org/user-guide/writing-your-docs/)

---
