<#
 # groupmod completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

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

$groupCompleter = {
    if (Test-Path -LiteralPath '/etc/group') {
        Import-Csv -Delimiter : -Header Name,X,GID,Users -Path /etc/group |
            Where-Object Name -Like "$wordToComplete*" |
            ForEach-Object {
                "{0}`tGID: {1}" -f $_.Name, $_.GID
            }
    }
}

Register-NativeCompleter -Name groupmod -Description $msg.groupmod -Parameters @(
    New-ParamCompleter -ShortName g -LongName gid -Description $msg.gid -VariableName 'GID'
    New-ParamCompleter -ShortName n -LongName new-name -Description $msg.new_name -VariableName 'NEW_GROUP'
    New-ParamCompleter -ShortName o -LongName non-unique -Description $msg.non_unique
    New-ParamCompleter -ShortName p -LongName password -Description $msg.password -VariableName 'PASSWORD'
    New-ParamCompleter -ShortName R -LongName root -Description $msg.root -ArgumentType Directory -VariableName 'CHROOT_DIR'
    New-ParamCompleter -ShortName P -LongName prefix -Description $msg.prefix -ArgumentType Directory -VariableName 'PREFIX_DIR'
    New-ParamCompleter -ShortName h -LongName help -Description $msg.help
) -NoFileCompletions -ArgumentCompleter $groupCompleter
