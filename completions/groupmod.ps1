<#
 # groupmod completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    groupmod            = modify a group definition on the system
    gid                 = Change the group ID to GID
    new_name            = Change the name of the group to NEW_GROUP
    non_unique          = Allow to use a duplicate (non-unique) GID
    password            = Change the password to PASSWORD
    root                = Apply changes in the CHROOT_DIR directory
    prefix              = Apply changes to configuration files under PREFIX_DIR
    help                = Display help message and exit
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name groupmod -Description $msg.groupmod -Parameters @(
    New-ParamCompleter -ShortName g -LongName gid -Description $msg.gid -Arguments @{ Name = 'GID' }
    New-ParamCompleter -ShortName n -LongName new-name -Description $msg.new_name -Arguments @{ Name = 'NEW_GROUP' }
    New-ParamCompleter -ShortName o -LongName non-unique -Description $msg.non_unique
    New-ParamCompleter -ShortName p -LongName password -Description $msg.password -Arguments @{ Name = 'PASSWORD' }
    New-ParamCompleter -ShortName R -LongName root -Description $msg.root -Arguments @{ Name = 'CHROOT_DIR'; Type = 'Directory' }
    New-ParamCompleter -ShortName P -LongName prefix -Description $msg.prefix -Arguments @{ Name = 'PREFIX_DIR'; Type = 'Directory' }
    New-ParamCompleter -ShortName h -LongName help -Description $msg.help
) -NoFileCompletions -Arguments @{
    Name = 'GROUP'; Script = {
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
