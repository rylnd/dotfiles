# rylnd/dotfiles [![Build Status](https://travis-ci.org/rylnd/dotfiles.png)](https://travis-ci.org/rylnd/dotfiles)
A collection of scripts and commands that I use every day.

## scripts/pair
Configures the git author/email for multiple developers when pair programming

#### Setup (Recommended)
First, pull down the repo:
```bash
git clone git@github.com:rylnd/dotfiles
```

Then, to install (or to get the latest version):
```bash
cd dotfiles
setup/pair upgrade
```

#### Setup (Automatic)
For a one-off install, simply paste the following into your command line:
```bash
curl -sL https://raw.github.com/rylnd/dotfiles/master/setup/pair | bash -s install
```

#### Setup (Manual)
Define the pair script in your shell by adding the following to a shell startup file (`~/.bash_profile`, `~/.bashrc`, etc.):
```bash
# define the pair function
source "<PATH_TO_PAIR_SCRIPT>"
```

If you want to persist the pair between sessions, without having to call `pair`, you can do something like
```bash
# quietly set the previous pairing state
pair -q
```
in the same file as above.

A helpful alias if you don't like the spacebar:
```bash
alias unpair='pair -u'
```

#### Usage:

```bash
$ pair rylnd mathias   # Sets the author to 'Matt Gauger and Ryland Herrick'
$ pair -u              # Unsets the author/email
```

You can also set more than two users:

```bash
$ pair bigtiger devn mathias   # Sets the author to 'Jim Remsik, Devin Walters, and Matt Gauger'
```

And check your current configuration:

```bash
$ pair                  # Lists the current author/email
```

## dotfiles
The dotfiles that I actually use.

#### Setup
Assuming you've cloned the repo:
```bash
cd path_to_repo
chmod 755 setup/dotfiles
setup/dotfiles
```
will symlink the dotfiles to your home directory (but won't overwrite existing files).


## setup/
Scripts to aid in the install/update process

## shpec/
[shpec](https://github.com/shpec/shpec) tests to document the behavior of these scripts.

# Contributing
Pull requests are always welcome.
