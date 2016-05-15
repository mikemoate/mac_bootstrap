#
# Author:: Mike Moate (<chef@mikemoate.co.uk>)
# Cookbook Name:: mac_bootstrap
# Recipe:: default
#

# Install Homebrew package manager
include_recipe "homebrew::default"

# Install Homebrew Cask tap
include_recipe "homebrew::cask"

# Install Homebrew Cask Versions tap
homebrew_tap 'caskroom/versions'

#Install formulae/packages (list is defined in attributes)
include_recipe "homebrew::install_formulas"

#Install Casks (list is defined in attributes)
include_recipe "homebrew::install_casks"
