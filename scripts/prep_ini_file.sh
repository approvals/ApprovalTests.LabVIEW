#!/usr/bin/env bash
set -euo pipefail

ip=$(cat /etc/hosts | egrep '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' | egrep -v 127.0.[0-9]+.1 | cut -f 1  | uniq | head -n 1)


INI_DIR="/root/natinst/.config/LabVIEW-2026"
INI_FILES=(
    "$INI_DIR/labview.ini"
    "$INI_DIR/labview64.ini"
    "$INI_DIR/labviewprofull.ini"
)

SECTION="LabVIEW"

KEYS=(
    "NIERShowFatalDialog"
    "NIERFatalAutoSend"
    "NIERNonFatalAutoSend"
    "NIERShowNonFatalDialogOnExit"
    "NIERSendDialogClose"
    "autoerr"
    "DWarnDialog"
    "AutoSaveEnabled"
    "AllowMultipleInstances"
    "promoteDWarnInternals"
    "ShowAIVIsInErrorWindow"
    "server.tcp.enabled"
    "server.tcp.access"
    "server.tcp.port"
    "server.vi.access"
    "server.vi.callsEnabled"
    "server.vi.propertiesEnabled"
)

VALUES=(
    "0"
    "True"
    "True"
    "False"
    "True"
    "3"
    "False"
    "False"
    "True"
    "False"
    "True"
    "True"
    '"*, localhost, 127.0.0.1, '"$ip"'"'
    "3363"
    '"*"'
    "True"
    "True"
)

set_ini_value() {
    local file="$1"
    local key="$2"
    local value="$3"

    if grep -q "^${key}" "$file"; then
        sed -i "s|^${key}.*|${key} = ${value}|" "$file"
    else
        sed -i "/^\[${SECTION}\]/a ${key} = ${value}" "$file"
    fi
}

mkdir -p "$INI_DIR"

for ini_file in "${INI_FILES[@]}"; do
    echo "Configuring $ini_file..."

    touch "$ini_file"

    if ! grep -q "^\[${SECTION}\]" "$ini_file"; then
        printf '\n[%s]\n' "$SECTION" >> "$ini_file"
    fi

    for i in "${!KEYS[@]}"; do
        set_ini_value "$ini_file" "${KEYS[$i]}" "${VALUES[$i]}"
    done

    echo "Done: $ini_file"
done
