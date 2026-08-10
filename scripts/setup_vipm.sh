#! /usr/bin/env bash

# for use in CI to activate VIPM.

echo "Starting LabVIEW"
/usr/local/natinst/LabVIEW-${LABVIEW_VERSION_YEAR}-64/labview --headless &
echo "Activating VIPM"
vipm activate --serial-number "${{ secrets.VIPM_SERIAL_NUMBER }}" --name "${{ secrets.VIPM_FULL_NAME }}" --email "${{ secrets.VIPM_EMAIL}}" >/dev/null
vipm about
vipm refresh # --show-progress # --verbose >/dev/null