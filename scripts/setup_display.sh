#! /usr/bin/env bash
# IMPORTANT
# you need to source this script at the beginning on any step that uses VIPM or LabVIEW and expects a GUI - Note: some VIPM steps you can get away without it, but easy enough to always source it.

# This sets up xvfb - a virtual frame buffer. This mimics a display and deals with the fact that LabVIEW and VIPM require a display to run properly.
# Call this in each GitHub Action step that calls into LV or VIPM, as xvfb can shut down between steps based on the way GitHub handles the calls.

# This is a reusable script to set up the display for VIPM and LabVIEW.
# see https://docs.vipm.io/preview/cli/docker/#display-and-labview-setup-linux-containers

TARGET_DISPLAY=:99
export DISPLAY="$TARGET_DISPLAY"
# Start Xvfb if it is not already running. If it is already running, assume it is correctly configured for this container and do nothing.
if ! pgrep -x Xvfb > /dev/null; then
   Xvfb "$TARGET_DISPLAY" -screen 0 1280x720x24 -ac +extension GLX +render -noreset \
   > /tmp/xvfb.log 2>&1 &
          fi
          # Writing this marker file is critical and if if it is not present, the LabVIEW Runtime Engine (required by vipm) may not start properly.
          mkdir -p /tmp/natinst && echo "1" > /tmp/natinst/LVContainer.txt
          # This container has no browser/D-Bus session. Some package post-install actions try to open a URL
          # in the default browser, which can hang for minutes waiting on xdg-open/D-Bus before giving up.
          # Start Xvfb before the LabVIEW Runtime Engine initializes, which happens on the first `vipm` command.
          echo "$(pgrep -x Xvfb > /dev/null && echo "Xvfb running (DISPLAY=$TARGET_DISPLAY)" || echo "WARNING: Xvfb is required by vipm, but failed to start; DISPLAY=$DISPLAY may not work. Check /tmp/xvfb.log for details.")"