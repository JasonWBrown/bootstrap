#!/bin/bash
# TODO
# install display link drivers
# install xcode
# install slack
# install zoom
# install rectangle
# install iterm2
# show bluetooth in menu bar

# install chrome
if [ -d "/Applications/Google Chrome.app" ] 
then
  echo "Directory /Applications/Google Chrome.app exists. Not installing Chrome" 
else
  echo "Directory /Applications/Google Chrome.app does not exists."
  echo "Attempting to install Chrome"
  temp=$TMPDIR$(uuidgen)
  mkdir -p $temp/mount
  curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > $temp/1.dmg
  yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
  cp -r $temp/mount/*.app /Applications
  hdiutil detach $temp/mount
  rm -r $temp
fi

# set up git configs
cat ~/.gitconfig | grep name
if [ $? -eq 0 ]
then
  echo "git global user.name already set" 
else
  echo "setting git global user.name" 
  git config --global user.name "Jason W Brown"
fi
cat ~/.gitconfig | grep email
if [ $? -eq 0 ]
then
  echo "git global user.email already set" 
else
  echo "setting git global user.email" 
  git config --global user.email jasonwbrown23@gmail.com
fi

# install OH MY ZSH
which zsh
if [ $? -eq 0 ]
then
  echo "zsh already installed. Not installing zsh" 
else
  echo "insalling zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# install  Homebrew
which brew 
if [ $? -eq 0 ]
then
  echo "brew already installed. Not installing brew" 
else
  echo "insalling brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" & \
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jasonbrown/.zprofile & \
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi



# # install go
# brew install go