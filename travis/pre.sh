#!/bin/sh
set -e # exit when a non-zero status is received

echo "Reinstalling Cocoapods"

gem uninstall cocoapods -x # Uninstall cocoapods if it exists
gem install cocoapods  # Install cocoapods

echo "Setting up Cocoapods"

pod setup > /dev/null # Clone local copy of the cocoapods repo

echo "Updating Homebrew"

brew update # Update homebrew

echo "Removing XCTool"

brew unlink xctool # Uninstall XCTool

HAS_XCTOOL = brew search | grep 'xctool' -c
if [ "$HAS_XCTOOL" > 0 ]; then
	echo "Brew has a tap for XCTool"
	echo "Installing XCTool"
	brew install xctool # Install XCTool
else
	echo "Brew does not have a tap for XCTool"
fi
