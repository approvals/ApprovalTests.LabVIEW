#! /usr/bin/env bash
set -euo pipefail
# This script is for setting up a Linux Container to run LabVIEW, VIPM, G-CLI etc. Call this first, before setup_display.

# Derive LabVIEW version year from the container image tag
          LABVIEW_VERSION_YEAR="${LABVIEW_IMAGE:0:4}" # e.g. "2026" from "2026q1-linux"
          echo "LABVIEW_VERSION_YEAR=${LABVIEW_VERSION_YEAR}" >> "$GITHUB_ENV"
          # LabVIEW Container images put default config in /root home dir, but GitHub Actions sets $HOME to /github/home.
          cp -R /root/natinst /github/home/natinst
          chown -R $(id -u):$(id -g) /github/home/natinst
          # Set ini file entries to prevent crash dialogs.
          # https://forums.ni.com/t5/Continuous-Integration/Preemptively-disable-internal-error-dialog/td-p/4407330
          CONF_DIR="$HOME/natinst/.config/LabVIEW-${LABVIEW_VERSION_YEAR}"
          CONF_FILE="$CONF_DIR/labview.conf"
          mkdir -p "$CONF_DIR"
          touch "$CONF_FILE"
          grep -q '^\[LabVIEW\]' "$CONF_FILE" || printf '\n[LabVIEW]\n' >> "$CONF_FILE"
          # autoerr disables the blocking internal-error dialog; the NIER* keys suppress the
          # crash reporter's fatal/non-fatal dialogs; DWarnDialog/promoteDWarnInternals suppress
          # internal warning dialogs. All of these otherwise block VI Server startup in CI.
          CONF_KEYS=(
            "autoerr = 3"
            "NIERShowFatalDialog = 0"
            "NIERFatalAutoSend = true"
            "NIERNonFatalAutoSend = true"
            "NIERShowNonFatalDialogOnExit = false"
            "NIERSendDialogClose = true"
            "DWarnDialog = false"
            "promoteDWarnInternals = false"
          )
          SED_ARGS=()
          for kv in "${CONF_KEYS[@]}"; do
            key="${kv%% =*}"
            grep -q "^${key}" "$CONF_FILE" || SED_ARGS+=(-e "/^\[LabVIEW\]/a ${kv}")
          done
          [ "${#SED_ARGS[@]}" -eq 0 ] || sed -i "${SED_ARGS[@]}" "$CONF_FILE"
          # install vipm 
          # ncurses is for tput - used to output color in scripts"
          apt-get update && apt-get install -y curl ncurses-bin >/dev/null
          curl -Ls -o /tmp/vipm.deb \
            https://packages.jki.net/vipm/preview/vipm_latest_preview_amd64.deb >/dev/null
          dpkg -i /tmp/vipm.deb && rm /tmp/vipm.deb >/dev/null
          vipm --version
          # start NIsvcloc - needed for g-cli
          nohup nisvcloc >/dev/null &
          sleep 3

          # We use a custom g-cli rust exe for 2 reasons.
          # 1 - for some reason the VIPM package doesn't install the exe
          # 2 - We made some modifications to avoid some issues with hanging. 
          cp bin/g-cli /usr/bin/g-cli