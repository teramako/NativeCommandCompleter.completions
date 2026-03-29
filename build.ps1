<#
.SYNOPSIS
    Build PowerShell Module Package

.PARAMETER CreateZip
    Create Zip archived the PowerShell module files
.PARAMETER Publish
    Upload the PowerShell module to PowerShell Gallery (https://www.powershellgallery.com/)

#>
[CmdletBinding()]
param(
    [Parameter(ParameterSetName = "Zip", Mandatory)]
    [switch] $CreateZip
    ,
    [Parameter(ParameterSetName = "Publish", Mandatory)]
    [switch] $Publish
)
$ErrorActionPreference = 'Stop'

$psmDir = "$PSScriptRoot"

$commonParam = if ($PSCmdlet.MyInvocation.BoundParameters['Verbose'])
{
    @{ Verbose = $true }
} else {
    @{ Verbose = $false }
}

$psdFile = "NativeCommandCompleter.completions.psd1"
$ModuleManifest = Test-ModuleManifest -Path (Join-Path -Path $psmDir -ChildPath $psdFile)
$tmpDir = Join-Path -Path $PSScriptRoot -ChildPath out, $ModuleManifest.Name
$compltionsDir = Join-Path -Path $PSScriptRoot -ChildPath completions

$now = [datetime]::Now
$baseVersion = $ModuleManifest.Version
$version = [version]::new($baseVersion.Major, $baseVersion.Minor, $now.ToString("yyyyMMdd")).ToString()

function CreateDest
{
    if (Test-Path -Path $tmpDir -PathType Container)
    {
        Remove-Item -Recurse $tmpDir
    }
    $null = New-Item -Path $tmpDir -ItemType Directory
    $ModuleManifest.FileList + $compltionsDir | ForEach-Object {
        $filePath = Resolve-Path -Path $_ -Relative -RelativeBasePath $psmDir
        $destFile = [System.IO.FileInfo]::new((Join-Path -Path $tmpDir -ChildPath $filePath));
        $destDir = $destFile.Directory
        if (-not $destDir.Exists)
        {
            $null = New-Item -ItemType Directory -Path $destDir @commonParam
        }
        if (Test-Path -LiteralPath $filePath -PathType Container) {
            Copy-Item -Path $filePath -Destination $destDir -Recurse
            Write-Verbose ("Copy {0}{2} to {1}{2}" -f $filePath, $destDir, [IO.Path]::DirectorySeparatorChar)
        } else {
            Copy-Item -Path $filePath -Destination $destDir -Recurse @commonParam
        }
    }
    Update-ModuleManifest -Path (Join-Path -Path $tmpDir -ChildPath $psdFile) -ModuleVersion $version
    Write-Verbose ("Set module version to '{0}'" -f $version)
    return $tmpDir
}


if ($CreateZip)
{
    $dir = CreateDest
    $zipFileName = "{0}-{1}.zip" -f $ModuleManifest.Name, $version
    $zipFile = Join-Path -Path $PSScriptRoot -ChildPath out, $zipFileName
    Compress-Archive -Path $dir -DestinationPath $zipFile -PassThru -Force @commonParam
}

if ($Publish)
{
    $userName = if ($IsWindows) { $env:USERNAME } else { $env:USER }
    $nugetCredential = Get-Credential -Title "Nuget ApiKey" -UserName $userName

    $dir = CreateDest

    Publish-Module `
        -Path $dir `
        -NuGetApiKey ($nugetCredential.Password | ConvertFrom-SecureString -AsPlainText) `
        @commonParam
}

