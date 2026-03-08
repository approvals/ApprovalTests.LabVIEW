#! /usr/bin/env bash

echo "Installing VIPM"

apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
mkdir -p /usr/local/jki/vipm /etc/jki \
    && touch /usr/local/jki/vipm/Settings.ini /etc/jki/jki.conf
wget -O /tmp/vipm.deb \
    https://packages.jki.net/vipm/preview/vipm_latest_preview_amd64.deb \
    && dpkg -i /tmp/vipm.deb \
    && rm /tmp/vipm.deb
vipm activate --serial-number "${VIPM_SERIAL_NUMBER}" --name "${VIPM_FULL_NAME}" --email "${VIPM_EMAIL}"
vipm about
vipm_lv_version="${VIPM_LV_VERSION:-2026}"
vipm package-list-refresh
apt-get update && apt-get install -y nmap
nmap -p 3363 127.0.0.1
vipm install --labview-version ${vipm_lv_version} approvals-dev.vipc