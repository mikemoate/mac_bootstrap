#
# Author:: Mike Moate (<chef@mikemoate.co.uk>)
# Cookbook Name:: mac_bootstrap
# Attributes:: default
#

default['homebrew']['formulas'] = [
  'git',
  'packer',
  'mtr',
  'bash-completion',
  'docker-completion',
  'docker-compose-completion',
  'awscli'
]

default['homebrew']['casks'] = [
  'beyond-compare',
  'sublime-text',
  'royal-tsx',
  'java',
  'flash-player',
  'the-unarchiver',
  'hipchat',
  'wireshark',
  'chefdk',
  'vagrant',
  'virtualbox',
  'google-drive',
  'skype',
  'sourcetree',
  'spotify',
  'vlc',
  'vlc-webplugin',
  'google-chrome',
  'docker'
]
