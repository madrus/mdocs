# Some technical details

### Project layout

```yml
mkdocs.yml    # The configuration file.
docs/
    index.md  # The documentation homepage.
    ...       # Other markdown pages, images and other files.
```

---

### Useful Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

---

### Font Awesome

[Font Awesome](https://fortawesome.github.io) gives you scalable vector icons that can instantly be customized -- size, color, drop shadow, and anything that can be done with the power of CSS. For more inpiration see these [examples](http://fontawesome.io/examples/).

[Font Awesome Markdown](http://bmcorser.github.io/fontawesome-markdown/) is a Markdown extension that looks for things like `:fa-coffee:` (:fa-coffee:) or `:fa-refresh:` (:fa-refresh:) and replaces them with the Font Awesome icon markup.

#### Examples

This examples use the fontawesome_markdown extension:

```none
What would you drink, :fa-coffee: or :fa-beer:?
```

What would you drink, :fa-coffee: or :fa-beer:?

For this example, you must install the `fontawesome_markdown` extension with `pip`. Right now version `0.2.5` is the latest but it doesn't work out of the box. Instead, you have to install the latest version from the github repository. You can do that with the command below:

```bash
pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
```

You may need to include __-U__ in the above command if you already have this extension installed.

Then add the below to your `mkdocs.yml` file.

```none
markdown_extensions:
  - fontawesome_markdown
```

---

### Deployment to GitHub Pages directly

The first step you'll need to do is simply make sure you have a __gh-pages__ branch that exists, if it doesn't:

```bash
git checkout -b gh-pages
git rm -rf .
git push --set-upstream origin gh-pages
```

Then run this command:

```bash
mkdocs gh-deploy
```

This will push the __master__  branch to the remote __gh-pages__. After that, you can view your website here:

[http://your-github-name.github.io/mkdocs-repo-name](http://your-github-name.github.io/mkdocs-repo-name)

---

### Deployment to GitHub pages via Travis CI

Go to your GitHub account and create a new __Personal access token__ in your Developer settings. Copy the hash string.

!!! warning "Keep well the hash string!"
    You will see it only once when you create it.

In the Travis CI settings of your project add a new __GH_TOKEN__ environment variable with the value of the hash string your have just copied. Don't forget to turn in __ON__ and to __ADD__.

Configure the `.travis.yml` file. You may start with something like this:

```ruby
sudo: false
language: python
python: '2.7'
install:
- pip install --upgrade pip
- pip install -r requirements.txt
- pip install https://github.com/bmcorser/fontawesome-markdown/archive/master.zip
script:
- git config credential.helper "store --file=.git/credentials"
- echo "https://${GH_TOKEN}:@github.com" > .git/credentials
- mkdocs build
- if [ $TRAVIS_TEST_RESULT == 0 ]; then
    mkdocs gh-deploy --force;
  fi
```

The credentials here are necessary for the Travis agent to be able to connect to your Github repository and perform the necessary actions with it. Note that the credentials are based on the __Personal access token__ you have created. 

Also, I have put deployment inside the __script__ fase instead of __after_success__ as a workaround (see the tip of Chronial on this [Travis issue #758](https://github.com/travis-ci/travis-ci/issues/758)). Otherwise, the batch succeeds with a successful build even if deploy __fails__ after it.

Next, you need to have __travis__ Rubygem installed on your local machine. If not, install it:

```bash
gem install travis
```

Using __travis__, add the encrypted token to `.travis.yml`: 

```bash
travis encrypt GH_TOKEN="the-token-from-github" --add
```

This will add the following block at the end of the file:

```ruby
env:
  global:
  - secure: "lots-of-seemingly-random-characters"
```

Now, when you push your changes to the remote __master__, Travis CI should publish the compiled website to __GitHub Pages__ if the build succeeds.
