#!/bin/sh
set -e

gem update cocoapods -v
brew update
brew unlink xctool
brew install xctool
