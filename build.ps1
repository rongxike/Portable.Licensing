#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Restores, builds, tests and packages Portable.Licensing.
.PARAMETER Configuration
    The build configuration to use. Defaults to "Release".
#>
param(
    [string]$Configuration = "Release"
)

$ErrorActionPreference = "Stop"

$solution = Join-Path $PSScriptRoot "src/Portable.Licensing.sln"
$library = Join-Path $PSScriptRoot "src/Portable.Licensing/Portable.Licensing.csproj"
$output = Join-Path $PSScriptRoot "Publish"

dotnet restore $solution
dotnet build $solution -c $Configuration --no-restore
dotnet test $solution -c $Configuration --no-build
dotnet pack $library -c $Configuration --no-build -o $output
