<#
 # ansible-galaxy completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    ansible_galaxy              = Perform various Role and Collection related operations.

    collection                  = Manage an Ansible Galaxy collection.
    collection_download         = Download collections and their dependencies as a tarball.
    collection_init             = Initialize new collection with the base structure of a collection.
    collection_build            = Build an Ansible Galaxy collection artifact
    collection_install          = Install collection(s) from file(s), URL(s) or Ansible Galaxy.
    collection_list             = Show the name and version of each collection installed on the system.
    collection_publish          = Publish a collection artifact to Ansible Galaxy.
    collection_verify           = Compare checksums with the collection(s) found on the server.

    role                        = Manage an Ansible Galaxy role.
    role_delete                 = Delete a role from Ansible Galaxy.
    role_import                 = Import a role into a Galaxy server.
    role_info                   = View more details about a specific role.
    role_init                   = Initialize new role with the base structure of a role.
    role_install                = Install role(s) from file(s), URL(s) or Ansible Galaxy.
    role_list                   = Show the name and version of each role installed on the system.
    role_remove                 = Delete a role from the roles path.
    role_search                 = Search the Galaxy database by tags, platforms, author and multiple keywords.
    role_setup                  = Setup an integration on GitHub for Ansible Galaxy roles.

    api_key                     = Ansible Galaxy API key
    clear_response_cache        = Clear the existing server response cache.
    force                       = Force overwriting an existing role or collection.
    force_with_deps             = Force overwriting an existing collection and its dependencies.
    help                        = Show this help message and exit.
    ignore_errors               = Continue after error. Use this to complete bulk operations despite errors.
    ignore_certs                = Ignore TLS certificate errors.
    no_deps                     = Don't download dependencies.
    offline                     = Complete offline without downloading roles/collections.
    pre                         = Include pre-release versions.
    required_roles_file         = A file containing a list of roles to be imported.
    roles_path                  = The path to the directory containing your roles.
    server                      = The Ansible Galaxy server to use.
    timeout                     = The time to wait for operations against the galaxy server.
    use_cache                   = Use the server response cache.
    no_cache                    = Do not use the server response cache
    verbose                     = Verbose mode.
    version                     = Show program's version number and exit.
    disable_gpb_verify          = Disable GPG signature verification
    format                      = Format to display the list of collections in
    signature                   = An additional signature source to verify the authenticity of the MANIFEST.json.
    ignore_signature_status_code   =  Ignore signature verification status code
    required_valid_signature_count = The number of signatures that must successfully verify the collection.

    collection_keyring                  = GPG keyring to use for collection signature verification.
    collection_download_output_path     = The directory to save downloaded collections.
    collection_init_init_path           = The path where the skeleton collection will be created.
    collection_init_collection_skeleton = The path to a collection skeleton that the collection should be based upon.
    collection_build_output_path        = The path in which the collection is built to.
    collection_publish_import_timeout   = The time to wait for the collection import process to finish.
    collection_install_collections_path = The path to the directory containing your collections.
    collection_requirements_file        = A file containing a list of collections to be installed.
    collection_install_upgrade          = Upgrade installed collection artifacts. This will also update dependencies unless --no-deps is provided.
    collection_list_collections_path    = One or more directories of collections to search.
    collection_publish_no_wait          = Don't wait for import validation results.
    collection_verify_collections_path  = One or more directories of collections to search.

    role_import_branch             = The name of a branch to import.
    role_import_no_wait            = Don't wait for import results.
    role_import_role_name          = The name the role should have, if different from the repo name.
    role_info_offline              = Complete offline without downloading roles.
    role_init_init_path            = The path where the skeleton role will be created.
    role_init_role_skeleton        = The path to a role skeleton that the new role should be based upon.
    role_init_type                 = Initialize using an alternate content type.
    role_install_keep_scm_meta     = Use tar instead of the scm archive option when packaging the role.
    role_install_requirements_file = A file containing a list of roles to be installed.
    role_search_author             = GitHub username.
    role_search_galaxy_tags        = List of galaxy tags to filter by.
    role_search_platforms          = List of OS platforms to filter by.
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$signatureStatusCodes = 'EXPSIG','EXPKEYSIG','REVKEYSIG','BADSIG','ERRSIG','NO_PUBKEY','MISSING_PASSPHRASE','BAD_PASSPHRASE',
                        'NODATA','UNEXPECTED','ERROR','FAILURE','BADARMOR','KEYEXPIRED','KEYREVOKED','NO_SECKEY'

# Common parameters
$helpParam                = New-ParamCompleter -ShortName h -LongName help -Description $msg.help
$versionParam             = New-ParamCompleter -LongName version -Description $msg.version
$verboseParam             = New-ParamCompleter -ShortName v -LongName verbose -Description $msg.verbose
$apiKeyParam              = New-ParamCompleter -LongName api-key, token -Description $msg.api_key -Arguments @{ Name = 'API_KEY' }
$ignoreCertsParam         = New-ParamCompleter -ShortName c -LongName ignore-certs -Description $msg.ignore_certs
$timeoutParam             = New-ParamCompleter -LongName timeout -Description $msg.timeout -Arguments @{ Name = 'TIMEOUT' }
$serverParam              = New-ParamCompleter -ShortName s -LongName server -Description $msg.server -Arguments @{ Name = 'SERVER' }

$noCacheParam             = New-ParamCompleter -LongName no-cache -Description $msg.no_cache
$ignoreSignatureParam     = New-ParamCompleter -LongName ignore-signature-status-code  -Description $msg.ignore_signature_status_code -Arguments @{ Name = 'IGNORE_STATUS_CODE'; Candidates = $signatureStatusCodes }
$ignoreSignaturesParam    = New-ParamCompleter -LongName ignore-signature-status-codes -Description $msg.ignore_signature_status_code -Arguments @{ Name = 'IGNORE_STATUS_CODE'; Candidates = $signatureStatusCodes }
$keyringParam             = New-ParamCompleter -LongName keyring -Description $msg.collection_keyring -Arguments @{ Name = 'KEYRING'; Type = 'File' }
$offlineParam             = New-ParamCompleter -LongName offline -Description $msg.offline
$requiredValidSignatureCountParam = New-ParamCompleter -LongName required-valid-signature-count -Description $msg.required_valid_signature_count -Arguments @{ Name = 'REQUIRED_VALID_SIGNATURE_COUNT' }
$signatureParam           = New-ParamCompleter -LongName signature -Description $msg.signature -Arguments @{ Name = 'SIGNATURES' }
$forceWithDepsParam       = New-ParamCompleter -LongName force-with-deps -Description $msg.force_with_deps
$clearResponseCacheParam  = New-ParamCompleter -LongName clear-response-cache -Description $msg.clear_response_cache
$forceParam               = New-ParamCompleter -ShortName f -LongName force -Description $msg.force
$ignoreErrorsParam        = New-ParamCompleter -ShortName i -LongName ignore-errors -Description $msg.ignore_errors
$noDepsParam              = New-ParamCompleter -ShortName n -LongName no-deps -Description $msg.no_deps
$preParam                 = New-ParamCompleter -LongName pre -Description $msg.pre
$requirementsFileParam    = New-ParamCompleter -ShortName r -LongName requirements-file -Description $msg.collection_requirements_file -Arguments @{ Name = 'REQUIREMENTS'; Type = 'File' }
$rolesPathParam           = New-ParamCompleter -ShortName p -LongName roles-path -Description $msg.roles_path -Arguments @{ Name = 'ROLES_PATH'; Type = 'Directory' }

$commonParams = @(
    $apiKeyParam
    $ignoreCertsParam
    $timeoutParam
    $serverParam
    $verboseParam
    $helpParam
    $versionParam
)

Register-NativeCompleter -Name ansible-galaxy -Description $msg.ansible_galaxy -Parameters @(
    $helpParam
    $versionParam
    $verboseParam
) -SubCommands @(

    #
    # collection
    #
    New-CommandCompleter -Name collection -Description $msg.collection -Parameters $helpParam -SubCommands @(

        New-CommandCompleter -Name download -Description $msg.collection_download -Parameters @(
            $clearResponseCacheParam
            $noCacheParam
            $preParam
            $timeoutParam
            $noDepsParam
            New-ParamCompleter -ShortName p -LongName download-path -Description $msg.collection_download_output_path -Arguments @{ Name = 'DOWNLOAD_PATH'; Type = 'Directory' }
            $requirementsFileParam
            $commonParams
        )

        New-CommandCompleter -Name init -Description $msg.collection_init -Parameters @(
            New-ParamCompleter -LongName collection-skeleton -Description $msg.collection_init_collection_skeleton -Arguments @{ Name = 'COLLECTION_SKELETON'; Type = 'Directory' }
            New-ParamCompleter -LongName init-path -Description $msg.collection_init_init_path -Arguments @{ Name = 'INIT_PATH'; Type = 'Directory' }
            New-ParamCompleter -ShortName f -LongName force -Description $msg.force
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name build -Description $msg.collection_build -Parameters @(
            New-ParamCompleter -LongName output-path -Description $msg.collection_build_output_path -Arguments @{ Name = 'OUTPUT_PATH'; Type = 'Directory' }
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name publish -Description $msg.collection_publish -Parameters @(
            New-ParamCompleter -LongName import-timeout -Description $msg.collection_publish_import_timeout -Arguments @{ Name = 'IMPORT_TIMEOUT' }
            New-ParamCompleter -LongName no-wait -Description $msg.collection_publish_no_wait
            $commonParams
        ) -Arguments @{
            Name = 'collection_path';
            Script = {
                param([int] $position, [int] $argIndex)
                if ($argIndex -eq 0) {
                    [MT.Comp.Helper]::CompleteFilename($this, $false, $false, {
                        $_.Attributes.HasFlag([System.IO.FileAttributes]::Directory) -or $_.Name -match '\.tar\.gz$'
                    })
                }
            }
        }

        New-CommandCompleter -Name install -Description $msg.collection_install -Parameters @(
            $clearResponseCacheParam
            New-ParamCompleter -LongName disable-gpg-verify -Description $msg.disable_gpg_verify
            $forceWithDepsParam
            $ignoreSignatureParam
            $ignoreSignaturesParam
            $keyringParam
            $offlineParam
            $requiredValidSignatureCountParam
            $signatureParam
            New-ParamCompleter -ShortName U -LongName upgrade -Description $msg.collection_install_upgrade
            New-ParamCompleter -ShortName f -LongName force -Description $msg.force
            $noDepsParam
            New-ParamCompleter -ShortName p -LongName collections-path -Description $msg.collection_install_collections_path -Arguments @{ Name = 'COLLECTIONS_PATH'; Type = 'Directory' }
            $requirementsFileParam
            $preParam
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name list -Description $msg.collection_list -Parameters @(
            New-ParamCompleter -LongName format -Description $msg.format -Arguments @{ Name = 'FORMAT'; Candidates = 'human','yaml','json'; }
            New-ParamCompleter -ShortName p -LongName collections-path -Description $msg.collection_list_collections_path -Arguments @{ Name = 'COLLECTIONS_PATH'; Type = 'Directory' }
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name verify -Description $msg.collection_verify -Parameters @(
            $ignoreSignatureParam
            $ignoreSignaturesParam
            $keyringParam
            $offlineParam
            $requiredValidSignatureCountParam
            $signatureParam
            New-ParamCompleter -ShortName p -LongName collections-path -Description $msg.collection_verify_collections_path -Arguments @{ Name = 'COLLECTIONS_PATH'; Type = 'Directory' }
            $requirementsFileParam
            $commonParams
        ) -NoFileCompletions
    )

    #
    # role
    #
    New-CommandCompleter -Name role -Description $msg.role -Parameters $helpParam -SubCommands @(

        New-CommandCompleter -Name init -Description $msg.role_init -Parameters @(
            New-ParamCompleter -LongName init-path -Description $msg.role_init_init_path -Arguments @{ Name = 'INIT_PATH'; Type = 'Directory' }
            $offlineParam
            New-ParamCompleter -LongName role-skeleton -Description $msg.role_init_role_skeleton -Arguments @{ Name = 'ROLE_SKELETON'; Type = 'Directory' }
            $forceParam
            New-ParamCompleter -LongName type -Description $msg.role_init_type -Arguments @{ Name = 'TYPE'; Candidates = 'container','apb','network'; } 
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name remove -Description $msg.role_remove -Parameters @(
            $rolesPathParam
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name delete -Description $msg.role_delete -Parameters $commonParams -NoFileCompletions

        New-CommandCompleter -Name list -Description $msg.role_list -Parameters @(
            $rolesPathParam
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name search -Description $msg.role_search -Parameters @(
            New-ParamCompleter -LongName author -Description $msg.role_search_author -Arguments @{ Name = 'AUTHOR' }
            New-ParamCompleter -LongName galaxy-tags -Description $msg.role_search_galaxy_tags -Arguments @{ Name = 'GALAXY_TAGS'; List = $true; }
            New-ParamCompleter -LongName platforms -Description $msg.role_search_platforms -Arguments @{ Name = 'PLATFORMS'; List = $true; }
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name import -Description $msg.role_import -Parameters @(
            New-ParamCompleter -LongName branch -Description $msg.role_import_branch -Arguments @{ Name = 'BRANCH' }
            New-ParamCompleter -LongName no-wait -Description $msg.role_import_no_wait
            New-ParamCompleter -LongName role-name -Description $msg.role_import_role_name -Arguments @{ Name = 'ROLE_NAME' }
            New-ParamCompleter -LongName status -Description "Check the status of the most recent import request"
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name setup -Description $msg.role_setup -Parameters @(
            New-ParamCompleter -LongName list -Description "List all GitHub integrations"
            New-ParamCompleter -LongName remove -Description "Remove a GitHub integration" -Arguments @{ Name = 'REMOVE_ID' }
            $rolesPathParam
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name info -Description $msg.role_info -Parameters @(
            New-ParamCompleter -LongName offline -Description $msg.role_info_offline
            $rolesPathParam
            $commonParams
        ) -NoFileCompletions

        New-CommandCompleter -Name install -Description $msg.role_install -Parameters @(
            $forceWithDepsParam
            $forceParam
            $ignoreErrorsParam
            New-ParamCompleter -ShortName g -LongName keep-scm-meta -Description $msg.role_install_keep_scm_meta
            $noDepsParam
            $rolesPathParam
            New-ParamCompleter -ShortName r -LongName role-file -Description $msg.role_install_requirements_file -Arguments @{ Name = 'ROLE_FILE'; Type = 'File' }
            $commonParams
        ) -NoFileCompletions
    )
) -NoFileCompletions
