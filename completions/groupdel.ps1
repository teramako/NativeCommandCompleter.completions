<#
 # groupdel completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    groupdel            = delete a group
    help                = Display help message and exit
    root                = Apply changes in the CHROOT_DIR directory
    prefix              = Apply changes in the PREFIX_DIR directory
    extrausers          = Use the extra users database
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name groupdel -Description $msg.groupdel -Parameters @(
    New-ParamCompleter -ShortName h -LongName help -Description $msg.help
    New-ParamCompleter -ShortName R -LongName root -Description $msg.root -Arguments @{ Name = 'CHROOT_DIR'; Type = 'Directory' }
    New-ParamCompleter -ShortName P -LongName prefix -Description $msg.prefix -Arguments @{ Name = 'PREFIX_DIR'; Type = 'Directory' }
    New-ParamCompleter -LongName extrausers -Description $msg.extrausers
) -NoFileCompletions -Arguments @{
    Name = 'GROUP';
    Script = {
        param([string] $wordToComplete)
        if (Test-Path -LiteralPath '/etc/group') {
            Import-Csv -Delimiter : -Header Name,X,GID,Users -Path /etc/group |
                Where-Object Name -Like "$wordToComplete*" |
                ForEach-Object {
                    "{0}`tGID: {1}" -f $_.Name, $_.GID
                }
        }
    }
}
