<#
 # date completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    date                   = display or set date and time
    gnu_date               = Display date described by string
    gnu_file               = Display date for each line in file
    gnu_iso8601            = Use ISO 8601 output format
    gnu_resolution         = Output the available resolution of timestamps
    gnu_rfc2822            = Output in RFC 2822 format
    gnu_rfc3339            = Output in RFC 3339 format
    gnu_reference          = Display last modification time of file
    gnu_set                = Set time
    gnu_utc                = Print/set UTC time
    gnu_help               = Display help and exit
    gnu_version            = Display version and exit
    bsd_utc                = Display or set UTC time
    bsd_dontSet            = Don't try to set the date
    bsd_mtimeOrTimestamp   = Format path mtime or UNIX timestamp
    bsd_adjust             = Adjust clock ± time specified
    bsd_rfc2822            = Use RFC 2822 output format
    bsd_iso8601            = Use ISO 8601 output format
    bsd_format             = Use format string to parse date
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

# check whether GNU mkdir
date --version 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) # GNU mkdir
{
    Register-NativeCompleter -Name date -Description $msg.date -Parameters @(
        New-ParamCompleter -ShortName d -LongName date -Description $msg.gnu_date -Arguments @{ Name = 'STRING' }
        New-ParamCompleter -ShortName f -LongName file -Description $msg.gnu_file -Arguments @{ Name = 'DATEFILE'; Type = 'File' }
        New-ParamCompleter -ShortName I -LongName iso-8601 -Description $msg.gnu_iso8601 -Arguments @{ Name = 'FMT'; Nargs = '?'; Candidates = "date","hours","minutes","seconds","ns" }
        New-ParamCompleter -LongName resolution -Description $msg.gnu_resolution
        New-ParamCompleter -ShortName R -LongName rfc-2822 -Description $msg.gnu_rfc2822
        New-ParamCompleter -LongName rfc-3339 -Description $msg.gnu_rfc3339 -Arguments @{ Name = 'FMT'; Candidates = "date","seconds","ns" }
        New-ParamCompleter -ShortName r -LongName reference -Description $msg.gnu_reference -Arguments @{ Name = 'FILE'; Type = 'File' }
        New-ParamCompleter -ShortName s -LongName set -Description $msg.gnu_set -Arguments @{ Name = 'STRING' }
        New-ParamCompleter -ShortName u -LongName utc,universal -Description $msg.gnu_utc
        New-ParamCompleter -ShortName h -LongName help -Description $msg.gnu_help
        New-ParamCompleter -ShortName v -LongName version -Description $msg.gnu_version
    ) -NoFileCompletions
}
else
{
    Register-NativeCompleter -Name date -Description $msg.date -Parameters @(
        New-ParamCompleter -ShortName u -Description $msg.bsd_utc
        New-ParamCompleter -ShortName j -Description $msg.bsd_dontSet
        New-ParamCompleter -ShortName r -Description $msg.bsd_mtimeOrTimestamp -Arguments @{ Name = 'FILE-OR-SECONDS' }
        New-ParamCompleter -ShortName v -Description $msg.bsd_adjust -Arguments @{ Name = '[+|-]val[y|m|w|d|H|M|S]' }
        New-ParamCompleter -ShortName R -Description $msg.bsd_rfc2822
        New-ParamCompleter -ShortName I -Description $msg.bsd_iso8601 -Arguments @{ Name = 'FMT'; Candidates = "date","hours","minutes","seconds" }
        New-ParamCompleter -ShortName f -Description $msg.bsd_format -Arguments @{ Name = 'input_fmt' }
    ) -NoFileCompletions
}
