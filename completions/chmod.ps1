<#
 # chmod completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

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
        return $null;
    }
}, @{
    Name = 'FILE';
    Nargs = '1+';
    Type = 'File';
}
