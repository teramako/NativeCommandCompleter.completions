<#
 # ifconfig completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    ifconfig    = configure network interface parameters
    _all        = Display all interfaces
    _short      = Display a short list
    _verbose    = Be more verbose
    _version    = Display version information
    _help       = Display help message
    interface   = The name of the interface.
    up          = Activate the interface
    down        = Deactivate the interface
    arp         = Enable or disable ARP protocol on the interface
    promisc     = Enable or disable promiscuous mode
    allmulti    = Enable or disable all-multicast mode
    mtu         = Set the Maximum Transfer Unit (MTU)
    dstaddr     = Set the remote IP address for point-to-point link
    netmask     = Set the IP network mask
    add         = Add an IPv6 address
    del         = Delete an IPv6 address
    tunnel      = Create IPv6-over-IPv4 tunnel
    irq         = Set the interrupt line used by the device
    io_addr     = Set the I/O address of the device
    mem_start   = Set the start address for shared memory
    media       = Set the physical port or medium type
    broadcast   = Set the broadcast address
    pointopoint = Enable point-to-point mode
    hw          = Set the hardware address
    multicast   = Set the multicast flag
    address     = Set the IP address
    txqueuelen  = Set the transmit queue length
    name        = Change the interface name
    alias       = Create an interface alias
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name ifconfig -Description $msg.ifconfig -Parameters @(
    # Display options
    New-ParamCompleter -Name a -Description $msg._all
    New-ParamCompleter -Name s -Description $msg._short
    New-ParamCompleter -Name v -Description $msg._verbose
    New-ParamCompleter -Name V -Description $msg._version
    New-ParamCompleter -LongName help -Description $msg._help
) -SubCommands @(
    $kvStyle = New-ParamStyle -ValueSeparator ' ' -ValueStyle Separated
    New-CommandCompleter -Name '*' -Description $msg.interface -CustomStyle $kvStyle -Parameters @(
        New-ParamCompleter -LongName up -Description $msg.up
        New-ParamCompleter -LongName down -Description $msg.down
        New-ParamCompleter -LongName arp,-arp -Description $msg.arp
        New-ParamCompleter -LongName promisc,-promisc -Description $msg.promisc
        New-ParamCompleter -LongName allmulti,-allmulti -Description $msg.allmulti
        New-ParamCompleter -LongName mtu -Description $msg.allmulti -Arguments @{ Name = 'N' }
        New-ParamCompleter -LongName dstaddr -Description $msg.dstaddr -Arguments @{ Name = 'addr' }
        New-ParamCompleter -LongName netmask -Description $msg.netmask -Arguments @{ Name = 'addr' }
        New-ParamCompleter -LongName add -Description $msg.add -Arguments @{ Name = 'addr/prefixlen' }
        New-ParamCompleter -LongName del -Description $msg.add -Arguments @{ Name = 'addr/prefixlen' }
        New-ParamCompleter -LongName tunnel -Description $msg.tunnel -Arguments @{ Name = '::aa.bb.cc.dd' }
        New-ParamCompleter -LongName irq -Description $msg.irq -Arguments @{ Name = 'addr' }
        New-ParamCompleter -LongName io_addr -Description $msg.io_addr -Arguments @{ Name = 'addr' }
        New-ParamCompleter -LongName mem_start -Description $msg.mem_start -Arguments @{ Name = 'addr' }
        New-ParamCompleter -LongName media -Description $msg.media -Arguments @{ Name = 'type' }
        New-ParamCompleter -LongName broadcast, -broadcast -Description $msg.broadcast -Arguments @{ Name = 'addr'; Nargs = '?' }
        New-ParamCompleter -LongName pointopoint, -pointopoint -Description $msg.pointopoint -Arguments @{ Name = 'addr'; Nargs = '?' }
        New-ParamCompleter -LongName hw -Description $msg.hw -Arguments @{ Name = 'class address' }
        New-ParamCompleter -LongName multicast -Description $msg.multicast
        New-ParamCompleter -LongName address -Description $msg.address
        New-ParamCompleter -LongName txqueuelen -Description $msg.txqueuelen -Arguments @{ Name = 'length' }
        New-ParamCompleter -LongName name -Description $msg.name -Arguments @{ Name = 'newname' }
    ) -NoFileCompletions
) -NoFileCompletions -Arguments @{
    Name = 'interface'
    Script = {
        # Complete <interface>
        if (Test-Path -LiteralPath '/sys/class/net' -PathType Container) {
            Get-ChildItem -LiteralPath '/sys/class/net' | Where-Object Name -Like "$wordToComplete*" |
                ForEach-Object { $_.Name }
        }
    }
}
