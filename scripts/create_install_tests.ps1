#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$timer = [System.Diagnostics.Stopwatch]::StartNew()

if (Test-Path InstallTests) { Remove-Item -Recurse -Force InstallTests }

g-cli --kill clearlvcache

Copy-Item -Recurse Tests InstallTests

g-cli switcheroo -- -t "InstallTests" -o "Source\Extensions\Caraya.Extension\Caraya.Extension.lvlib" -r "<vilib>\SAS\Approval Tests\Extensions\lib_Caraya.Extension.lvlib"
g-cli switcheroo -- -t "InstallTests" -o "Source\Extensions\LUnit.Extension\LUnit.Extension.lvlib" -r "<vilib>\SAS\Approval Tests\Extensions\lib_LUnit.Extension.lvlib"
g-cli switcheroo --kill -- -t "InstallTests" -o "Source\Approval Tests\Approval Tests.lvlib" -r "<vilib>\SAS\Approval Tests\Approval Tests\lib_Approval Tests.lvlib"

Write-Host "Total Script Time $($timer.Elapsed.TotalSeconds)"
