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
vipm about