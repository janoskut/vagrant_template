# Vagrant Templates

## Vagrant Basics

```
# Startup
vagrant up

# Connect
vagrant ssh

# Destroy machine without confirmation prompt
vagrant destroy -f

# Provision
vagrant reload --provision

# Stop
vagrant halt
```

## Features

- GIT
- Python (2/3), Pip, Tox
- VIM

## Customizations

\*.sh shell scripts and \*.vagrant vagrant-files, residing next to the
*Vagrantfile*, will be included automatically during provisioning.

This allows to add user customizations as shell scripts, but also to
adjust the vagrant and provider settings.

Vagrant-files will be processed first, followed by the script files.
All files are executed in their alphabetical order.

### Agnoster theme

The [Agnoster theme](https://github.com/agnoster/agnoster-zsh-theme) requires a [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts), e.g. [Source Code Pro](https://github.com/powerline/fonts/tree/master/SourceCodePro).
