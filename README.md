## Prerequisites

* [Zsh](https://www.zsh.org/)
* [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
* [Pure](https://github.com/sindresorhus/pure)

## Provisioning New System

Define the `config` alias to in current shell scope

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 
```

Clone this repository into a bare repository

```sh
git clone --bare git@github.com:alexwaibel/cfg.git $HOME/.cfg
```

Checkout the content from the bare repo

```sh
config checkout
```

Set the `showUntrackedFiles` flag to `no` for the local config repository

```sh
config config --local status.showUntrackedFiles no
```

## Adding and Updating Config Files

You can use the `config` alias like you would `git` to add or update files in the repository

```sh
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```

## Troubleshooting

The `config checkout` may fail with an error like the following

```sh
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This means you have a file in `$HOME` that git would override. Back up the file and remove it then try again. You can create a config file backup with the following

```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
