#!/bin/sh
set -e

gem uninstall cocoapods -x
gem install cocoapods
pod setup
brew update
brew unlink xctool
brew install xctool
