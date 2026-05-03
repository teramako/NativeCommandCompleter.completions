<#
 # mkdir completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    mode    = Set file mode (as in chmod)
    parents = Make parent directories as needed
    verbose = Print a message for each created directory
    version = Output version
    help    = Display help
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

# check whether GNU mkdir
mkdir --version 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) # GNU mkdir
{
    Register-NativeCompleter -Name mkdir -Parameters @(
        New-ParamCompleter -ShortName m -LongName mode -Description $msg.mode -Arguments @{
            Name = 'MODE'
            Script = {
                $word = $this.WordToComplete;
                switch -Regex ($word)
                {
                    '^[-+=]?[0-7]+' {
                        if ($word.Length -ge 3) { return $null }
                        0 .. 7 | ForEach-Object { "${word}$_" }
                    }
                    '^[ugoa]?[ugo]*$' {
                        "${word}+`tOperator: Add"
                        "${word}-`tOperator: Remove"
                        "${word}=`tOperator: Overwrite"
                        $t = $Matches[0];
                        if (-not $t.Contains("a")) {
                            if (-not $Matches[0].Contains("u")) { "${word}u`tTarget: User" }
                            if (-not $Matches[0].Contains("g")) { "${word}g`tTarget: Group" }
                            if (-not $Matches[0].Contains("o")) { "${word}o`tTarget: Other" }
                        }
                    }
                    '[ugoa]?[ugo]*[-+=]([rwxXst]*)' {
                        $p = $Matches[1];
                        if (-not $p.Contains("r")) { "${word}r`tPerm: read" }
                        if (-not $p.Contains("w")) { "${word}w`tPerm: write" }
                        if (-not $p -contains "x") {
                            "${word}x`tPerm: execute/search"
                            "${word}X`tPerm: execute/search only if directory or already executable"
                        }
                        if (-not $p.Contains("s")) { "${word}s`tPerm: set uid/gid" }
                        if (-not $p.Contains("t")) { "${word}s`tPerm: set sticky bit" }
                    }
                }
            }
        }
        New-ParamCompleter -ShortName p -LongName parents -Description $msg.parents
        New-ParamCompleter -ShortName v -LongName verbose -Description $msg.verbose
        New-ParamCompleter -LongName version -Description $msg.version
        New-ParamCompleter -LongName help -Description $msg.help
    )
}
else
{
    Register-NativeCompleter -Name mkdir -Parameters @(
        New-ParamCompleter -ShortName m -Description $msg.mode -Arguments @{ Name = 'mode' }
        New-ParamCompleter -ShortName p -Description $msg.parents
        New-ParamCompleter -ShortName v -Description $msg.verbose
    )
}

