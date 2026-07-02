#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Run with: sudo $0"
  exit 1
fi

echo "Configuring VIPM permissions for: $SUDO_USER"

# Fix file handle limits
if ! test -f /etc/sysctl.d/vipm-files.conf; then
  echo "fs.file-max = 2000000" > /etc/sysctl.d/vipm-files.conf
fi

# Set ownership
chown $SUDO_USER -R /usr/local/natinst/LabVIEW*
chown $SUDO_USER -R /usr/local/JKI/VIPM 2>/dev/null || true
chown $SUDO_USER -R /etc/JKI 2>/dev/null || true

# Fix tmp permissions
chmod 777 /tmp

echo "Complete! Run 'vipm' as regular user (not sudo)"
