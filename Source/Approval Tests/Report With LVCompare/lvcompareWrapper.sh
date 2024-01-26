#!/bin/bash
# lvcompareWrapper.sh
# ZSS, 19 Aug 2014
# Wrapper to help launch LVCompare as a LabView diff tool
#
# Script cobbled together from the internet, most valuable source
# being http://lavag.org/topic/17934-configuring-git-to-work-with-lvcompare-and-lvmerge/#entry108533
# and thread. Also the git manual topics difftool, diff, and config.

# Get a Windows Absolute path from the git diff-tool style relative path
abspath () {
(
#	echo "1= $1"
	DIR=$(dirname "$1")
	FN=$(basename "$1")
	cd "$DIR"
#	echo "FN=$FN"
	# tr should be doing magical forward-slash to backslash translation
	printf "%s/%s" "$(pwd -W)" "$FN" | tr '/' '\\' | tr ' ' '\ '
)
}

# Path to executable, edit this if needed

lvcompare="/c/Program Files/National Instruments/Shared/LabVIEW Compare/LVCompare.exe"

if [[ ! -f "$lvcompare" ]]
then
	lvcompare="/c/Program Files (x86)/National Instruments/Shared/LabVIEW Compare/LVCompare.exe"
fi



# Convert each git-relative path to an absolute Windows-style path
localOrig="$2"
remoteOrig="$1"
 
 : '
if [[ "$(basename "$localOrig") == "$(basename "$remoteOrig") ]]
then
	remoteNewPath="$(dirname "$remoteOrig")""/""remote""$(basename "$remoteOrig")"
	mv "$remoteOrig" "$remoteNewPath"
	remoteOrig="$remoteNewPath"
fi
'

localWin=$(abspath "$localOrig")
remoteWin=$(abspath "$remoteOrig")

#
echo Launching "$lvcompare"
echo local "$localWin"
echo remote "$remoteWin"
exec "$lvcompare" "$localWin" "$remoteWin"
