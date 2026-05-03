<#
 # chmod completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    chmod            = change file mode bits
    changes          = Like -v but report only changes
    noPreserveRoot   = Don't treat / special (default)
    preserveRoot     = Suppress most errors
    silent           = Print a message for each created directory
    verbose          = Prints each file processed
    reference        = Use RFILEs mode instead of MODE values
    recursive        = Operate recursively
    help             = Display help and exit
    version          = Display version and exit
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name chmod -Description $msg.chmod -Parameters @(
    New-ParamCompleter -ShortName c -LongName changes -Description $msg.changes
    New-ParamCompleter -LongName no-preserve-root -Description $msg.noPreserveRoot
    New-ParamCompleter -LongName preserve-root -Description $msg.preserveRoot
    New-ParamCompleter -ShortName f -LongName silent, quiet -Description $msg.slient
    New-ParamCompleter -ShortName v -LongName verbose -Description $msg.verbose
    New-ParamCompleter -LongName reference -Description $msg.reference -Arguments @{ Name = 'RFILE'; Type = 'File' }
    New-ParamCompleter -ShortName R -LongName recursive -Description $msg.recursive
    New-ParamCompleter -LongName help -Description $msg.help
    New-ParamCompleter -LongName version -Description $msg.version
) -NoFileCompletions -Arguments @{
    Name = 'MODE'
    Script = {
        if ($this.BoundParameters.ContainsKey("reference")) {
            [MT.Comp.Helper]::CompleteFilename($this, $true, $true);
            return;
        }
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
}, @{
    Name = 'FILE';
    Nargs = '1+';
    Type = 'File';
}
