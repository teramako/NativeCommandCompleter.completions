<#
.SYNOPSIS
    Completion definitions for NativeCommandCompleter.psm
.DESCRIPTION
    Automatically adds the bundled completions directory to PS_COMPLETE_PATH.
.LINK
    https://github.com/teramako/NativeCommandCompleter.psm
#>

$completionsDir = Join-Path -Path $PSScriptRoot -ChildPath 'completions'
$pathSep = [IO.Path]::PathSeparator
$completePath = [string]$env:PS_COMPLETE_PATH

if ([string]::IsNullOrEmpty($completePath)) {
    # Set default environment variable: PS_COMPLETE_PATH
    #      1. <Profile Directory>/completions
    #      2. <Module Directory>/completions
    $dirs = (Join-Path -Path ([IO.Path]::GetDirectoryName($PROFILE)) -ChildPath completions),
            $completionsDir
    $env:PS_COMPLETE_PATH = $dirs -join $pathSep
} else {
    $dirs = [string[]]$completePath.Split($pathSep, [StringSplitOptions]::TrimEntries -bor [StringSplitOptions]::RemoveEmptyEntries)
    $stringComparsion = $IsWindows ? [StringComparison]::OrdinalIgnoreCase : [StringComparison]::Ordinal
    if (-not $dirs.Contains($completionsDir, $stringComparsion)) {
        $env:PS_COMPLETE_PATH = ($dirs + $completionsDir) -join $pathSep
    }
}
