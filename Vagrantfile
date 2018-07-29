# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/home/vagrant/sync"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  
  ############################################################
  ### General packages
  config.vm.provision "shell", inline: "apt-get -y update && apt-get -y upgrade"
  config.vm.provision "shell", inline:
    "apt-get -y install python python3 python-doc python3-doc python-pip python3-pip"
  config.vm.provision :shell, inline: "apt-get -y install git"
  config.vm.provision "file", source: "~/.gitconfig", destination: "/home/vagrant/.gitconfig"
  config.vm.provision :shell, inline: "apt-get -y install vim"
  config.vm.provision "file", source: "~/.vimrc", destination: "/home/vagrant/.vimrc"
  ############################################################


  ############################################################
  # Install EXA
  config.vm.provision :shell, inline:
    "apt-get -y install cmake cargo zlib1g-dev"
  config.vm.provision :shell, inline: <<-SHELL
    COMMAND=exa
    echo "Installing $COMMAND..."
    if command -v $COMMAND &> /dev/null; then
      echo "  => $COMMAND is already installed."
    else
      echo "    > Downloading and installing..."
      curl https://sh.rustup.rs -sSf | bash -s -- -y
      echo "    > cloning exa repository.."
      git clone https://github.com/ogham/exa.git && cd exa
      echo "    > make install"
      make install
      echo "    > remove exa directory"
      cd .. && rm -rf exa
      echo "  => Done."
    fi
  SHELL
  ############################################################


  ############################################################
  # Install ZSH
  config.vm.provision :shell, inline: "apt-get -y install zsh"
  # Clone Oh My Zsh from the git repo
  config.vm.provision :shell, privileged: false, inline: <<-SHELL
    echo "Installing OH-MY-ZSH..."
    if [[ ! -d ~/.oh-my-zsh ]]; then
      git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
      echo "  => Done."
    else
      echo "  => OH-MY-ZSH is already installed."
    fi
  SHELL
  # Set ZSH as default shell
  config.vm.provision :shell, inline: "chsh -s $(which zsh) vagrant"
  # Configure .zshrc
  config.vm.provision :shell, privileged: false, inline: <<-SHELL
    if [[ ! -f ~/.zshrc ]]; then
      echo "Initializing ~/.zshrc..."
      cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
      sed -i "s/^\\(ZSH_THEME\\s*=\\s*\\).*\\$/\\1agnoster/" ~/.zshrc
      cat <<EOT >> ~/.zshrc

# Use a different file for aliases
if [ -f "${HOME}/.zshrc.local" ]; then
  source "${HOME}/.zshrc.local"
fi
EOT
      cat <<EOT > ~/.zshrc.local
# Exa alias mapping
alias ls='exa'
alias la='exa -la'

# Switch to vagrant synced working directory
cd ~/sync/
EOT
      echo "  => Done."
    else
      echo "  => ~/zshrc is already there."
    fi
  SHELL
  ############################################################


  # Configure Vagrant to run this shell script when setting up our machine
  # config.vm.provision :shell, path: "bootstrap.sh"
end
