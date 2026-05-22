#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$INI_DIR = "C:\Program Files\National Instruments\LabVIEW 2026"
$INI_FILES = @(
    "$INI_DIR\LabVIEW.ini"
)

$SECTION = "LabVIEW"

$KEYS = @(
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
    "server.tcp.acl"
    "server.app.propertiesEnabled"
)

$VALUES = @(
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
    '"*"'
    "3363"
    '"*"'
    "True"
    "True"
    "560000000A000000020000002500000003000000090000003132372E302E302E31100000000300000000000100000000002500000003000000090000006C6F63616C686F737410000000030000000000010000000000"
    "True"
)

function Set-IniValue {
    param(
        [string]$File,
        [string]$Key,
        [string]$Value,
        [string]$Section
    )
    $content = Get-Content $File -Raw
    if ($content -match "(?m)^$([regex]::Escape($Key))") {
        $content = $content -replace "(?m)^$([regex]::Escape($Key)).*", "$Key = $Value"
    } else {
        $content = $content -replace "(?m)(\[$([regex]::Escape($Section))\])", "`$1`r`n$Key = $Value"
    }
    [System.IO.File]::WriteAllText($File, $content)
}

New-Item -ItemType Directory -Path $INI_DIR -Force | Out-Null

foreach ($ini_file in $INI_FILES) {
    Write-Host "Configuring $ini_file..."

    if (-not (Test-Path $ini_file)) {
        New-Item -ItemType File -Path $ini_file -Force | Out-Null
    }

    $content = Get-Content $ini_file -Raw -ErrorAction SilentlyContinue
    if (-not $content) { $content = "" }
    if ($content -notmatch "(?m)^\[$([regex]::Escape($SECTION))\]") {
        $content += "`r`n[$SECTION]`r`n"
        [System.IO.File]::WriteAllText($ini_file, $content)
    }

    for ($i = 0; $i -lt $KEYS.Length; $i++) {
        Set-IniValue -File $ini_file -Key $KEYS[$i] -Value $VALUES[$i] -Section $SECTION
    }

    Write-Host "Done: $ini_file"
}
