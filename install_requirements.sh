#!/bin/sh
set -e

# Update system
sudo apt update
sudo apt -y upgrade

# Install сommon packages from repos
sudo apt install -y \
    git \
    vim \
    ssh \
    fzf \
    nano \
    micro \
    man \
    less \
    rlwrap \
    net-tools \
    openvpn

# Install programming packages from repos
sudo apt install -y \
    python3 \
    python3-pip

# Install reverse packages from repos
sudo apt install -y \
    gdb-multiarch \
    gdbserver \
    edb-debugger \
    strace \
    ltrace \
    checksec \
    qemu-system \
    upx-ucl

# Install pwn packages from repos
sudo apt install -y \
    ropper

# Install web packages from repos
sudo apt install -y \
    wget \
    curl \
    dirsearch \
    inetutils-ping \
    netcat-traditional \
    sqlmap \
    nikto \
    nmap

# Install forensic packages from repos
sudo apt install -y \
    binwalk \
    wordlists \
    exiftool

# Install crypto packages from repos
sudo apt install -y \
    hashcat \
    fcrackzip \
    john

# Install stego packages from repos
sudo apt install -y \
    stegseek

# Install [Cheat](https://github.com/cheat/cheat/blob/master/INSTALLING.md)
cd /tmp \
    && wget https://github.com/cheat/cheat/releases/download/4.4.0/cheat-linux-amd64.gz \
    && gunzip cheat-linux-amd64.gz \
    && sudo chmod +x cheat-linux-amd64 \
    && sudo mv cheat-linux-amd64 /usr/local/bin/cheat

# Install [GEF](https://github.com/hugsy/gef)
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Install python packages
pip install --root-user-action=ignore --break-system-packages --upgrade pip setuptools
pip --no-cache-dir install --root-user-action=ignore --ignore-requires-python --break-system-packages -r /tmp/requirements.txt

# Install fzf keybindings
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> "$HOME/.zshrc"

# Install CTRL+R command search shortcut
sudo git clone https://github.com/joshskidmore/zsh-fzf-history-search /usr/share/zsh-fzf-history-search
echo "source /usr/share/zsh-fzf-history-search/zsh-fzf-history-search.zsh" >> "$HOME/.zshrc"

# Clean cache
sudo rm -rf /var/cache/apt/archives /var/lib/apt/lists
