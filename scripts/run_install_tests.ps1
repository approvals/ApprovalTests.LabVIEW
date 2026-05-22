#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

New-Item -ItemType Directory -Path reports -Force | Out-Null
Remove-Item "reports\Caraya.InstallTestReport.xml" -ErrorAction SilentlyContinue
Remove-Item "reports\LUnit.InstallTestReport.xml" -ErrorAction SilentlyContinue

$lvVersion = if ($env:LV_VERSION) { $env:LV_VERSION } else { "26.0 (64-bit)" }
g-cli vipc -- -v $lvVersion -t 1200 "approvals-dev.vipc"

g-cli lunit -- -r "reports\LUnit.InstallTestReport.xml" "InstallTests"

$timer = [System.Diagnostics.Stopwatch]::StartNew()
Write-Host "Running Caraya Extension Tests"
g-cli Caraya -- -s "InstallTests\Caraya.Tests\Caraya Extension Tests\Caraya Extension Tests.lvclass" -x "reports\Caraya.InstallTestReport.xml"
Write-Host "Test Time: $($timer.Elapsed.TotalSeconds)"
