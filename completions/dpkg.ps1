<#
 # dpkg completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    dpkg                        = package manager for Debian
    install                     = Install the package
    unpack                      = Unpack the package, but don't configure it
    configure                   = Configure a package which has been unpacked
    remove                      = Remove an installed package
    purge                       = Purge an installed package
    verify                      = Verify the integrity of package(s)
    update_avail                = Replace available packages info
    merge_avail                 = Merge with info from file
    clear_avail                 = Erase existing available info
    forget_old_unavail          = Forget uninstalled unavailable pkgs
    audit                       = Check for broken package(s)
    yet_to_unpack               = List packages selected for installation
    list                        = List packages concisely
    listfiles                   = List files owned by package(s)
    status                      = Display package status details
    print_avail                 = Display available version details
    search                      = Search for packages owning file(s)
    contents                    = List contents of a package file
    control                     = Print the control file(s)
    fsys_tarfile                = Output filesystem tarfile
    field                       = Show the field(s) of package(s)
    compare_versions            = Compare version numbers
    help                        = Display help
    version                     = Display version
    force_help                  = Help about forcing
    license                     = Display license
    admindir                    = Use directory instead of /var/lib/dpkg
    instdir                     = Change installation dir without changing admin dir
    root                        = Install on alternative system rooted elsewhere
    abort_after                 = Abort after encountering errors
    arch                        = Set architecture
    ignore_depends              = Ignore dependencies involving package
    force_things                = Override problems
    no_force_things             = Stop when problems encountered
    refuse_things               = Ditto
    auto_deconfigure            = Install even if it would break some other package
    no_act                      = Just say what we would do - don't do it
    simulate                    = Simulate processing
    recursive                   = Recursively handle all regular files
    no_triggers                 = Skip or force consequential trigger processing
    triggers                    = Process triggers
    pending                     = Process triggers for packages awaiting it
    verify_format               = Verify output format
    no_pager                    = Disables the use of any pager
    log                         = Log status changes and actions to file
    path_exclude                = Do not install any files matching pattern
    path_include                = Re-include a pattern after a previous exclusion
    status_fd                   = Send status change updates to file descriptor
    status_logger               = Send status change updates to command's stdin
    no_debsig                   = Do not try to verify package signatures
    selected_only               = Skip packages not selected for install/upgrade
    skip_same_version           = Skip packages whose same version is installed
    pre_invoke                  = Set an invoke hook
    post_invoke                 = Set an invoke hook
    robot                       = Use machine-readable output
    no_act_short                = Simulation mode
    debug                       = Enable debugging
    audit_short                 = Audit mode
    yet_to_unpack_short         = Packages yet to unpack
    configure_short             = Configure unpacked packages
    pending_short               = Process pending triggers
    recursive_short             = Recursive processing
    search_short                = Search for file owners
    print_avail_short           = Print available package info
    expert                      = Expert mode (do not prompt)
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$installedPackageCompleter = {
    if ([string]::IsNullOrWhiteSpace($wordToComplete) -or $wordToComplete.Length -lt 2) { return $null }
    if (-not (Test-Path -LiteralPath '/var/lib/dpkg/status')) { return $null }
    $q = "*${wordToComplete}*"
    $table = @{};
    $pkg = "";
    $installed = $false;
    Get-Content -LiteralPath '/var/lib/dpkg/status' | ForEach-Object {
        switch -Regex ($_) {
            '^Package: (.*)$' { $pkg = $Matches[1] }
            '^Status: ' { $installed = $_ -match '\binstalled\b' }
            '^Description-?[a-zA-Z_]*: (.*)$' {
                if ($installed -and -not [string]::IsNullOrEmpty($pkg) -and $pkg -like $q ) {
                    $table.Add($pkg, $Matches[1]);
                }
            }
        }
    }
    foreach ($k in $table.Keys) {
        "{0}`t{1}" -f $k, $table[$k]
    }
}

$packageFileArgument = New-ArgumentCompleter package-file -Nargs '1+' -Type File

Register-NativeCompleter -Name dpkg -Description $msg.dpkg -Parameters @(
    # Actions
    New-ParamCompleter -ShortName i -LongName install -Description $msg.install -Arguments $packageFileArgument
    New-ParamCompleter -LongName unpack -Description $msg.unpack -Arguments $packageFileArgument
    New-ParamCompleter -LongName configure -Description $msg.configure -Arguments @{ Name = 'package'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName r -LongName remove -Description $msg.remove -Arguments @{ Name = 'pacakge'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName P -LongName purge -Description $msg.purge -Arguments @{ Name = 'package'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName V -LongName verify -Description $msg.verify -Arguments @{ Name = 'package-name'; Nargs = '0+'; Script = $installedPackageCompleter }
    New-ParamCompleter -LongName update-avail -Description $msg.update_avail -Arguments @{ Name = 'Packages-file'; Type = 'File' }
    New-ParamCompleter -LongName merge-avail -Description $msg.merge_avail -Arguments @{ Name = 'Packages-file'; Type = 'File' }
    New-ParamCompleter -LongName clear-avail -Description $msg.clear_avail
    New-ParamCompleter -LongName forget-old-unavail -Description $msg.forget_old_unavail
    New-ParamCompleter -ShortName C -LongName audit -Description $msg.audit
    New-ParamCompleter -LongName yet-to-unpack -Description $msg.yet_to_unpack
    New-ParamCompleter -ShortName l -LongName list -Description $msg.list -Arguments @{ Name = 'package-name-pattern'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName L -LongName listfiles -Description $msg.listfiles -Arguments @{ Name = 'package-name'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName s -LongName status -Description $msg.status -Arguments @{ Name = 'package-name'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName p -LongName print-avail -Description $msg.print_avail -Arguments @{ Name = 'package-name'; Nargs = '1+'; Script = $installedPackageCompleter }
    New-ParamCompleter -ShortName S -LongName search -Description $msg.search
    New-ParamCompleter -ShortName c -LongName contents -Description $msg.contents -Arguments @{ Name = 'archive'; Type = 'File' }
    New-ParamCompleter -ShortName e -LongName control -Description $msg.control -Arguments @{ Name = 'archhive'; Type = 'File'}, @{ Name = 'directory'; Nargs = '?'; Type = 'Directory' }
    New-ParamCompleter -ShortName x -LongName extract -Description $msg.fsys_tarfile -Arguments @{ Name = 'archive'; Type = 'File' }, @{ Name = 'directory'; Type = 'Directory' }
    New-ParamCompleter -ShortName f -LongName field -Description $msg.field -Arguments @{ Name = 'archive'; Type = 'File' }, @{ Name = 'control-field'; Nargs = '0+' }
    New-ParamCompleter -LongName compare-versions -Description $msg.compare_versions
    New-ParamCompleter -LongName help -Description $msg.help
    New-ParamCompleter -LongName version -Description $msg.version
    New-ParamCompleter -LongName force-help -Description $msg.force_help
    New-ParamCompleter -LongName license -Description $msg.license

    # Options
    New-ParamCompleter -LongName admindir -Description $msg.admindir -Arguments @{ Name = 'directory'; Type = 'Directory' }
    New-ParamCompleter -LongName instdir -Description $msg.instdir -Arguments @{ Name = 'directory'; Type = 'Directory' }
    New-ParamCompleter -LongName root -Description $msg.root -Arguments @{ Name = 'directory'; Type = 'Directory' }
    New-ParamCompleter -ShortName B -LongName auto-deconfigure -Description $msg.auto_deconfigure
    New-ParamCompleter -LongName no-act -Description $msg.no_act
    New-ParamCompleter -LongName dry-run, simulate -Description $msg.simulate
    New-ParamCompleter -ShortName R -LongName recursive -Description $msg.recursive
    New-ParamCompleter -LongName no-triggers -Description $msg.no_triggers
    New-ParamCompleter -LongName triggers -Description $msg.triggers
    New-ParamCompleter -ShortName a -LongName pending -Description $msg.pending
    New-ParamCompleter -LongName verify-format -Description $msg.verify_format -Arguments @{ Name = 'format' }
    New-ParamCompleter -LongName no-pager -Description $msg.no_pager
    New-ParamCompleter -LongName log -Description $msg.log -Arguments @{ Name = 'filename'; Type = 'File' }
    New-ParamCompleter -LongName abort-after -Description $msg.abort_after -Arguments @{ Name = 'number' }
    New-ParamCompleter -LongName arch -Description $msg.arch -Arguments @{ Name = 'architecture' }
    New-ParamCompleter -LongName ignore-depends -Description $msg.ignore_depends -Arguments @{ Name = 'package' }
    New-ParamCompleter -LongName force-things -Description $msg.force_things -Arguments @{ Name = 'things'; List = $true }
    New-ParamCompleter -LongName no-force-things -Description $msg.no_force_things -Arguments @{ Name = 'things'; List = $true }
    New-ParamCompleter -LongName refuse-things -Description $msg.refuse_things -Arguments @{ Name = 'things'; List = $true }
    New-ParamCompleter -LongName path-exclude -Description $msg.path_exclude -Arguments @{ Name = 'pattern' }
    New-ParamCompleter -LongName path-include -Description $msg.path_include -Arguments @{ Name = 'pattern' }
    New-ParamCompleter -LongName status-fd -Description $msg.status_fd -Arguments @{ Name = 'n' }
    New-ParamCompleter -LongName status-logger -Description $msg.status_logger -Arguments @{ Name = 'command' }
    New-ParamCompleter -LongName no-debsig -Description $msg.no_debsig
    New-ParamCompleter -ShortName E -LongName skip-same-version -Description $msg.skip_same_version
    New-ParamCompleter -ShortName G -Description $msg.selected_only
    New-ParamCompleter -LongName pre-invoke -Description $msg.pre_invoke -Arguments @{ Name = 'command' }
    New-ParamCompleter -LongName post-invoke -Description $msg.post_invoke -Arguments @{ Name = 'command' }
    New-ParamCompleter -LongName robot -Description $msg.robot
    New-ParamCompleter -ShortName D -Description $msg.debug -Arguments @{ Name = 'octal' }
    New-ParamCompleter -LongName debug -Description $msg.debug -Arguments @{ Name = 'hex' }
    New-ParamCompleter -LongName expert -Description $msg.expert
) -NoFileCompletions
