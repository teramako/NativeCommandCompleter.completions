<#
 # sc completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    sc                      = Service Control - Communicates with the Service Control Manager and services
    query                   = Query the status of a service or enumerate the status of types of services
    queryex                 = Query the extended status of a service or enumerate the status of types of services
    start                   = Start a service
    pause                   = Pause a service
    interrogate             = Send an interrogate control request to a service
    continue                = Continue a service
    stop                    = Stop a service
    config                  = Change the configuration of a service
    description             = Change the description of a service
    failure                 = Change the actions upon failure of a service
    failureflag             = Change the failure actions flag of a service
    sidtype                 = Change the service SID type of a service
    privs                   = Change the required privileges of a service
    managedaccount          = Change the service to mark the service account password as managed by LSA
    qc                      = Query the configuration information for a service
    qdescription            = Query the description for a service
    qfailure                = Query the actions taken by a service upon failure
    qfailureflag            = Query the failure actions flag of a service
    qsidtype                = Query the service SID type of a service
    qprivs                  = Query the required privileges of a service
    qtriggerinfo            = Query the trigger parameters of a service
    qpreferrednode          = Query the preferred NUMA node of a service
    qmanagedaccount         = Query whether a service uses an account with a password managed by LSA
    qprotection             = Query the process protection level of a service
    quserservice            = Query for a local instance of a user service template
    delete                  = Delete a service
    create                  = Create a service
    control                 = Send a control to a service
    sdshow                  = Display a service's security descriptor in SDDL format
    sdset                   = Set a service's security descriptor using SDDL format
    showsid                 = Display the service SID string corresponding to an arbitrary name
    triggerinfo             = Configure the trigger parameters of a service
    preferrednode           = Set the preferred NUMA node of a service
    GetDisplayName          = Get the DisplayName for a service
    GetKeyName              = Get the ServiceKeyName for a service
    EnumDepend              = Enumerate service dependencies
    boot                    = Indicate whether the last boot should be saved as the last-known-good boot configuration
    Lock                    = Lock the Service Database
    QueryLock               = Query the LockStatus for the SCManager Database

    server                  = The server to connect to
    type_own                = Service runs in its own process
    type_share              = Service shares a process with other services
    type_interact           = Service can interact with the desktop
    type_kernel             = Driver service
    type_filesys            = File system driver service
    type_rec                = File system recognizer driver service
    type_adapt              = Adapter driver service
    type_userservice        = User service
    type_usersvc_template   = User service template
    type_pktmonservice      = Packet monitor service
    type_pktmonsvc_template = Packet monitor service template
    start_boot              = Driver is loaded by the boot loader
    start_system            = Driver is loaded during kernel initialization
    start_auto              = Service starts automatically during system startup
    start_demand            = Service must be started manually
    start_disabled          = Service cannot be started
    start_delayed           = Service starts automatically with a delay
    error_normal            = Error is logged and a message box is displayed
    error_severe            = Error is logged and system is restarted with last-known-good configuration
    error_critical          = Error is logged and system attempts to restart with last-known-good configuration
    error_ignore            = Error is logged and startup continues
    state_all               = Enumerate services of all types and all states
    state_active            = Enumerate only active services
    state_inactive          = Enumerate only inactive services
    bufsize                 = The size of the enumeration buffer
    ri                      = The resume index at which to begin the enumeration
    group                   = The load order group
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$serviceArgument = New-ArgumentCompleter service -Script {
    param([string] $wordToComplete)
    Get-Service | Where-Object Name -Like "$wordToComplete*" | ForEach-Object {
        "{0}`t{1}" -f $_.Name, $_.DisplayName
    }
}

$typeArgument = New-ArgumentCompleter type -Candidates @(
    "own`t{0}" -f $msg.type_own
    "share`t{0}" -f $msg.type_share
    "interact`t{0}" -f $msg.type_interact
    "kernel`t{0}" -f $msg.type_kernel
    "filesys`t{0}" -f $msg.type_filesys
    "rec`t{0}" -f $msg.type_rec
    "adapt`t{0}" -f $msg.type_adapt
    "userservice`t{0}" -f $msg.type_userservice
    "usersvc_template`t{0}" -f $msg.type_usersvc_template
    "pktmonservice`t{0}" -f $msg.type_pktmonservice
    "pktmonsvc_template`t{0}" -f $msg.type_pktmonsvc_template
)

$startArgument = New-ArgumentCompleter start -Candidates @(
    "boot`t{0}" -f $msg.start_boot
    "system`t{0}" -f $msg.start_system
    "auto`t{0}" -f $msg.start_auto
    "demand`t{0}" -f $msg.start_demand
    "disabled`t{0}" -f $msg.start_disabled
    "delayed-auto`t{0}" -f $msg.start_delayed
)

$errorArgument = New-ArgumentCompleter error -Candidates @(
    "normal`t{0}" -f $msg.error_normal
    "severe`t{0}" -f $msg.error_severe
    "critical`t{0}" -f $msg.error_critical
    "ignore`t{0}" -f $msg.error_ignore
)

$stateArgument = New-ArgumentCompleter state -Candidates @(
    "all`t{0}" -f $msg.state_all
    "active`t{0}" -f $msg.state_active
    "inactive`t{0}" -f $msg.state_inactive
)

Register-NativeCompleter -Name sc -Description $msg.sc -Style Windows -Parameters @(
    New-ParamCompleter -LongName server -Description $msg.server -Arguments @{ Name = 'ServerName' }
) -SubCommands @(
    New-CommandCompleter -Name query -Description $msg.query -Parameters @(
        New-ParamCompleter -LongName type -Description $msg.type_own -Arguments $typeArgument
        New-ParamCompleter -LongName state -Description $msg.state_all -Arguments $stateArgument
        New-ParamCompleter -LongName bufsize -Description $msg.bufsize -Arguments @{ Name = 'BufferSize' }
        New-ParamCompleter -LongName ri -Description $msg.ri -Arguments @{ Name = 'ResumeIndex' }
        New-ParamCompleter -LongName group -Description $msg.group -Arguments @{ Name = 'GroupName' }
    ) -Arguments $serviceArgument

    New-CommandCompleter -Name queryex -Description $msg.queryex -Parameters @(
        New-ParamCompleter -LongName type -Description $msg.type_own -Arguments $typeArgument
        New-ParamCompleter -LongName state -Description $msg.state_all -Arguments $stateArgument
        New-ParamCompleter -LongName bufsize -Description $msg.bufsize -Arguments @{ Name = 'BufferSize' }
        New-ParamCompleter -LongName ri -Description $msg.ri -Arguments @{ Name = 'ResumeIndex' }
        New-ParamCompleter -LongName group -Description $msg.group -Arguments @{ Name = 'GroupName' }
    ) -Arguments $serviceArgument

    New-CommandCompleter -Name start -Description $msg.start -Arguments $serviceArgument
    New-CommandCompleter -Name pause -Description $msg.pause -Arguments $serviceArgument
    New-CommandCompleter -Name interrogate -Description $msg.interrogate -Arguments $serviceArgument
    New-CommandCompleter -Name continue -Description $msg.continue -Arguments $serviceArgument
    New-CommandCompleter -Name stop -Description $msg.stop -Arguments $serviceArgument

    New-CommandCompleter -Name config -Description $msg.config -Parameters @(
        New-ParamCompleter -LongName type -Description $msg.type_own -Arguments $typeArgument
        New-ParamCompleter -LongName start -Description $msg.start_auto -Arguments $startArgument
        New-ParamCompleter -LongName error -Description $msg.error_normal -Arguments $errorArgument
        New-ParamCompleter -LongName binPath -Description 'BinaryPathName' -Arguments @{ Name = 'BinaryPathName' }
        New-ParamCompleter -LongName group -Description $msg.group -Arguments @{ Name = 'LoadOrderGroup' }
        New-ParamCompleter -LongName tag -Description 'TagId' -Arguments @{ Name = 'yes/no'; Candidates = "yes","no" }
        New-ParamCompleter -LongName depend -Description 'Dependencies' -Arguments @{ Name = 'Dependencies' }
        New-ParamCompleter -LongName obj -Description 'AccountName' -Arguments @{ Name = 'AccountName' }
        New-ParamCompleter -LongName DisplayName -Description 'DisplayName' -Arguments @{ Name = 'DisplayName' }
        New-ParamCompleter -LongName password -Description 'Password' -Arguments @{ Name = 'Password' }
    ) -Arguments $serviceArgument

    New-CommandCompleter -Name description -Description $msg.description -Arguments $serviceArgument
    New-CommandCompleter -Name failure -Description $msg.failure -Arguments $serviceArgument
    New-CommandCompleter -Name failureflag -Description $msg.failureflag -Arguments $serviceArgument
    New-CommandCompleter -Name sidtype -Description $msg.sidtype -Arguments $serviceArgument
    New-CommandCompleter -Name privs -Description $msg.privs -Arguments $serviceArgument
    New-CommandCompleter -Name managedaccount -Description $msg.managedaccount -Arguments $serviceArgument
    New-CommandCompleter -Name qc -Description $msg.qc -Arguments $serviceArgument
    New-CommandCompleter -Name qdescription -Description $msg.qdescription -Arguments $serviceArgument
    New-CommandCompleter -Name qfailure -Description $msg.qfailure -Arguments $serviceArgument
    New-CommandCompleter -Name qfailureflag -Description $msg.qfailureflag -Arguments $serviceArgument
    New-CommandCompleter -Name qsidtype -Description $msg.qsidtype -Arguments $serviceArgument
    New-CommandCompleter -Name qprivs -Description $msg.qprivs -Arguments $serviceArgument
    New-CommandCompleter -Name qtriggerinfo -Description $msg.qtriggerinfo -Arguments $serviceArgument
    New-CommandCompleter -Name qpreferrednode -Description $msg.qpreferrednode -Arguments $serviceArgument
    New-CommandCompleter -Name qmanagedaccount -Description $msg.qmanagedaccount -Arguments $serviceArgument
    New-CommandCompleter -Name qprotection -Description $msg.qprotection -Arguments $serviceArgument
    New-CommandCompleter -Name quserservice -Description $msg.quserservice -Arguments $serviceArgument
    New-CommandCompleter -Name delete -Description $msg.delete -Arguments $serviceArgument

    New-CommandCompleter -Name create -Description $msg.create -Parameters @(
        New-ParamCompleter -LongName type -Description $msg.type_own -Arguments $typeArgument
        New-ParamCompleter -LongName start -Description $msg.start_auto -Arguments $startArgument
        New-ParamCompleter -LongName error -Description $msg.error_normal -Arguments $errorArgument
        New-ParamCompleter -LongName binPath -Description 'BinaryPathName' -Arguments @{ Name = 'BinaryPathName' }
        New-ParamCompleter -LongName group -Description $msg.group -Arguments @{ Name = 'LoadOrderGroup' }
        New-ParamCompleter -LongName tag -Description 'TagId' -Arguments @{ Name = 'yes/no'; Candidates = "yes","no" }
        New-ParamCompleter -LongName depend -Description 'Dependencies' -Arguments @{ Name = 'Dependencies' }
        New-ParamCompleter -LongName obj -Description 'AccountName' -Arguments @{ Name = 'AccountName' }
        New-ParamCompleter -LongName DisplayName -Description 'DisplayName' -Arguments @{ Name = 'DisplayName' }
        New-ParamCompleter -LongName password -Description 'Password' -Arguments @{ Name = 'Password' }
    ) -NoFileCompletions

    New-CommandCompleter -Name control -Description $msg.control -Arguments $serviceArgument
    New-CommandCompleter -Name sdshow -Description $msg.sdshow -Arguments $serviceArgument
    New-CommandCompleter -Name sdset -Description $msg.sdset -Arguments $serviceArgument
    New-CommandCompleter -Name showsid -Description $msg.showsid -NoFileCompletions
    New-CommandCompleter -Name triggerinfo -Description $msg.triggerinfo -Arguments $serviceArgument
    New-CommandCompleter -Name preferrednode -Description $msg.preferrednode -Arguments $serviceArgument
    New-CommandCompleter -Name GetDisplayName -Description $msg.GetDisplayName -Arguments $serviceArgument
    New-CommandCompleter -Name GetKeyName -Description $msg.GetKeyName -NoFileCompletions
    New-CommandCompleter -Name EnumDepend -Description $msg.EnumDepend -Arguments $serviceArgument
    New-CommandCompleter -Name boot -Description $msg.boot -NoFileCompletions
    New-CommandCompleter -Name Lock -Description $msg.Lock -NoFileCompletions
    New-CommandCompleter -Name QueryLock -Description $msg.QueryLock -NoFileCompletions
) -NoFileCompletions
