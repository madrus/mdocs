# SSH on Sierra

These are short notes on how you can set up an SSH connection for GitLab (or any other secure server).

```bash
# check if you already have an ssh key
cat ~/.ssh/id_rsa.pub

# if not, generate a new key
ssh-keygen -t rsa -C "your.email@yourprovider.com" -b 4096

# copy the new key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
```

Go to [GitLab](https://gitlab.com/) and add your new key as explained in their help documentation.

Test your SSH configuration:

```bash
# test the key
ssh -T git@gitlab.com

# debug the connection
ssh -Tv git@gitlab.com
```

When using SSH on my Mac with High Sierra, I noticed that I am required to enter my SSH password every time.
This is a known issue on Sierra. I have found a good solution to it in [this article by Rob Allen](https://akrabat.com/ssh-keys-in-macos-sierra/). Here are the steps I have taken based on his advice:

```bash
# add your key to id_rsa
ssh-add -K ~/.ssh/id_rsa

# make sure you see the saved key
ssh-add -l
```

Now you can check you don't need to enter your password by running `git status` on any GitLab repo.

Update the SSH config by editing `~/.ssh/config` and adding:

```none
Host *
   AddKeysToAgent yes
   UseKeychain yes
```

After reboot of your PC, you should still be able to use SSH without having to type in your password.

---
