#!/bin/sh

cd Example\ Project
xctool test -workspace Luhn\ Algorithm\ \(Mod\ 10\).xcworkspace -scheme Luhn\ Algorithm\ \(Mod\ 10\) -sdk iphonesimulator -configuration Release -freshInstall -freshSimulator
