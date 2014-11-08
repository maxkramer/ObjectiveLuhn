#!/bin/sh
set -e

gem uninstall cocoapods
gem install cocoapods
pod setup
brew update
brew unlink xctool
brew install xctool
