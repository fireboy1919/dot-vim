apt-get update
apt-get install -y -q vim htop git build-essential autotools-dev automake pkg-config
apt-get install -y -q htop 
# Add user with name "theodoer" and password "elvish_word_for_friend"
useradd -d /home/rusty -p JXFBFm7Klstpw -m -s /bin/zsh rusty

# Make directory where repositories are cloned
mkdir /opt/src || echo 'Sources directory exists already'

# Make directory where our command-line tools will installed
mkdir /opt/local || echo 'Local directory exists already'

## Install tmux ##

# Clone tmux code repository
git clone git://git.code.sf.net/p/tmux/tmux-code /opt/src/tmux-code

# Fetch latest modifications in case the script should be re-run
cd /opt/src/tmux-code && git fetch --all

# Checkout latest tmux tag
cd /opt/src/tmux-code && git checkout tags/1.9

# Install tmux dependencies
apt-get install -y -q libncurses5-dev libevent-dev

# Configure tmux installation
cd /opt/src/tmux-code && apt-get install -y -q  && sh autogen.sh && ./configure --prefix=/opt/local/tmux

# Compile tmux and install its binaries
cd /opt/src/tmux-code && make && make install && ln -s /opt/local/tmux/bin/tmux /usr/bin

## Install oh-my-zsh ##

# Install zsh
apt-get install -y -q zsh

# Clone oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~rusty/.oh-my-zsh

# Create a new zsh configuration from the provided template
cp ~rusty/.oh-my-zsh/templates/zshrc.zsh-template ~rusty/.zshrc

# Set zsh as default shell
chsh -s /bin/zsh rusty

# Install openssh server
apt-get install -y -q openssh-server

# Disables password authentication
sed -i -e 's/^#PasswordAuthentication\syes/PasswordAuthentication no/' /etc/ssh/sshd_config

# pam_loginuid is disabled
sed -i -e 's/^\(session\s\+required\s\+pam_loginuid.so$\)/#\1/' /etc/pam.d/sshd

# Install mosh server
apt-get install -y -q mosh

# Generate UTF-8 locale
locale-gen en_US.UTF-8

# Create missing privilege separation directory
mkdir /var/run/sshd

# Make ssh directory of theodoer user
mkdir ~rusty/.ssh

# Make ssh directory of theodoer user
/usr/bin/sshd -d
