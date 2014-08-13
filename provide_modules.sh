#!/bin/bash

# update package list
echo "update package lists..."                                            
aptitude update

# check whether git-core is installed (required by r10k for git sources)
# if not install git-core
echo "Make sure git is available..."
[[ $(dpkg -s git &> /dev/null) ]] || (apt-get  install git -y)

# check whether r10k gem is installed, if not install gem 
echo "Make sure r10k is available..."
[[ "$(gem query -i -n r10k)" == "true" ]] || gem install --no-rdoc --no-ri r10k

# execute r10k and populate module/ folder
echo "Fetching puppet modules (r10k puppetfile install)..."
echo "*** Monitor r10k output closely! We ignore any errors returned by r10k in\
  order to work around VirtualBox problem with symlinks on VboxFS! ***"
cd /vagrant && r10k -v 1 puppetfile install || true
echo "*** Monitor r10k output closely! We ignore any errors returned by r10k in\
  order to work around VirtualBox problem with symlinks on VboxFS! ***"
