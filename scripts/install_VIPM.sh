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
LV_YEAR="2026"
rm -f "/root/natinst/.config/LabVIEW-${LV_YEAR}/"{labviewprofull.conf,labview.conf,labview64.conf}
mkdir -p /root/natinst/.config/LabVIEW-${LV_YEAR} && \
    echo "server.tcp.enabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.tcp.enabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.tcp.enabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

        echo "server.tcp.port=3363" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.tcp.port=3363" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.tcp.port=3363" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

        echo "server.tcp.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.tcp.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.tcp.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

        echo "server.vi.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.vi.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.vi.access=+*" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

 echo "server.vi.propertiesEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.vi.porpertiesEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.vi.propertiesEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

     echo "server.vi.callsEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "server.vi.callsEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "server.vi.callsEnabled=True" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

echo "unattended=False" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labviewprofull.conf && \
    echo "unattended=False" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview.conf && \
    echo "unattended=False" >> /root/natinst/.config/LabVIEW-${LV_YEAR}/labview64.conf

echo 'cat "/root/natinst/.config/LabVIEW-${LV_YEAR}/"{labviewprofull.conf,labview.conf,labview64.conf}'
cat "/root/natinst/.config/LabVIEW-${LV_YEAR}/"{labviewprofull.conf,labview.conf,labview64.conf}
apt-get update && apt-get install -y nmap
nmap -p 3363 127.0.0.1
echo "iptables -L"
iptables -L
echo "netstat -tuln"
netstat -tuln
vipm install --labview-version ${vipm_lv_version} approvals-dev.vipc