<#
 # docker completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    docker                          = A self-sufficient runtime for containers
    config                          = Manage Swarm configs
    container                       = Manage containers
    context                         = Manage contexts
    image                           = Manage images
    manifest                        = Manage Docker image manifests and manifest lists
    network                         = Manage networks
    node                            = Manage Swarm nodes
    plugin                          = Manage plugins
    secret                          = Manage Swarm secrets
    service                         = Manage Swarm services
    stack                           = Manage Swarm stacks
    system                          = Manage Docker
    volume                          = Manage volumes
    attach                          = Attach local standard input, output, and error streams to a running container
    build                           = Build an image from a Dockerfile
    commit                          = Create a new image from a container's changes
    cp                              = Copy files/folders between a container and the local filesystem
    create                          = Create a new container
    deploy                          = Deploy a new stack or update an existing stack
    diff                            = Inspect changes to files or directories on a container's filesystem
    events                          = Get real time events from the server
    exec                            = Execute a command in a running container
    export                          = Export a container's filesystem as a tar archive
    history                         = Show the history of an image
    images                          = List images
    import                          = Import the contents from a tarball to create a filesystem image
    info                            = Display system-wide information
    inspect                         = Return low-level information on Docker objects
    kill                            = Kill one or more running containers
    load                            = Load an image from a tar archive or STDIN
    login                           = Authenticate to a registry
    logout                          = Log out from a registry
    logs                            = Fetch the logs of a container
    pause                           = Pause all processes within one or more containers
    port                            = List port mappings or a specific mapping for the container
    ps                              = List containers
    pull                            = Download an image from a registry
    push                            = Upload an image to a registry
    rename                          = Rename a container
    restart                         = Restart one or more containers
    rm                              = Remove one or more containers
    rmi                             = Remove one or more images
    run                             = Create and run a new container from an image
    save                            = Save one or more images to a tar archive (streamed to STDOUT by default)
    search                          = Search Docker Hub for images
    start                           = Start one or more stopped containers
    stats                           = Display a live stream of container(s) resource usage statistics
    stop                            = Stop one or more running containers
    tag                             = Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
    top                             = Display the running processes of a container
    unpause                         = Unpause all processes within one or more containers
    update                          = Update configuration of one or more containers
    version                         = Show the Docker version information
    wait                            = Block until one or more containers stop, then print their exit codes

    global_config                   = Location of client config files
    global_context                  = Name of the context to use to connect to the daemon
    global_debug                    = Enable debug mode
    global_host                     = Daemon socket to connect to
    global_log_level                = Set the logging level
    global_tls                      = Use TLS; implied by --tlsverify
    global_tlscacert                = Trust certs signed only by this CA
    global_tlscert                  = Path to TLS certificate file
    global_tlskey                   = Path to TLS key file
    global_tlsverify                = Use TLS and verify the remote
    global_help                     = Print usage
    global_version                  = Print version information and quit

    config_create                   = Create a config from a file or STDIN
    config_inspect                  = Display detailed information on one or more configs
    config_ls                       = List configs
    config_rm                       = Remove one or more configs

    run_attach                      = Attach STDIN, STDOUT or STDERR
    run_blkio_weight                = Block IO weight (relative weight, between 10 and 1000, or 0 to disable)
    run_cap_add                     = Add Linux capabilities
    run_cap_drop                    = Drop Linux capabilities
    run_cgroup_parent               = Optional parent cgroup for the container
    run_cgroupns                    = Cgroup namespace to use
    run_cidfile                     = Write the container ID to the file
    run_cpu_period                  = Limit CPU CFS period
    run_cpu_quota                   = Limit CPU CFS quota
    run_cpu_rt_period               = Limit CPU real-time period in microseconds
    run_cpu_rt_runtime              = Limit CPU real-time runtime in microseconds
    run_cpu_shares                  = CPU shares (relative weight)
    run_cpus                        = Number of CPUs
    run_cpuset_cpus                 = CPUs in which to allow execution
    run_cpuset_mems                 = MEMs in which to allow execution
    run_detach                      = Run container in background and print container ID
    run_detach_keys                 = Override the key sequence for detaching a container
    run_device                      = Add a host device to the container
    run_device_cgroup_rule          = Add a rule to the cgroup allowed devices list
    run_device_read_bps             = Limit read rate (bytes per second) from a device
    run_device_read_iops            = Limit read rate (IO per second) from a device
    run_device_write_bps            = Limit write rate (bytes per second) to a device
    run_device_write_iops           = Limit write rate (IO per second) to a device
    run_disable_content_trust       = Skip image verification
    run_dns                         = Set custom DNS servers
    run_dns_option                  = Set DNS options
    run_dns_search                  = Set custom DNS search domains
    run_domainname                  = Container NIS domain name
    run_entrypoint                  = Overwrite the default ENTRYPOINT of the image
    run_env                         = Set environment variables
    run_env_file                    = Read in a file of environment variables
    run_expose                      = Expose a port or a range of ports
    run_gpus                        = GPU devices to add to the container
    run_group_add                   = Add additional groups to join
    run_health_cmd                  = Command to run to check health
    run_health_interval             = Time between running the check
    run_health_retries              = Consecutive failures needed to report unhealthy
    run_health_start_period         = Start period for the container to initialize before starting health-retries countdown
    run_health_timeout              = Maximum time to allow one check to run
    run_hostname                    = Container host name
    run_init                        = Run an init inside the container that forwards signals and reaps processes
    run_interactive                 = Keep STDIN open even if not attached
    run_ip                          = IPv4 address (e.g., 172.30.100.104)
    run_ip6                         = IPv6 address (e.g., 2001:db8::33)
    run_ipc                         = IPC mode to use
    run_isolation                   = Container isolation technology
    run_kernel_memory               = Kernel memory limit
    run_label                       = Set meta data on a container
    run_label_file                  = Read in a line delimited file of labels
    run_link                        = Add link to another container
    run_link_local_ip               = Container IPv4/IPv6 link-local addresses
    run_log_driver                  = Logging driver for the container
    run_log_opt                     = Log driver options
    run_mac_address                 = Container MAC address (e.g., 92:d0:c6:0a:29:33)
    run_memory                      = Memory limit
    run_memory_reservation          = Memory soft limit
    run_memory_swap                 = Swap limit equal to memory plus swap: -1 to enable unlimited swap
    run_memory_swappiness           = Tune container memory swappiness (between 0 and 100)
    run_mount                       = Attach a filesystem mount to the container
    run_name                        = Assign a name to the container
    run_network                     = Connect a container to a network
    run_network_alias               = Add network-scoped alias for the container
    run_no_healthcheck              = Disable any container-specified HEALTHCHECK
    run_oom_kill_disable            = Disable OOM Killer
    run_oom_score_adj               = Tune host's OOM preferences (between -1000 and 1000)
    run_pid                         = PID namespace to use
    run_pids_limit                  = Tune container pids limit (set -1 for unlimited)
    run_platform                    = Set platform if server is multi-platform capable
    run_privileged                  = Give extended privileges to this container
    run_publish                     = Publish a container's port(s) to the host
    run_publish_all                 = Publish all exposed ports to random ports
    run_pull                        = Pull image before running
    run_quiet                       = Suppress the pull output
    run_read_only                   = Mount the container's root filesystem as read only
    run_restart                     = Restart policy to apply when a container exits
    run_rm                          = Automatically remove the container and its associated anonymous volumes when it exits
    run_runtime                     = Runtime to use for this container
    run_security_opt                = Security options
    run_shm_size                    = Size of /dev/shm
    run_sig_proxy                   = Proxy received signals to the process
    run_stop_signal                 = Signal to stop the container
    run_stop_timeout                = Timeout (in seconds) to stop a container
    run_storage_opt                 = Storage driver options for the container
    run_sysctl                      = Sysctl options
    run_tmpfs                       = Mount a tmpfs directory
    run_tty                         = Allocate a pseudo-TTY
    run_ulimit                      = Ulimit options
    run_user                        = Username or UID
    run_userns                      = User namespace to use
    run_uts                         = UTS namespace to use
    run_volume                      = Bind mount a volume
    run_volume_driver               = Optional volume driver for the container
    run_volumes_from                = Mount volumes from the specified container(s)
    run_workdir                     = Working directory inside the container

    build_add_host                  = Add a custom host-to-IP mapping
    build_build_arg                 = Set build-time variables
    build_cache_from                = Images to consider as cache sources
    build_cgroup_parent             = Set the parent cgroup for the RUN instructions during build
    build_compress                  = Compress the build context using gzip
    build_cpu_period                = Limit the CPU CFS period
    build_cpu_quota                 = Limit the CPU CFS quota
    build_cpu_shares                = CPU shares (relative weight)
    build_cpuset_cpus               = CPUs in which to allow execution during build
    build_cpuset_mems               = MEMs in which to allow execution during build
    build_disable_content_trust     = Skip image verification
    build_file                      = Name of the Dockerfile
    build_force_rm                  = Always remove intermediate containers
    build_iidfile                   = Write the image ID to the file
    build_isolation                 = Container isolation technology
    build_label                     = Set metadata for an image
    build_memory                    = Memory limit
    build_memory_swap               = Swap limit equal to memory plus swap: -1 to enable unlimited swap
    build_network                   = Set the networking mode for the RUN instructions during build
    build_no_cache                  = Do not use cache when building the image
    build_output                    = Output destination
    build_platform                  = Set platform if server is multi-platform capable
    build_progress                  = Set type of progress output
    build_pull                      = Always attempt to pull a newer version of the image
    build_quiet                     = Suppress the build output and print image ID on success
    build_rm                        = Remove intermediate containers after a successful build
    build_secret                    = Secret to expose to the build
    build_shm_size                  = Size of /dev/shm
    build_squash                    = Squash newly built layers into a single new layer
    build_ssh                       = SSH agent socket or keys to expose to the build
    build_tag                       = Name and optionally a tag in the name:tag format
    build_target                    = Set the target build stage to build
    build_ulimit                    = Ulimit options

    manifest_annotate               = Add additional information to a local image manifest
    manifest_create                 = Create a local manifest list for annotating and pushing to a registry
    manifest_inspect                = Display an image manifest, or manifest list
    manifest_push                   = Push a manifest list to a repository
    manifest_rm                     = Delete one or more manifest lists from local storage

    ps_all                          = Show all containers (default shows just running)
    ps_filter                       = Filter output based on conditions provided
    ps_format                       = Format output using a custom template
    ps_last                         = Show n last created containers
    ps_latest                       = Show the latest created container
    ps_no_trunc                     = Don't truncate output
    ps_quiet                        = Only display container IDs
    ps_size                         = Display total file sizes

    images_all                      = Show all images (default hides intermediate images)
    images_digests                  = Show digests
    images_filter                   = Filter output based on conditions provided
    images_format                   = Format output using a custom template
    images_no_trunc                 = Don't truncate output
    images_quiet                    = Only show image IDs

    logs_details                    = Show extra details provided to logs
    logs_follow                     = Follow log output
    logs_since                      = Show logs since timestamp
    logs_tail                       = Number of lines to show from the end of the logs
    logs_timestamps                 = Show timestamps
    logs_until                      = Show logs before a timestamp

    exec_detach                     = Detached mode: run command in the background
    exec_detach_keys                = Override the key sequence for detaching a container
    exec_env                        = Set environment variables
    exec_env_file                   = Read in a file of environment variables
    exec_interactive                = Keep STDIN open even if not attached
    exec_privileged                 = Give extended privileges to the command
    exec_tty                        = Allocate a pseudo-TTY
    exec_user                       = Username or UID
    exec_workdir                    = Working directory inside the container

    rm_force                        = Force the removal of a running container (uses SIGKILL)
    rm_link                         = Remove the specified link
    rm_volumes                      = Remove anonymous volumes associated with the container

    rmi_force                       = Force removal of the image
    rmi_no_prune                    = Do not delete untagged parents

    pull_all_tags                   = Download all tagged images in the repository
    pull_disable_content_trust      = Skip image verification
    pull_platform                   = Set platform if server is multi-platform capable
    pull_quiet                      = Suppress verbose output

    push_all_tags                   = Push all tags of an image to the repository
    push_disable_content_trust      = Skip image verification
    push_quiet                      = Suppress verbose output

    stop_signal                     = Signal to send to the container
    stop_timeout                    = Seconds to wait before killing the container

    restart_signal                  = Signal to send to the container
    restart_timeout                 = Seconds to wait before killing the container

    kill_signal                     = Signal to send to the container

    commit_author                   = Author
    commit_change                   = Apply Dockerfile instruction to the created image
    commit_message                  = Commit message
    commit_pause                    = Pause container during commit

    container_prune                 = Remove all stopped containers
    container_prune_force           = Do not prompt for confirmation
    container_prune_filter          = Provide filter values

    context_create                  = Create a context
    context_export                  = Export a context to a tar archive FILE or a tar stream on STDOUT
    context_import                  = Import a context from a tar or zip file
    context_inspect                 = Display detailed information on one or more contexts
    context_ls                      = List contexts
    context_rm                      = Remove one or more contexts
    context_show                    = Print the name of the current context
    context_update                  = Update a context
    context_use                     = Set the current docker context

    image_prune                     = Remove unused images
    image_prune_all                 = Remove all unused images, not just dangling ones
    image_prune_filter              = Provide filter values
    image_prune_force               = Do not prompt for confirmation

    inspect_format                  = Format output using a custom template
    inspect_size                    = Display total file sizes if the type is container
    inspect_type                    = Return JSON for specified type
    inspect_verbose                 = Verbose output for diagnostics

    network_connect                 = Connect a container to a network
    network_create                  = Create a network
    network_disconnect              = Disconnect a container from a network
    network_inspect                 = Display detailed information on one or more networks
    network_ls                      = List networks
    network_prune                   = Remove all unused networks
    network_rm                      = Remove one or more networks

    network_create_attachable       = Enable manual container attachment
    network_create_aux_address      = Auxiliary IPv4 or IPv6 addresses used by Network driver
    network_create_config_from      = The network from which to copy the configuration
    network_create_config_only      = Create a configuration only network
    network_create_driver           = Driver to manage the Network
    network_create_gateway          = IPv4 or IPv6 Gateway for the master subnet
    network_create_ingress          = Create swarm routing-mesh network
    network_create_internal         = Restrict external access to the network
    network_create_ip_range         = Allocate container ip from a sub-range
    network_create_ipam_driver      = IP Address Management Driver
    network_create_ipam_opt         = Set IPAM driver specific options
    network_create_ipv6             = Enable IPv6 networking
    network_create_label            = Set metadata on a network
    network_create_opt              = Set driver specific options
    network_create_scope            = Control the network's scope
    network_create_subnet           = Subnet in CIDR format that represents a network segment

    network_ls_filter               = Provide filter values
    network_ls_format               = Format output using a custom template
    network_ls_no_trunc             = Do not truncate the output
    network_ls_quiet                = Only display network IDs

    network_prune_filter            = Provide filter values
    network_prune_force             = Do not prompt for confirmation

    volume_create                   = Create a volume
    volume_create_driver            = Specify volume driver name
    volume_create_label             = Set metadata for a volume
    volume_create_name              = Specify volume name
    volume_create_opt               = Set driver specific options
    volume_inspect                  = Display detailed information on one or more volumes
    volume_ls                       = List volumes
    volume_ls_filter                = Provide filter values
    volume_ls_format                = Format output using a custom template
    volume_ls_quiet                 = Only display volume names
    volume_prune                    = Remove unused local volumes
    volume_prune_all                = Remove all unused volumes, not just anonymous ones
    volume_prune_filter             = Provide filter values
    volume_prune_force              = Do not prompt for confirmation
    volume_rm                       = Remove one or more volumes
    volume_rm_force                 = Force the removal of one or more volumes

    node_demote                     = Demote one or more nodes from manager in the swarm
    node_inspect                    = Display detailed information on one or more nodes
    node_ls                         = List nodes in the swarm
    node_promote                    = Promote one or more nodes to manager in the swarm
    node_ps                         = List tasks running on one or more nodes, defaults to current node
    node_rm                         = Remove one or more nodes from the swarm
    node_update                     = Update a node

    plugin_create                   = Create a plugin from a rootfs and configuration
    plugin_disable                  = Disable a plugin
    plugin_enable                   = Enable a plugin
    plugin_inspect                  = Display detailed information on one or more plugins
    plugin_install                  = Install a plugin
    plugin_ls                       = List plugins
    plugin_push                     = Push a plugin to a registry
    plugin_rm                       = Remove one or more plugins
    plugin_set                      = Change settings for a plugin
    plugin_upgrade                  = Upgrade an existing plugin

    secret_create                   = Create a secret from a file or STDIN as content
    secret_inspect                  = Display detailed information on one or more secrets
    secret_ls                       = List secrets
    secret_rm                       = Remove one or more secrets
    service_create                  = Create a new service
    service_inspect                 = Display detailed information on one or more services
    service_logs                    = Fetch the logs of a service or task
    service_ls                      = List services
    service_ps                      = List the tasks of one or more services
    service_rm                      = Remove one or more services
    service_rollback                = Revert changes to a service config
    service_scale                   = Scale one or multiple replicated services
    service_update                  = Update a service

    stack_config                    = Outputs the final config file, after doing merges and interpolations
    stack_deploy                    = Deploy a new stack or update an existing stack
    stack_ls                        = List stacks
    stack_ps                        = List the tasks in the stack
    stack_rm                        = Remove one or more stacks
    stack_services                  = List the services in the stack

    system_df                       = Show docker disk usage
    system_df_format                = Format output using a custom template
    system_df_verbose               = Show detailed information on space usage
    system_events                   = Get real time events from the server
    system_info                     = Display system-wide information
    system_info_format              = Format output using a custom template
    system_prune                    = Remove unused data

    system_prune_all                = Remove all unused images not just dangling ones
    system_prune_filter             = Provide filter values
    system_prune_force              = Do not prompt for confirmation
    system_prune_volumes            = Prune anonymous volumes

    search_filter                   = Filter output based on conditions provided
    search_format                   = Format output using a custom template
    search_limit                    = Max number of search results
    search_no_trunc                 = Don't truncate output

    login_password                  = Password
    login_password_stdin            = Take the password from stdin
    login_username                  = Username

    stats_all                       = Show all containers (default shows just running)
    stats_format                    = Format output using a custom template
    stats_no_stream                 = Disable streaming stats and only pull the first result
    stats_no_trunc                  = Do not truncate output

    update_blkio_weight             = Block IO (relative weight), between 10 and 1000, or 0 to disable
    update_cpu_period               = Limit CPU CFS period
    update_cpu_quota                = Limit CPU CFS quota
    update_cpu_rt_period            = Limit CPU real-time period in microseconds
    update_cpu_rt_runtime           = Limit CPU real-time runtime in microseconds
    update_cpu_shares               = CPU shares (relative weight)
    update_cpus                     = Number of CPUs
    update_cpuset_cpus              = CPUs in which to allow execution
    update_cpuset_mems              = MEMs in which to allow execution
    update_memory                   = Memory limit
    update_memory_reservation       = Memory soft limit
    update_memory_swap              = Swap limit equal to memory plus swap: -1 to enable unlimited swap
    update_memory_swappiness        = Tune container memory swappiness
    update_pids_limit               = Tune container pids limit (set -1 for unlimited)
    update_restart                  = Restart policy to apply when a container exits

    history_format                  = Format output using a custom template
    history_human                   = Print sizes and dates in human readable format
    history_no_trunc                = Don't truncate output
    history_quiet                   = Only show image IDs

    save_output                     = Write to a file, instead of STDOUT

    load_input                      = Read from tar archive file, instead of STDIN
    load_quiet                      = Suppress the load output

    import_change                   = Apply Dockerfile instruction to the created image
    import_message                  = Set commit message for imported image
    import_platform                 = Set platform if server is multi-platform capable

    events_filter                   = Filter output based on conditions provided
    events_format                   = Format output using a custom template
    events_since                    = Show all events created since timestamp
    events_until                    = Stream events until this timestamp

    port_desc                       = List port mappings or a specific mapping for the container

    top_desc                        = Display the running processes of a container

    diff_desc                       = Inspect changes to files or directories on a container's filesystem

    export_output                   = Write to a file, instead of STDOUT

    cp_archive                      = Archive mode (copy all uid/gid information)
    cp_follow_link                  = Always follow symbol link in SRC_PATH
    cp_quiet                        = Suppress progress output during copy

    wait_desc                       = Block until one or more containers stop, then print their exit codes

    rename_desc                     = Rename a container

    pause_desc                      = Pause all processes within one or more containers

    unpause_desc                    = Unpause all processes within one or more containers

    version_format                  = Format output using a custom template
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$containerCompleter = {
    docker ps --format "{{.Names}}\t{{.Image}} ({{.Status}})" 2>/dev/null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$allContainerCompleter = {
    docker ps -a --format "{{.Names}}\t{{.Image}} ({{.Status}})" 2>/dev/null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$imageCompleter = {
    docker images --format "{{.Repository}}:{{.Tag}}\t{{.ID}} ({{.Size}})" 2>/dev/null |
        Where-Object { $_ -ne "<none>:<none>" -and $_ -like "$wordToComplete*" }
}

$networkCompleter = {
    docker network ls --format "{{.Name}}\t{{.Driver}} ({{.Scope}})" 2>/dev/null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$volumeCompleter = {
    docker volume ls --format "{{.Name}}\t{{.Driver}}" 2>/dev/null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$contextCompleter = {
    docker context ls --format "{{.Name}}\t{{.Description}}" 2>/dev/null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$commonRunParams = @(
    New-ParamCompleter -ShortName a -LongName attach                -Description $msg.run_attach              -Arguments "STDIN","STDOUT","STDERR"
    New-ParamCompleter              -LongName blkio-weight          -Description $msg.run_blkio_weight        -Type Required -VariableName 'WEIGHT'
    New-ParamCompleter              -LongName cap-add               -Description $msg.run_cap_add             -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName cap-drop              -Description $msg.run_cap_drop            -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName cgroup-parent         -Description $msg.run_cgroup_parent       -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName cgroupns              -Description $msg.run_cgroupns            -Arguments "host","private" -VariableName 'MODE'
    New-ParamCompleter              -LongName cidfile               -Description $msg.run_cidfile             -Type File -VariableName 'STRING'
    New-ParamCompleter              -LongName cpu-period            -Description $msg.run_cpu_period          -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-quota             -Description $msg.run_cpu_quota           -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-period         -Description $msg.run_cpu_rt_period       -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-runtime        -Description $msg.run_cpu_rt_runtime      -Type Required -VariableName 'INT'
    New-ParamCompleter -ShortName c -LongName cpu-shares            -Description $msg.run_cpu_shares          -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName cpus                  -Description $msg.run_cpus                -Type Required -VariableName 'DECIMAL'
    New-ParamCompleter              -LongName cpuset-cpus           -Description $msg.run_cpuset_cpus         -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName cpuset-mems           -Description $msg.run_cpuset_mems         -Type Required -VariableName 'STRING'
    New-ParamCompleter -ShortName d -LongName detach                -Description $msg.run_detach
    New-ParamCompleter              -LongName detach-keys           -Description $msg.run_detach_keys         -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName device                -Description $msg.run_device              -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName device-cgroup-rule    -Description $msg.run_device_cgroup_rule  -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName device-read-bps       -Description $msg.run_device_read_bps     -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName device-read-iops      -Description $msg.run_device_read_iops    -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName device-write-bps      -Description $msg.run_device_write_bps    -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName device-write-iops     -Description $msg.run_device_write_iops   -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName disable-content-trust -Description $msg.run_disable_content_trust
    New-ParamCompleter              -LongName dns                   -Description $msg.run_dns                 -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName dns-option            -Description $msg.run_dns_option          -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName dns-search            -Description $msg.run_dns_search          -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName domainname            -Description $msg.run_domainname          -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName entrypoint            -Description $msg.run_entrypoint          -Type Required -VariableName 'STRING'
    New-ParamCompleter -ShortName e -LongName env                   -Description $msg.run_env                 -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName env-file              -Description $msg.run_env_file            -Type File -VariableName 'LIST'
    New-ParamCompleter              -LongName expose                -Description $msg.run_expose              -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName gpus                  -Description $msg.run_gpus                -Type Required -VariableName 'GPU-REQUEST'
    New-ParamCompleter              -LongName group-add             -Description $msg.run_group_add           -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName health-cmd            -Description $msg.run_health_cmd          -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName health-interval       -Description $msg.run_health_interval     -Type Required -VariableName 'DURATION'
    New-ParamCompleter              -LongName health-retries        -Description $msg.run_health_retries      -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName health-start-period   -Description $msg.run_health_start_period -Type Required -VariableName 'DURATION'
    New-ParamCompleter              -LongName health-timeout        -Description $msg.run_health_timeout      -Type Required -VariableName 'DURATION'
    New-ParamCompleter -ShortName h -LongName hostname              -Description $msg.run_hostname            -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName init                  -Description $msg.run_init
    New-ParamCompleter -ShortName i -LongName interactive           -Description $msg.run_interactive
    New-ParamCompleter              -LongName ip                    -Description $msg.run_ip                  -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName ip6                   -Description $msg.run_ip6                 -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName ipc                   -Description $msg.run_ipc                 -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName isolation             -Description $msg.run_isolation           -Arguments "default","process","hyperv" -VariableName 'STRING'
    New-ParamCompleter              -LongName kernel-memory         -Description $msg.run_kernel_memory       -Type Required -VariableName 'BYTES'
    New-ParamCompleter -ShortName l -LongName label                 -Description $msg.run_label               -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName label-file            -Description $msg.run_label_file          -Type File -VariableName 'LIST'
    New-ParamCompleter              -LongName link                  -Description $msg.run_link                -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName link-local-ip         -Description $msg.run_link_local_ip       -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName log-driver            -Description $msg.run_log_driver          -Arguments "json-file","syslog","journald","gelf","fluentd","awslogs","splunk","none" -VariableName 'STRING'
    New-ParamCompleter              -LongName log-opt               -Description $msg.run_log_opt             -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName mac-address           -Description $msg.run_mac_address         -Type Required -VariableName 'STRING'
    New-ParamCompleter -ShortName m -LongName memory                -Description $msg.run_memory              -Type Required -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-reservation    -Description $msg.run_memory_reservation  -Type Required -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swap           -Description $msg.run_memory_swap         -Type Required -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swappiness     -Description $msg.run_memory_swappiness   -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName mount                 -Description $msg.run_mount               -Type Required -VariableName 'MOUNT'
    New-ParamCompleter              -LongName name                  -Description $msg.run_name                -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName network               -Description $msg.run_network             -ArgumentCompleter $networkCompleter -VariableName 'NETWORK'
    New-ParamCompleter              -LongName network-alias         -Description $msg.run_network_alias       -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName no-healthcheck        -Description $msg.run_no_healthcheck
    New-ParamCompleter              -LongName oom-kill-disable      -Description $msg.run_oom_kill_disable
    New-ParamCompleter              -LongName oom-score-adj         -Description $msg.run_oom_score_adj       -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName pid                   -Description $msg.run_pid                 -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName pids-limit            -Description $msg.run_pids_limit          -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName platform              -Description $msg.run_platform            -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName privileged            -Description $msg.run_privileged
    New-ParamCompleter -ShortName p -LongName publish               -Description $msg.run_publish             -Type Required -VariableName 'LIST'
    New-ParamCompleter -ShortName P -LongName publish-all           -Description $msg.run_publish_all
    New-ParamCompleter              -LongName pull                  -Description $msg.run_pull                -Arguments "always","missing","never" -VariableName 'STRING'
    New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.run_quiet
    New-ParamCompleter              -LongName read-only             -Description $msg.run_read_only
    New-ParamCompleter              -LongName restart               -Description $msg.run_restart             -Arguments "no","always","on-failure","unless-stopped" -VariableName 'STRING'
    New-ParamCompleter              -LongName rm                    -Description $msg.run_rm
    New-ParamCompleter              -LongName runtime               -Description $msg.run_runtime             -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName security-opt          -Description $msg.run_security_opt        -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName shm-size              -Description $msg.run_shm_size            -Type Required -VariableName 'BYTES'
    New-ParamCompleter              -LongName sig-proxy             -Description $msg.run_sig_proxy
    New-ParamCompleter              -LongName stop-signal           -Description $msg.run_stop_signal         -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName stop-timeout          -Description $msg.run_stop_timeout        -Type Required -VariableName 'INT'
    New-ParamCompleter              -LongName storage-opt           -Description $msg.run_storage_opt         -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName sysctl                -Description $msg.run_sysctl              -Type Required -VariableName 'MAP'
    New-ParamCompleter              -LongName tmpfs                 -Description $msg.run_tmpfs               -Type Required -VariableName 'LIST'
    New-ParamCompleter -ShortName t -LongName tty                   -Description $msg.run_tty
    New-ParamCompleter              -LongName ulimit                -Description $msg.run_ulimit              -Type Required -VariableName 'ULIMIT'
    New-ParamCompleter -ShortName u -LongName user                  -Description $msg.run_user                -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName userns                -Description $msg.run_userns              -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName uts                   -Description $msg.run_uts                 -Type Required -VariableName 'STRING'
    New-ParamCompleter -ShortName v -LongName volume                -Description $msg.run_volume              -Type Required -VariableName 'LIST'
    New-ParamCompleter              -LongName volume-driver         -Description $msg.run_volume_driver       -Type Required -VariableName 'STRING'
    New-ParamCompleter              -LongName volumes-from          -Description $msg.run_volumes_from        -Type Required -VariableName 'LIST'
    New-ParamCompleter -ShortName w -LongName workdir               -Description $msg.run_workdir             -Type Directory -VariableName 'STRING'
)

Register-NativeCompleter -Name docker -Description $msg.docker -Parameters @(
    New-ParamCompleter              -LongName config        -Description $msg.global_config    -Type Directory -VariableName 'STRING'
    New-ParamCompleter -ShortName c -LongName context       -Description $msg.global_context   -ArgumentCompleter $contextCompleter -VariableName 'STRING'
    New-ParamCompleter -ShortName D -LongName debug         -Description $msg.global_debug
    New-ParamCompleter -ShortName H -LongName host          -Description $msg.global_host      -Type Required -VariableName 'LIST'
    New-ParamCompleter -ShortName l -LongName log-level     -Description $msg.global_log_level -Arguments "debug","info","warn","error","fatal" -VariableName 'STRING'
    New-ParamCompleter              -LongName tls           -Description $msg.global_tls
    New-ParamCompleter              -LongName tlscacert     -Description $msg.global_tlscacert -Type File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlscert       -Description $msg.global_tlscert   -Type File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlskey        -Description $msg.global_tlskey    -Type File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlsverify     -Description $msg.global_tlsverify
    New-ParamCompleter -ShortName v -LongName version       -Description $msg.global_version
) -SubCommands @(

    #
    # Management commands
    #

    New-CommandCompleter -Name config -Description $msg.config -SubCommands @(
        New-CommandCompleter -Name create  -Description $msg.config_create
        New-CommandCompleter -Name inspect -Description $msg.config_inspect
        New-CommandCompleter -Name ls      -Description $msg.config_list
        New-CommandCompleter -Name rm      -Description $msg.config_rm
    ) -NoFileCompletions

    New-CommandCompleter -Name container -Description $msg.container -SubCommands @(
        New-CommandCompleter -Name attach  -Description $msg.attach  -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name commit  -Description $msg.commit  -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter -ShortName a -LongName author  -Description $msg.commit_author  -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName c -LongName change  -Description $msg.commit_change  -Type Required -VariableName 'LIST'
            New-ParamCompleter -ShortName m -LongName message -Description $msg.commit_message -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName p -LongName pause   -Description $msg.commit_pause
        )
        New-CommandCompleter -Name cp      -Description $msg.cp -Parameters @(
            New-ParamCompleter -ShortName a -LongName archive     -Description $msg.cp_archive
            New-ParamCompleter -ShortName L -LongName follow-link -Description $msg.cp_follow_link
            New-ParamCompleter -ShortName q -LongName quiet       -Description $msg.cp_quiet
        )
        New-CommandCompleter -Name create  -Description $msg.create  -Parameters $commonRunParams -ArgumentCompleter $imageCompleter
        New-CommandCompleter -Name diff    -Description $msg.diff    -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name exec    -Description $msg.exec    -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
            New-ParamCompleter -ShortName d -LongName detach       -Description $msg.exec_detach
            New-ParamCompleter              -LongName detach-keys  -Description $msg.exec_detach_keys -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName e -LongName env          -Description $msg.exec_env         -Type Required -VariableName 'LIST'
            New-ParamCompleter              -LongName env-file     -Description $msg.exec_env_file    -Type File -VariableName 'LIST'
            New-ParamCompleter -ShortName i -LongName interactive  -Description $msg.exec_interactive
            New-ParamCompleter              -LongName privileged   -Description $msg.exec_privileged
            New-ParamCompleter -ShortName t -LongName tty          -Description $msg.exec_tty
            New-ParamCompleter -ShortName u -LongName user         -Description $msg.exec_user        -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName w -LongName workdir      -Description $msg.exec_workdir     -Type Directory -VariableName 'STRING'
        )
        New-CommandCompleter -Name export  -Description $msg.export -Parameters @(
            New-ParamCompleter -ShortName o -LongName output -Description $msg.export_output -Type File -VariableName 'STRING'
        ) -NoFileCompletions -ArgumentCompleter $allContainerCompleter
        New-CommandCompleter -Name inspect -Description $msg.inspect -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName s -LongName size   -Description $msg.inspect_size
        )
        New-CommandCompleter -Name kill    -Description $msg.kill -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
            New-ParamCompleter -ShortName s -LongName signal -Description $msg.kill_signal -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name logs    -Description $msg.logs -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter              -LongName details    -Description $msg.logs_details
            New-ParamCompleter -ShortName f -LongName follow     -Description $msg.logs_follow
            New-ParamCompleter              -LongName since      -Description $msg.logs_since      -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName n -LongName tail       -Description $msg.logs_tail       -Arguments "all" -VariableName 'STRING'
            New-ParamCompleter -ShortName t -LongName timestamps -Description $msg.logs_timestamps
            New-ParamCompleter              -LongName until      -Description $msg.logs_until      -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name ls      -Description $msg.ps -Parameters @(
            New-ParamCompleter -ShortName a -LongName all      -Description $msg.ps_all
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.ps_filter   -Type Required -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.ps_format   -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName n -LongName last     -Description $msg.ps_last     -Type Required -VariableName 'INT'
            New-ParamCompleter -ShortName l -LongName latest   -Description $msg.ps_latest
            New-ParamCompleter              -LongName no-trunc -Description $msg.ps_no_trunc
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.ps_quiet
            New-ParamCompleter -ShortName s -LongName size     -Description $msg.ps_size
        ) -NoFileCompletions
        New-CommandCompleter -Name pause   -Description $msg.pause   -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name port    -Description $msg.port    -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name prune   -Description $msg.container_prune -Parameters @(
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.container_prune_force
            New-ParamCompleter              -LongName filter -Description $msg.container_prune_filter -Type Required -VariableName 'FILTER'
        ) -NoFileCompletions
        New-CommandCompleter -Name rename  -Description $msg.rename  -NoFileCompletions -ArgumentCompleter $allContainerCompleter
        New-CommandCompleter -Name restart -Description $msg.restart -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
            New-ParamCompleter -ShortName s -LongName signal  -Description $msg.restart_signal  -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName t -LongName timeout -Description $msg.restart_timeout -Type Required -VariableName 'INT'
        )
        New-CommandCompleter -Name rm      -Description $msg.rm -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName force   -Description $msg.rm_force
            New-ParamCompleter -ShortName l -LongName link    -Description $msg.rm_link
            New-ParamCompleter -ShortName v -LongName volumes -Description $msg.rm_volumes
        )
        New-CommandCompleter -Name run     -Description $msg.run -Parameters $commonRunParams -ArgumentCompleter $imageCompleter
        New-CommandCompleter -Name start   -Description $msg.start   -NoFileCompletions -ArgumentCompleter $allContainerCompleter
        New-CommandCompleter -Name stats   -Description $msg.stats   -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
            New-ParamCompleter -ShortName a -LongName all       -Description $msg.stats_all
            New-ParamCompleter -LongName format                 -Description $msg.stats_format    -Type Required -VariableName 'STRING'
            New-ParamCompleter -LongName no-stream              -Description $msg.stats_no_stream
            New-ParamCompleter -LongName no-trunc               -Description $msg.stats_no_trunc
        )
        New-CommandCompleter -Name stop    -Description $msg.stop -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
            New-ParamCompleter -ShortName s -LongName signal  -Description $msg.stop_signal  -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName t -LongName timeout -Description $msg.stop_timeout -Type Required -VariableName 'INT'
        )
        New-CommandCompleter -Name top     -Description $msg.top     -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name unpause -Description $msg.unpause -NoFileCompletions -ArgumentCompleter $containerCompleter
        New-CommandCompleter -Name update  -Description $msg.update  -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter              -LongName blkio-weight        -Description $msg.update_blkio_weight        -Type Required -VariableName 'UINT16'
            New-ParamCompleter              -LongName cpu-period          -Description $msg.update_cpu_period          -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpu-quota           -Description $msg.update_cpu_quota           -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpu-rt-period       -Description $msg.update_cpu_rt_period       -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpu-rt-runtime      -Description $msg.update_cpu_rt_runtime      -Type Required -VariableName 'INT'
            New-ParamCompleter -ShortName c -LongName cpu-shares          -Description $msg.update_cpu_shares          -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpus                -Description $msg.update_cpus                -Type Required -VariableName 'DECIMAL'
            New-ParamCompleter              -LongName cpuset-cpus         -Description $msg.update_cpuset_cpus         -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName cpuset-mems         -Description $msg.update_cpuset_mems         -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName m -LongName memory              -Description $msg.update_memory              -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName memory-reservation  -Description $msg.update_memory_reservation  -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName memory-swap         -Description $msg.update_memory_swap         -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName memory-swappiness   -Description $msg.update_memory_swappiness   -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName pids-limit          -Description $msg.update_pids_limit          -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName restart             -Description $msg.update_restart             -Arguments "no","always","on-failure","unless-stopped" -VariableName 'STRING'
        )
        New-CommandCompleter -Name wait    -Description $msg.wait    -NoFileCompletions -ArgumentCompleter $containerCompleter
    ) -NoFileCompletions

    New-CommandCompleter -Name context -Description $msg.context -SubCommands @(
        New-CommandCompleter -Name create  -Description $msg.context_create
        New-CommandCompleter -Name export  -Description $msg.context_export
        New-CommandCompleter -Name import  -Description $msg.context_import
        New-CommandCompleter -Name inspect -Description $msg.context_inspect -NoFileCompletions -ArgumentCompleter $contextCompleter
        New-CommandCompleter -Name ls      -Description $msg.context_ls      -NoFileCompletions
        New-CommandCompleter -Name rm      -Description $msg.context_rm      -NoFileCompletions -ArgumentCompleter $contextCompleter
        New-CommandCompleter -Name show    -Description $msg.context_show    -NoFileCompletions
        New-CommandCompleter -Name update  -Description $msg.context_update  -NoFileCompletions -ArgumentCompleter $contextCompleter
        New-CommandCompleter -Name use     -Description $Msg.context_use     -NoFileCompletions -ArgumentCompleter $contextCompleter
    ) -NoFileCompletions

    New-CommandCompleter -Name image -Description $msg.image -SubCommands @(
        New-CommandCompleter -Name build   -Description $msg.build -Parameters @(
            New-ParamCompleter              -LongName add-host              -Description $msg.build_add_host      -Type Required -VariableName 'LIST'
            New-ParamCompleter              -LongName build-arg             -Description $msg.build_build_arg     -Type Required -VariableName 'LIST'
            New-ParamCompleter              -LongName cache-from            -Description $msg.build_cache_from    -Type Required -VariableName 'STRINGS'
            New-ParamCompleter              -LongName cgroup-parent         -Description $msg.build_cgroup_parent -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName compress              -Description $msg.build_compress
            New-ParamCompleter              -LongName cpu-period            -Description $msg.build_cpu_period    -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpu-quota             -Description $msg.build_cpu_quota     -Type Required -VariableName 'INT'
            New-ParamCompleter -ShortName c -LongName cpu-shares            -Description $msg.build_cpu_shares    -Type Required -VariableName 'INT'
            New-ParamCompleter              -LongName cpuset-cpus           -Description $msg.build_cpuset_cpus   -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName cpuset-mems           -Description $msg.build_cpuset_mems   -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName disable-content-trust -Description $msg.build_disable_content_trust
            New-ParamCompleter -ShortName f -LongName file                  -Description $msg.build_file          -Type File -VariableName 'STRING'
            New-ParamCompleter              -LongName force-rm              -Description $msg.build_force_rm
            New-ParamCompleter              -LongName iidfile               -Description $msg.build_iidfile       -Type File -VariableName 'STRING'
            New-ParamCompleter              -LongName isolation             -Description $msg.build_isolation     -Arguments "default","process","hyperv" -VariableName 'STRING'
            New-ParamCompleter              -LongName label                 -Description $msg.build_label         -Type Required -VariableName 'LIST'
            New-ParamCompleter -ShortName m -LongName memory                -Description $msg.build_memory        -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName memory-swap           -Description $msg.build_memory_swap   -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName network               -Description $msg.build_network       -ArgumentCompleter $networkCompleter -VariableName 'STRING'
            New-ParamCompleter              -LongName no-cache              -Description $msg.build_no_cache
            New-ParamCompleter -ShortName o -LongName output                -Description $msg.build_output        -Type Required -VariableName 'STRINGARRAY'
            New-ParamCompleter              -LongName platform              -Description $msg.build_platform      -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName progress              -Description $msg.build_progress      -Arguments "auto","plain","tty" -VariableName 'STRING'
            New-ParamCompleter              -LongName pull                  -Description $msg.build_pull
            New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.build_quiet
            New-ParamCompleter              -LongName rm                    -Description $msg.build_rm
            New-ParamCompleter              -LongName secret                -Description $msg.build_secret        -Type Required -VariableName 'STRINGARRAY'
            New-ParamCompleter              -LongName shm-size              -Description $msg.build_shm_size      -Type Required -VariableName 'BYTES'
            New-ParamCompleter              -LongName squash                -Description $msg.build_squash
            New-ParamCompleter              -LongName ssh                   -Description $msg.build_ssh           -Type Required -VariableName 'STRINGARRAY'
            New-ParamCompleter -ShortName t -LongName tag                   -Description $msg.build_tag           -Type Required -VariableName 'LIST'
            New-ParamCompleter              -LongName target                -Description $msg.build_target        -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName ulimit                -Description $msg.build_ulimit        -Type Required -VariableName 'ULIMIT'
        )
        New-CommandCompleter -Name history -Description $msg.history -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter              -LongName format   -Description $msg.history_format   -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName H -LongName human    -Description $msg.history_human
            New-ParamCompleter              -LongName no-trunc -Description $msg.history_no_trunc
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.history_quiet
        )
        New-CommandCompleter -Name import  -Description $msg.import -Parameters @(
            New-ParamCompleter -ShortName c -LongName change   -Description $msg.import_change   -Type Required -VariableName 'LIST'
            New-ParamCompleter -ShortName m -LongName message  -Description $msg.import_message  -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName platform -Description $msg.import_platform -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name inspect -Description $msg.inspect -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name load    -Description $msg.load -Parameters @(
            New-ParamCompleter -ShortName i -LongName input -Description $msg.load_input -Type File -VariableName 'STRING'
            New-ParamCompleter -ShortName q -LongName quiet -Description $msg.load_quiet
        )
        New-CommandCompleter -Name ls      -Description $msg.images -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName a -LongName all      -Description $msg.images_all
            New-ParamCompleter              -LongName digests  -Description $msg.images_digests
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.images_filter   -Type Required -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.images_format   -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName no-trunc -Description $msg.images_no_trunc
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.images_quiet
        )
        New-CommandCompleter -Name prune   -Description $msg.image_prune -Parameters @(
            New-ParamCompleter -ShortName a -LongName all    -Description $msg.image_prune_all
            New-ParamCompleter              -LongName filter -Description  $msg.image_prune_filter -Type Required -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.image_prune_force
        ) -NoFileCompletions
        New-CommandCompleter -Name pull    -Description $msg.pull -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName a -LongName all-tags              -Description $msg.pull_all_tags
            New-ParamCompleter              -LongName disable-content-trust -Description $msg.pull_disable_content_trust
            New-ParamCompleter              -LongName platform              -Description $msg.pull_platform -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.pull_quiet
        )
        New-CommandCompleter -Name push    -Description $msg.push -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName a -LongName all-tags              -Description $msg.push_all_tags
            New-ParamCompleter              -LongName disable-content-trust -Description $msg.push_disable_content_trust
            New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.push_quiet
        )
        New-CommandCompleter -Name rm      -Description $msg.rmi -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName force    -Description $msg.rmi_force
            New-ParamCompleter              -LongName no-prune -Description $msg.rmi_no_prune
        )
        New-CommandCompleter -Name save    -Description $msg.save -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName o -LongName output -Description $msg.save_output -Type File -VariableName 'STRING'
        )
        New-CommandCompleter -Name tag     -Description $msg.tag -NoFileCompletions -ArgumentCompleter $imageCompleter
    ) -NoFileCompletions

    New-CommandCompleter -Name network -Description $msg.network -SubCommands @(
        New-CommandCompleter -Name connect    -Description $msg.network_connect    -NoFileCompletions -ArgumentCompleter $networkCompleter
        New-CommandCompleter -Name create     -Description $msg.network_create     -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName attachable   -Description $msg.network_create_attachable
            New-ParamCompleter              -LongName aux-address  -Description $msg.network_create_aux_address  -Type Required -VariableName 'MAP'
            New-ParamCompleter              -LongName config-from  -Description $msg.network_create_config_from  -Type Required -VariableName 'NETWORK'
            New-ParamCompleter              -LongName config-only  -Description $msg.network_create_config_only
            New-ParamCompleter -ShortName d -LongName driver       -Description $msg.network_create_driver       -Arguments "bridge","host","overlay","macvlan","none" -VariableName 'STRING'
            New-ParamCompleter              -LongName gateway      -Description $msg.network_create_gateway      -Type Required -VariableName 'STRINGS'
            New-ParamCompleter              -LongName ingress      -Description $msg.network_create_ingress
            New-ParamCompleter              -LongName internal     -Description $msg.network_create_internal
            New-ParamCompleter              -LongName ip-range     -Description $msg.network_create_ip_range     -Type Required -VariableName 'STRINGS'
            New-ParamCompleter              -LongName ipam-driver  -Description $msg.network_create_ipam_driver  -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName ipam-opt     -Description $msg.network_create_ipam_opt     -Type Required -VariableName 'MAP'
            New-ParamCompleter              -LongName ipv6         -Description $msg.network_create_ipv6
            New-ParamCompleter              -LongName label        -Description $msg.network_create_label        -Type Required -VariableName 'LIST'
            New-ParamCompleter -ShortName o -LongName opt          -Description $msg.network_create_opt          -Type Required -VariableName 'MAP'
            New-ParamCompleter              -LongName scope        -Description $msg.network_create_scope        -Arguments "local","swarm","global" -VariableName 'STRING'
            New-ParamCompleter              -LongName subnet       -Description $msg.network_create_subnet       -Type Required -VariableName 'STRINGS'
        )
        New-CommandCompleter -Name disconnect -Description $msg.network_disconnect -NoFileCompletions -ArgumentCompleter $networkCompleter
        New-CommandCompleter -Name inspect    -Description $msg.network_inspect    -NoFileCompletions -ArgumentCompleter $networkCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format  -Description $msg.inspect_format -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName verbose -Description $msg.inspect_verbose
        )
        New-CommandCompleter -Name ls         -Description $msg.network_ls         -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.network_ls_filter   -Type Required -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.network_ls_format   -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName no-trunc -Description $msg.network_ls_no_trunc
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.network_ls_quiet
        )
        New-CommandCompleter -Name prune      -Description $msg.network_prune      -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName filter -Description $msg.network_prune_filter -Type Required -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.network_prune_force
        )
        New-CommandCompleter -Name rm         -Description $msg.network_rm         -NoFileCompletions -ArgumentCompleter $networkCompleter
    ) -NoFileCompletions

    New-CommandCompleter -Name node -Description $msg.node -SubCommands @(
        New-CommandCompleter -Name demote   -Description $msg.node_demote
        New-CommandCompleter -Name inspect  -Description $msg.node_inspect
        New-CommandCompleter -Name ls       -Description $msg.node_ls
        New-CommandCompleter -Name promote  -Description $msg.node_promote
        New-CommandCompleter -Name ps       -Description $msg.node_ps
        New-CommandCompleter -Name rm       -Description $msg.node_rm
        New-CommandCompleter -Name update   -Description $msg.node_update
    ) -NoFileCompletions

    New-CommandCompleter -Name plugin -Description $msg.plugin -SubCommands @(
        New-CommandCompleter -Name create   -Description $msg.plugin_create
        New-CommandCompleter -Name disable  -Description $msg.plugin_disable
        New-CommandCompleter -Name enable   -Description $msg.plugin_enable
        New-CommandCompleter -Name inspect  -Description $msg.plugin_inspect
        New-CommandCompleter -Name install  -Description $msg.plugin_install
        New-CommandCompleter -Name ls       -Description $msg.plugin_ls
        New-CommandCompleter -Name push     -Description $msg.plugin_push
        New-CommandCompleter -Name rm       -Description $msg.plugin_rm
        New-CommandCompleter -Name set      -Description $msg.plugin_set
        New-CommandCompleter -Name upgrade  -Description $msg.plugin_upgrade
    ) -NoFileCompletions

    New-CommandCompleter -Name secret -Description $msg.secret -SubCommands @(
        New-CommandCompleter -Name create   -Description $msg.secret_create
        New-CommandCompleter -Name inspect  -Description $msg.secret_inspect
        New-CommandCompleter -Name ls       -Description $msg.secret_ls
        New-CommandCompleter -Name rm       -Description $msg.secret_rm
    ) -NoFileCompletions

    New-CommandCompleter -Name service -Description $msg.service -SubCommands @(
        New-CommandCompleter -Name create   -Description $msg.service_create
        New-CommandCompleter -Name inspect  -Description $msg.service_inspect
        New-CommandCompleter -Name logs     -Description $msg.service_logs
        New-CommandCompleter -Name ls       -Description $msg.service_ls
        New-CommandCompleter -Name ps       -Description $msg.service_ps
        New-CommandCompleter -Name rm       -Description $msg.service_rm
        New-CommandCompleter -Name rollback -Description $msg.service_rollback
        New-CommandCompleter -Name scale    -Description $msg.service_scale
        New-CommandCompleter -Name update   -Description $msg.service_update
    ) -NoFileCompletions

    New-CommandCompleter -Name stack -Description $msg.stack -SubCommands @(
        New-CommandCompleter -Name config   -Description $msg.stack_config
        New-CommandCompleter -Name deploy   -Description $msg.stack_deploy
        New-CommandCompleter -Name ls       -Description $msg.stack_ls
        New-CommandCompleter -Name ps       -Description $msg.stack_ps
        New-CommandCompleter -Name rm       -Description $msg.stack_rm
        New-CommandCompleter -Name services -Description $msg.stack_services
    ) -NoFileCompletions

    New-CommandCompleter -Name system -Description $msg.system -SubCommands @(
        New-CommandCompleter -Name df     -Description $msg.system_df -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName format  -Description $msg.system_df_format -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName v -LongName verbose -Description $msg.system_df_verbose
        )
        New-CommandCompleter -Name events -Description $msg.system_events -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName filter  -Description $msg.events_filter -Type Required -VariableName 'FILTER'
            New-ParamCompleter              -LongName format  -Description $msg.events_format -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName since   -Description $msg.events_since  -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName until   -Description $msg.events_until  -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name info   -Description $msg.system_info -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.system_info_format -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name prune  -Description $msg.system_prune -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName a -LongName all     -Description $msg.system_prune_all
            New-ParamCompleter              -LongName filter  -Description $msg.system_prune_filter  -Type Required -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force   -Description $msg.system_prune_force
            New-ParamCompleter              -LongName volumes -Description $msg.system_prune_volumes
        )
    ) -NoFileCompletions

    New-CommandCompleter -Name volume -Description $msg.volume -SubCommands @(
        New-CommandCompleter -Name create   -Description $msg.volume_create -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName d -LongName driver -Description $msg.volume_create_driver -Type Required -VariableName 'STRING'
            New-ParamCompleter              -LongName label  -Description $msg.volume_create_label  -Type Required -VariableName 'LIST'
            New-ParamCompleter              -LongName name   -Description $msg.volume_create_name   -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName o -LongName opt    -Description $msg.volume_create_opt    -Type Required -VariableName 'MAP'
        )
        New-CommandCompleter -Name inspect  -Description $msg.volume_inspect -NoFileCompletions -ArgumentCompleter $volumeCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -Type Required -VariableName 'STRING'
        )
        New-CommandCompleter -Name ls       -Description $msg.volume_ls -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.volume_ls_filter   -Type Required -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.volume_ls_format   -Type Required -VariableName 'STRING'
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.volume_ls_quiet
        )
        New-CommandCompleter -Name prune    -Description $msg.volume_prune -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName a -LongName all    -Description $msg.volume_prune_all
            New-ParamCompleter              -LongName filter -Description $msg.volume_prune_filter -Type Required -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.volume_prune_force
        )
        New-CommandCompleter -Name rm       -Description $msg.volume_rm -NoFileCompletions -ArgumentCompleter $volumeCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName force -Description $msg.volume_rm_force
        )
    ) -NoFileCompletions

    #
    # Top-level aliases / common commands
    #

    New-CommandCompleter -Name attach  -Description $msg.attach  -NoFileCompletions -ArgumentCompleter $containerCompleter
    New-CommandCompleter -Name build   -Description $msg.build -Parameters @(
        New-ParamCompleter              -LongName add-host              -Description $msg.build_add_host        -Type Required -VariableName 'LIST'
        New-ParamCompleter              -LongName build-arg             -Description $msg.build_build_arg       -Type Required -VariableName 'LIST'
        New-ParamCompleter              -LongName cache-from            -Description $msg.build_cache_from      -Type Required -VariableName 'STRINGS'
        New-ParamCompleter              -LongName cgroup-parent         -Description $msg.build_cgroup_parent   -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName compress              -Description $msg.build_compress
        New-ParamCompleter              -LongName cpu-period            -Description $msg.build_cpu_period      -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpu-quota             -Description $msg.build_cpu_quota       -Type Required -VariableName 'INT'
        New-ParamCompleter -ShortName c -LongName cpu-shares            -Description $msg.build_cpu_shares      -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpuset-cpus           -Description $msg.build_cpuset_cpus     -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName cpuset-mems           -Description $msg.build_cpuset_mems     -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName disable-content-trust -Description $msg.build_disable_content_trust
        New-ParamCompleter -ShortName f -LongName file                  -Description $msg.build_file            -Type File -VariableName 'STRING'
        New-ParamCompleter              -LongName force-rm              -Description $msg.build_force_rm
        New-ParamCompleter              -LongName iidfile               -Description $msg.build_iidfile         -Type File -VariableName 'STRING'
        New-ParamCompleter              -LongName isolation             -Description $msg.build_isolation       -Arguments "default","process","hyperv" -VariableName 'STRING'
        New-ParamCompleter              -LongName label                 -Description $msg.build_label           -Type Required -VariableName 'LIST'
        New-ParamCompleter -ShortName m -LongName memory                -Description $msg.build_memory          -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName memory-swap           -Description $msg.build_memory_swap     -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName network               -Description $msg.build_network         -ArgumentCompleter $networkCompleter -VariableName 'STRING'
        New-ParamCompleter              -LongName no-cache              -Description $msg.build_no_cache
        New-ParamCompleter -ShortName o -LongName output                -Description $msg.build_output          -Type Required -VariableName 'STRINGARRAY'
        New-ParamCompleter              -LongName platform              -Description $msg.build_platform        -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName progress              -Description $msg.build_progress        -Arguments "auto","plain","tty" -VariableName 'STRING'
        New-ParamCompleter              -LongName pull                  -Description $msg.build_pull
        New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.build_quiet
        New-ParamCompleter              -LongName rm                    -Description $msg.build_rm
        New-ParamCompleter              -LongName secret                -Description $msg.build_secret          -Type Required -VariableName 'STRINGARRAY'
        New-ParamCompleter              -LongName shm-size              -Description $msg.build_shm_size        -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName squash                -Description $msg.build_squash
        New-ParamCompleter              -LongName ssh                   -Description $msg.build_ssh             -Type Required -VariableName 'STRINGARRAY'
        New-ParamCompleter -ShortName t -LongName tag                   -Description $msg.build_tag             -Type Required -VariableName 'LIST'
        New-ParamCompleter              -LongName target                -Description $msg.build_target          -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName ulimit                -Description $msg.build_ulimit          -Type Required -VariableName 'ULIMIT'
    )

    New-CommandCompleter -Name commit  -Description $msg.commit  -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
        New-ParamCompleter -ShortName a -LongName author  -Description $msg.commit_author  -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName c -LongName change  -Description $msg.commit_change  -Type Required -VariableName 'LIST'
        New-ParamCompleter -ShortName m -LongName message -Description $msg.commit_message -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName p -LongName pause   -Description $msg.commit_pause
    )

    New-CommandCompleter -Name cp      -Description $msg.cp -Parameters @(
        New-ParamCompleter -ShortName a -LongName archive     -Description $msg.cp_archive
        New-ParamCompleter -ShortName L -LongName follow-link -Description $msg.cp_follow_link
        New-ParamCompleter -ShortName q -LongName quiet       -Description $msg.cp_quiet
    )

    New-CommandCompleter -Name create  -Description $msg.create  -Parameters $commonRunParams -ArgumentCompleter $imageCompleter

    New-CommandCompleter -Name deploy  -Description $msg.deploy

    New-CommandCompleter -Name diff    -Description $msg.diff    -NoFileCompletions -ArgumentCompleter $containerCompleter

    New-CommandCompleter -Name events  -Description $msg.events  -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName filter  -Description $msg.events_filter -Type Required -VariableName 'FILTER'
        New-ParamCompleter              -LongName format  -Description $msg.events_format -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName since   -Description $msg.events_since  -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName until   -Description $msg.events_until  -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name exec    -Description $msg.exec    -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
        New-ParamCompleter -ShortName d -LongName detach       -Description $msg.exec_detach
        New-ParamCompleter              -LongName detach-keys  -Description $msg.exec_detach_keys -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName e -LongName env          -Description $msg.exec_env         -Type Required -VariableName 'LIST'
        New-ParamCompleter              -LongName env-file     -Description $msg.exec_env_file    -Type File -VariableName 'LIST'
        New-ParamCompleter -ShortName i -LongName interactive  -Description $msg.exec_interactive
        New-ParamCompleter              -LongName privileged   -Description $msg.exec_privileged
        New-ParamCompleter -ShortName t -LongName tty          -Description $msg.exec_tty
        New-ParamCompleter -ShortName u -LongName user         -Description $msg.exec_user        -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName w -LongName workdir      -Description $msg.exec_workdir     -Type Directory -VariableName 'STRING'
    )

    New-CommandCompleter -Name export  -Description $msg.export -Parameters @(
        New-ParamCompleter -ShortName o -LongName output -Description $msg.export_output -Type File -VariableName 'STRING'
    ) -NoFileCompletions -ArgumentCompleter $allContainerCompleter

    New-CommandCompleter -Name history -Description $msg.history -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
        New-ParamCompleter              -LongName format   -Description $msg.history_format   -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName H -LongName human    -Description $msg.history_human
        New-ParamCompleter              -LongName no-trunc -Description $msg.history_no_trunc
        New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.history_quiet
    )

    New-CommandCompleter -Name images  -Description $msg.images  -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName a -LongName all      -Description $msg.images_all
        New-ParamCompleter              -LongName digests  -Description $msg.images_digests
        New-ParamCompleter -ShortName f -LongName filter   -Description $msg.images_filter   -Type Required -VariableName 'FILTER'
        New-ParamCompleter              -LongName format   -Description $msg.images_format   -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName no-trunc -Description $msg.images_no_trunc
        New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.images_quiet
    )

    New-CommandCompleter -Name import  -Description $msg.import -Parameters @(
        New-ParamCompleter -ShortName c -LongName change   -Description $msg.import_change   -Type Required -VariableName 'LIST'
        New-ParamCompleter -ShortName m -LongName message  -Description $msg.import_message  -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName platform -Description $msg.import_platform -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name info    -Description $msg.info    -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName format -Description 'Format output using a custom template' -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name inspect -Description $msg.inspect -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName s -LongName size   -Description $msg.inspect_size
        New-ParamCompleter              -LongName type   -Description $msg.inspect_type   -Arguments "container","image","network","node","plugin","secret","service","task","volume" -VariableName 'STRING'
    )

    New-CommandCompleter -Name kill    -Description $msg.kill    -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
        New-ParamCompleter -ShortName s -LongName signal -Description $msg.kill_signal -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name load    -Description $msg.load -Parameters @(
        New-ParamCompleter -ShortName i -LongName input -Description $msg.load_input -Type File -VariableName 'STRING'
        New-ParamCompleter -ShortName q -LongName quiet -Description $msg.load_quiet
    )

    New-CommandCompleter -Name login   -Description $msg.login   -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName p -LongName password       -Description $msg.login_password       -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName password-stdin -Description $msg.login_password_stdin
        New-ParamCompleter -ShortName u -LongName username       -Description $msg.login_username       -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name logout  -Description $msg.logout  -NoFileCompletions

    New-CommandCompleter -Name logs    -Description $msg.logs    -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
        New-ParamCompleter              -LongName details    -Description $msg.logs_details
        New-ParamCompleter -ShortName f -LongName follow     -Description $msg.logs_follow
        New-ParamCompleter              -LongName since      -Description $msg.logs_since      -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName n -LongName tail       -Description $msg.logs_tail       -Arguments "all" -VariableName 'STRING'
        New-ParamCompleter -ShortName t -LongName timestamps -Description $msg.logs_timestamps
        New-ParamCompleter              -LongName until      -Description $msg.logs_until      -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name manifest -Description $msg.manifest -SubCommands @(
        New-CommandCompleter -Name annotate -Description $msg.manifest_annotate
        New-CommandCompleter -Name create   -Description $msg.manifest_create
        New-CommandCompleter -Name inspect  -Description $msg.manifest_inspect
        New-CommandCompleter -Name push     -Description $msg.manifest_push
        New-CommandCompleter -Name rm       -Description $msg.manifest_rm
    ) -NoFileCompletions

    New-CommandCompleter -Name pause   -Description $msg.pause   -NoFileCompletions -ArgumentCompleter $containerCompleter

    New-CommandCompleter -Name port    -Description $msg.port    -NoFileCompletions -ArgumentCompleter $containerCompleter

    New-CommandCompleter -Name ps      -Description $msg.ps      -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName a -LongName all      -Description $msg.ps_all
        New-ParamCompleter -ShortName f -LongName filter   -Description $msg.ps_filter   -Type Required -VariableName 'FILTER'
        New-ParamCompleter              -LongName format   -Description $msg.ps_format   -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName n -LongName last     -Description $msg.ps_last     -Type Required -VariableName 'INT'
        New-ParamCompleter -ShortName l -LongName latest   -Description $msg.ps_latest
        New-ParamCompleter              -LongName no-trunc -Description $msg.ps_no_trunc
        New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.ps_quiet
        New-ParamCompleter -ShortName s -LongName size     -Description $msg.ps_size
    )

    New-CommandCompleter -Name pull    -Description $msg.pull    -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
        New-ParamCompleter -ShortName a -LongName all-tags            -Description $msg.pull_all_tags
        New-ParamCompleter -LongName disable-content-trust            -Description $msg.pull_disable_content_trust
        New-ParamCompleter -LongName platform                         -Description $msg.pull_platform -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName q -LongName quiet               -Description $msg.pull_quiet
    )

    New-CommandCompleter -Name push    -Description $msg.push    -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
        New-ParamCompleter -ShortName a -LongName all-tags              -Description $msg.push_all_tags
        New-ParamCompleter              -LongName disable-content-trust -Description $msg.push_disable_content_trust
        New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.push_quiet
    )

    New-CommandCompleter -Name rename  -Description $msg.rename  -NoFileCompletions -ArgumentCompleter $allContainerCompleter

    New-CommandCompleter -Name restart -Description $msg.restart -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
        New-ParamCompleter -ShortName s -LongName signal  -Description $msg.restart_signal  -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName t -LongName timeout -Description $msg.restart_timeout -Type Required -VariableName 'INT'
    )

    New-CommandCompleter -Name rm      -Description $msg.rm      -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
        New-ParamCompleter -ShortName f -LongName force   -Description $msg.rm_force
        New-ParamCompleter -ShortName l -LongName link    -Description $msg.rm_link
        New-ParamCompleter -ShortName v -LongName volumes -Description $msg.rm_volumes
    )

    New-CommandCompleter -Name rmi     -Description $msg.rmi     -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
        New-ParamCompleter -ShortName f -LongName force    -Description $msg.rmi_force
        New-ParamCompleter              -LongName no-prune -Description $msg.rmi_no_prune
    )

    New-CommandCompleter -Name run     -Description $msg.run     -Parameters $commonRunParams -ArgumentCompleter $imageCompleter

    New-CommandCompleter -Name save    -Description $msg.save    -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
        New-ParamCompleter -ShortName o -LongName output -Description $msg.save_output -Type File -VariableName 'STRING'
    )

    New-CommandCompleter -Name search  -Description $msg.search  -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName filter   -Description $msg.search_filter   -Type Required -VariableName 'FILTER'
        New-ParamCompleter              -LongName format   -Description $msg.search_format   -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName limit    -Description $msg.search_limit    -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName no-trunc -Description $msg.search_no_trunc
    )

    New-CommandCompleter -Name start   -Description $msg.start   -NoFileCompletions -ArgumentCompleter $allContainerCompleter

    New-CommandCompleter -Name stats   -Description $msg.stats   -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
        New-ParamCompleter -ShortName a -LongName all       -Description $msg.stats_all
        New-ParamCompleter              -LongName format    -Description $msg.stats_format    -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName no-stream -Description $msg.stats_no_stream
        New-ParamCompleter              -LongName no-trunc  -Description $msg.stats_no_trunc
    )

    New-CommandCompleter -Name stop    -Description $msg.stop    -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
        New-ParamCompleter -ShortName s -LongName signal  -Description $msg.stop_signal  -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName t -LongName timeout -Description $msg.stop_timeout -Type Required -VariableName 'INT'
    )

    New-CommandCompleter -Name tag     -Description $msg.tag     -NoFileCompletions -ArgumentCompleter $imageCompleter

    New-CommandCompleter -Name top     -Description $msg.top     -NoFileCompletions -ArgumentCompleter $containerCompleter

    New-CommandCompleter -Name unpause -Description $msg.unpause -NoFileCompletions -ArgumentCompleter $containerCompleter

    New-CommandCompleter -Name update  -Description $msg.update  -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
        New-ParamCompleter              -LongName blkio-weight        -Description $msg.update_blkio_weight        -Type Required -VariableName 'UINT16'
        New-ParamCompleter              -LongName cpu-period          -Description $msg.update_cpu_period          -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpu-quota           -Description $msg.update_cpu_quota           -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpu-rt-period       -Description $msg.update_cpu_rt_period       -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpu-rt-runtime      -Description $msg.update_cpu_rt_runtime      -Type Required -VariableName 'INT'
        New-ParamCompleter -ShortName c -LongName cpu-shares          -Description $msg.update_cpu_shares          -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName cpus                -Description $msg.update_cpus                -Type Required -VariableName 'DECIMAL'
        New-ParamCompleter              -LongName cpuset-cpus         -Description $msg.update_cpuset_cpus         -Type Required -VariableName 'STRING'
        New-ParamCompleter              -LongName cpuset-mems         -Description $msg.update_cpuset_mems         -Type Required -VariableName 'STRING'
        New-ParamCompleter -ShortName m -LongName memory              -Description $msg.update_memory              -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName memory-reservation  -Description $msg.update_memory_reservation  -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName memory-swap         -Description $msg.update_memory_swap         -Type Required -VariableName 'BYTES'
        New-ParamCompleter              -LongName memory-swappiness   -Description $msg.update_memory_swappiness   -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName pids-limit          -Description $msg.update_pids_limit          -Type Required -VariableName 'INT'
        New-ParamCompleter              -LongName restart             -Description $msg.update_restart             -Arguments "no","always","on-failure","unless-stopped" -VariableName 'STRING'
    )

    New-CommandCompleter -Name version -Description $msg.version -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName format -Description $msg.version_format -Type Required -VariableName 'STRING'
    )

    New-CommandCompleter -Name wait    -Description $msg.wait    -NoFileCompletions -ArgumentCompleter $containerCompleter
) -NoFileCompletions
