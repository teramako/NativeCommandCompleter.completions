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
    plugin                          = Manage plugins
    system                          = Manage Docker
    volume                          = Manage volumes
    info                            = Display system-wide information
    inspect                         = Return low-level information on Docker objects
    login                           = Authenticate to a registry
    logout                          = Log out from a registry
    restart                         = Restart one or more containers
    search                          = Search Docker Hub for images
    update                          = Update configuration of one or more containers
    version                         = Show the Docker version information

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

    manifest_annotate               = Add additional information to a local image manifest
    manifest_create                 = Create a local manifest list for annotating and pushing to a registry
    manifest_inspect                = Display an image manifest, or manifest list
    manifest_push                   = Push a manifest list to a repository
    manifest_rm                     = Delete one or more manifest lists from local storage

    restart_signal                  = Signal to send to the container
    restart_timeout                 = Seconds to wait before killing the container

    context_create                  = Create a context
    context_export                  = Export a context to a tar archive FILE or a tar stream on STDOUT
    context_import                  = Import a context from a tar or zip file
    context_inspect                 = Display detailed information on one or more contexts
    context_ls                      = List contexts
    context_rm                      = Remove one or more contexts
    context_show                    = Print the name of the current context
    context_update                  = Update a context
    context_use                     = Set the current docker context

    inspect_format                  = Format output using a custom template
    inspect_platform                = Inspect a specific platform of the multi-platform image.
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

    search_filter                   = Filter output based on conditions provided
    search_format                   = Format output using a custom template
    search_limit                    = Max number of search results
    search_no_trunc                 = Don't truncate output

    login_password                  = Password
    login_password_stdin            = Take the password from stdin
    login_username                  = Username

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

    container_attach                    = Attach local standard input, output, and error streams to a running container
    container_commit                    = Create a new image from a container's changes
    container_commit_author             = Author
    container_commit_change             = Apply Dockerfile instruction to the created image
    container_commit_message            = Commit message
    container_commit_no_pause           = Disable pausing container during commit
    container_create                    = Create a new container
    container_cp                        = Copy files/folders between a container and the local filesystem
    container_cp_archive                = Archive mode (copy all uid/gid information)
    container_cp_follow_link            = Always follow symbol link in SRC_PATH
    container_cp_quiet                  = Suppress progress output during copy
    container_diff                      = Inspect changes to files or directories on a container's filesystem
    container_exec                      = Execute a command in a running container
    container_exec_detach               = Detached mode: run command in the background
    container_exec_detach_keys          = Override the key sequence for detaching a container
    container_exec_env                  = Set environment variables
    container_exec_env_file             = Read in a file of environment variables
    container_exec_interactive          = Keep STDIN open even if not attached
    container_exec_privileged           = Give extended privileges to the command
    container_exec_tty                  = Allocate a pseudo-TTY
    container_exec_user                 = Username or UID
    container_exec_workdir              = Working directory inside the container
    container_export                    = Export a container's filesystem as a tar archive
    container_export_output             = Write to a file, instead of STDOUT
    container_inspect                   = Display detailed information on one or more containers
    container_kill                      = Kill one or more running containers
    container_kill_signal               = Signal to send to the container
    container_logs                      = Fetch the logs of a container
    container_logs_details              = Show extra details provided to logs
    container_logs_follow               = Follow log output
    container_logs_since                = Show logs since timestamp
    container_logs_tail                 = Number of lines to show from the end of the logs
    container_logs_timestamps           = Show timestamps
    container_logs_until                = Show logs before a timestamp
    container_pause                     = Pause all processes within one or more containers
    container_port                      = List port mappings or a specific mapping for the container
    container_prune                     = Remove all stopped containers
    container_prune_force               = Do not prompt for confirmation
    container_prune_filter              = Provide filter values
    container_ps                        = List containers
    container_ps_all                    = Show all containers (default shows just running)
    container_ps_filter                 = Filter output based on conditions provided
    container_ps_format                 = Format output using a custom template
    container_ps_last                   = Show n last created containers
    container_ps_latest                 = Show the latest created container
    container_ps_no_trunc               = Don't truncate output
    container_ps_quiet                  = Only display container IDs
    container_ps_size                   = Display total file sizes
    container_rename                    = Rename a container
    container_rm                        = Remove one or more containers
    container_rm_force                  = Force the removal of a running container (uses SIGKILL)
    container_rm_link                   = Remove the specified link
    container_rm_volumes                = Remove anonymous volumes associated with the container
    container_run                       = Create and run a new container from an image
    container_run_attach                = Attach STDIN, STDOUT or STDERR
    container_run_blkio_weight          = Block IO weight (relative weight, between 10 and 1000, or 0 to disable)
    container_run_cap_add               = Add Linux capabilities
    container_run_cap_drop              = Drop Linux capabilities
    container_run_cgroup_parent         = Optional parent cgroup for the container
    container_run_cgroupns              = Cgroup namespace to use
    container_run_cidfile               = Write the container ID to the file
    container_run_cpu_period            = Limit CPU CFS period
    container_run_cpu_quota             = Limit CPU CFS quota
    container_run_cpu_rt_period         = Limit CPU real-time period in microseconds
    container_run_cpu_rt_runtime        = Limit CPU real-time runtime in microseconds
    container_run_cpu_shares            = CPU shares (relative weight)
    container_run_cpus                  = Number of CPUs
    container_run_cpuset_cpus           = CPUs in which to allow execution
    container_run_cpuset_mems           = MEMs in which to allow execution
    container_run_detach                = Run container in background and print container ID
    container_run_detach_keys           = Override the key sequence for detaching a container
    container_run_device                = Add a host device to the container
    container_run_device_cgroup_rule    = Add a rule to the cgroup allowed devices list
    container_run_device_read_bps       = Limit read rate (bytes per second) from a device
    container_run_device_read_iops      = Limit read rate (IO per second) from a device
    container_run_device_write_bps      = Limit write rate (bytes per second) to a device
    container_run_device_write_iops     = Limit write rate (IO per second) to a device
    container_run_disable_content_trust = Skip image verification
    container_run_dns                   = Set custom DNS servers
    container_run_dns_option            = Set DNS options
    container_run_dns_search            = Set custom DNS search domains
    container_run_domainname            = Container NIS domain name
    container_run_entrypoint            = Overwrite the default ENTRYPOINT of the image
    container_run_env                   = Set environment variables
    container_run_env_file              = Read in a file of environment variables
    container_run_expose                = Expose a port or a range of ports
    container_run_gpus                  = GPU devices to add to the container
    container_run_group_add             = Add additional groups to join
    container_run_health_cmd            = Command to run to check health
    container_run_health_interval       = Time between running the check
    container_run_health_retries        = Consecutive failures needed to report unhealthy
    container_run_health_start_period   = Start period for the container to initialize before starting health-retries countdown
    container_run_health_timeout        = Maximum time to allow one check to run
    container_run_hostname              = Container host name
    container_run_init                  = Run an init inside the container that forwards signals and reaps processes
    container_run_interactive           = Keep STDIN open even if not attached
    container_run_ip                    = IPv4 address (e.g., 172.30.100.104)
    container_run_ip6                   = IPv6 address (e.g., 2001:db8::33)
    container_run_ipc                   = IPC mode to use
    container_run_isolation             = Container isolation technology
    container_run_kernel_memory         = Kernel memory limit
    container_run_label                 = Set meta data on a container
    container_run_label_file            = Read in a line delimited file of labels
    container_run_link                  = Add link to another container
    container_run_link_local_ip         = Container IPv4/IPv6 link-local addresses
    container_run_log_driver            = Logging driver for the container
    container_run_log_opt               = Log driver options
    container_run_mac_address           = Container MAC address (e.g., 92:d0:c6:0a:29:33)
    container_run_memory                = Memory limit
    container_run_memory_reservation    = Memory soft limit
    container_run_memory_swap           = Swap limit equal to memory plus swap: -1 to enable unlimited swap
    container_run_memory_swappiness     = Tune container memory swappiness (between 0 and 100)
    container_run_mount                 = Attach a filesystem mount to the container
    container_run_name                  = Assign a name to the container
    container_run_network               = Connect a container to a network
    container_run_network_alias         = Add network-scoped alias for the container
    container_run_no_healthcheck        = Disable any container-specified HEALTHCHECK
    container_run_oom_kill_disable      = Disable OOM Killer
    container_run_oom_score_adj         = Tune host's OOM preferences (between -1000 and 1000)
    container_run_pid                   = PID namespace to use
    container_run_pids_limit            = Tune container pids limit (set -1 for unlimited)
    container_run_platform              = Set platform if server is multi-platform capable
    container_run_privileged            = Give extended privileges to this container
    container_run_publish               = Publish a container's port(s) to the host
    container_run_publish_all           = Publish all exposed ports to random ports
    container_run_pull                  = Pull image before running
    container_run_quiet                 = Suppress the pull output
    container_run_read_only             = Mount the container's root filesystem as read only
    container_run_restart               = Restart policy to apply when a container exits
    container_run_rm                    = Automatically remove the container and its associated anonymous volumes when it exits
    container_run_runtime               = Runtime to use for this container
    container_run_security_opt          = Security options
    container_run_shm_size              = Size of /dev/shm
    container_run_sig_proxy             = Proxy received signals to the process
    container_run_stop_signal           = Signal to stop the container
    container_run_stop_timeout          = Timeout (in seconds) to stop a container
    container_run_storage_opt           = Storage driver options for the container
    container_run_sysctl                = Sysctl options
    container_run_tmpfs                 = Mount a tmpfs directory
    container_run_tty                   = Allocate a pseudo-TTY
    container_run_ulimit                = Ulimit options
    container_run_user                  = Username or UID
    container_run_userns                = User namespace to use
    container_run_uts                   = UTS namespace to use
    container_run_volume                = Bind mount a volume
    container_run_volume_driver         = Optional volume driver for the container
    container_run_volumes_from          = Mount volumes from the specified container(s)
    container_run_workdir               = Working directory inside the container
    container_start                     = Start one or more stopped containers
    container_stats                     = Display a live stream of container(s) resource usage statistics
    container_stats_all                 = Show all containers (default shows just running)
    container_stats_format              = Format output using a custom template
    container_stats_no_stream           = Disable streaming stats and only pull the first result
    container_stats_no_trunc            = Do not truncate output
    container_stop                      = Stop one or more running containers
    container_stop_signal               = Signal to send to the container
    container_stop_timeout              = Seconds to wait before killing the container
    container_top                       = Display the running processes of a container

    container_unpause                   = Unpause all processes within one or more containers
    container_wait                      = Block until one or more containers stop, then print their exit codes

    image_build                         = Build an image from a Dockerfile
    image_build_add_host                = Add a custom host-to-IP mapping
    image_build_build_arg               = Set build-time variables
    image_build_cache_from              = Images to consider as cache sources
    image_build_cgroup_parent           = Set the parent cgroup for the RUN instructions during build
    image_build_compress                = Compress the build context using gzip
    image_build_cpu_period              = Limit the CPU CFS period
    image_build_cpu_quota               = Limit the CPU CFS quota
    image_build_cpu_shares              = CPU shares (relative weight)
    image_build_cpuset_cpus             = CPUs in which to allow execution during build
    image_build_cpuset_mems             = MEMs in which to allow execution during build
    image_build_disable_content_trust   = Skip image verification
    image_build_file                    = Name of the Dockerfile
    image_build_force_rm                = Always remove intermediate containers
    image_build_iidfile                 = Write the image ID to the file
    image_build_isolation               = Container isolation technology
    image_build_label                   = Set metadata for an image
    image_build_memory                  = Memory limit
    image_build_memory_swap             = Swap limit equal to memory plus swap: -1 to enable unlimited swap
    image_build_network                 = Set the networking mode for the RUN instructions during build
    image_build_no_cache                = Do not use cache when building the image
    image_build_output                  = Output destination
    image_build_platform                = Set platform if server is multi-platform capable
    image_build_progress                = Set type of progress output
    image_build_pull                    = Always attempt to pull a newer version of the image
    image_build_quiet                   = Suppress the build output and print image ID on success
    image_build_rm                      = Remove intermediate containers after a successful build
    image_build_secret                  = Secret to expose to the build
    image_build_shm_size                = Size of /dev/shm
    image_build_squash                  = Squash newly built layers into a single new layer
    image_build_ssh                     = SSH agent socket or keys to expose to the build
    image_build_tag                     = Name and optionally a tag in the name:tag format
    image_build_target                  = Set the target build stage to build
    image_build_ulimit                  = Ulimit options
    image_import                        = Import the contents from a tarball to create a filesystem image
    image_import_change                 = Apply Dockerfile instruction to the created image
    image_import_message                = Set commit message for imported image
    image_import_platform               = Set platform if server is multi-platform capable
    image_inspect                       = Display detailed information on one or more images
    image_history                       = Show the history of an image
    image_history_format                = Format output using a custom template
    image_history_human                 = Print sizes and dates in human readable format
    image_history_no_trunc              = Don't truncate output
    image_history_quiet                 = Only show image IDs
    image_load                          = Load an image from a tar archive or STDIN
    image_load_input                    = Read from tar archive file, instead of STDIN
    image_load_quiet                    = Suppress the load output
    image_ls                            = List images
    image_ls_all                        = Show all images (default hides intermediate images)
    image_ls_digests                    = Show digests
    image_ls_filter                     = Filter output based on conditions provided
    image_ls_format                     = Format output using a custom template
    image_ls_no_trunc                   = Don't truncate output
    image_ls_quiet                      = Only show image IDs
    image_pull                          = Download an image from a registry
    image_pull_all_tags                 = Download all tagged images in the repository
    image_pull_disable_content_trust    = Skip image verification
    image_pull_platform                 = Set platform if server is multi-platform capable
    image_pull_quiet                    = Suppress verbose output
    image_push                          = Upload an image to a registry
    image_push_all_tags                 = Push all tags of an image to the repository
    image_push_disable_content_trust    = Skip image verification
    image_push_quiet                    = Suppress verbose output
    image_prune                         = Remove unused images
    image_prune_all                     = Remove all unused images, not just dangling ones
    image_prune_filter                  = Provide filter values
    image_prune_force                   = Do not prompt for confirmation
    image_rm                            = Remove one or more images
    image_rm_force                      = Force removal of the image
    image_rm_no_prune                   = Do not delete untagged parents
    image_save                          = Save one or more images to a tar archive (streamed to STDOUT by default)
    image_save_output                   = Write to a file, instead of STDOUT
    image_tag                           = Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

    system_events                   = Get real time events from the server
    system_events_filter            = Filter output based on conditions provided
    system_events_format            = Format output using a custom template
    system_events_since             = Show all events created since timestamp
    system_events_until             = Stream events until this timestamp
    system_df                       = Show docker disk usage
    system_df_format                = Format output using a custom template
    system_df_verbose               = Show detailed information on space usage
    system_info                     = Display system-wide information
    system_info_format              = Format output using a custom template
    system_prune                    = Remove unused data
    system_prune_all                = Remove all unused images not just dangling ones
    system_prune_filter             = Provide filter values
    system_prune_force              = Do not prompt for confirmation
    system_prune_volumes            = Prune anonymous volumes

    version_format                      = Format output using a custom template
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$containerCompleter = {
    docker ps --format "{{.Names}}\t{{.Image}} ({{.Status}})" 2>$null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$allContainerCompleter = {
    docker ps -a --format "{{.Names}}\t{{.Image}} ({{.Status}})" 2>$null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$imageCompleter = {
    docker images --format "{{.Repository}}:{{.Tag}}\t{{.ID}} ({{.Size}})" 2>$null |
        Where-Object { $_ -ne "<none>:<none>" -and $_ -like "$wordToComplete*" }
}

$networkCompleter = {
    docker network ls --format "{{.Name}}\t{{.Driver}} ({{.Scope}})" 2>$null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$volumeCompleter = {
    docker volume ls --format "{{.Name}}\t{{.Driver}}" 2>$null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$contextCompleter = {
    docker context ls --format "{{.Name}}\t{{.Description}}" 2>$null |
        Where-Object { $_ -like "$wordToComplete*" }
}

$commonRunParams = @(
    New-ParamCompleter -ShortName a -LongName attach                -Description $msg.container_run_attach              -Arguments "STDIN","STDOUT","STDERR"
    New-ParamCompleter              -LongName blkio-weight          -Description $msg.container_run_blkio_weight        -VariableName 'WEIGHT'
    New-ParamCompleter              -LongName cap-add               -Description $msg.container_run_cap_add             -VariableName 'LIST'
    New-ParamCompleter              -LongName cap-drop              -Description $msg.container_run_cap_drop            -VariableName 'LIST'
    New-ParamCompleter              -LongName cgroup-parent         -Description $msg.container_run_cgroup_parent       -VariableName 'STRING'
    New-ParamCompleter              -LongName cgroupns              -Description $msg.container_run_cgroupns            -Arguments "host","private" -VariableName 'MODE'
    New-ParamCompleter              -LongName cidfile               -Description $msg.container_run_cidfile             -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName cpu-period            -Description $msg.container_run_cpu_period          -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-quota             -Description $msg.container_run_cpu_quota           -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-period         -Description $msg.container_run_cpu_rt_period       -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-runtime        -Description $msg.container_run_cpu_rt_runtime      -VariableName 'INT'
    New-ParamCompleter -ShortName c -LongName cpu-shares            -Description $msg.container_run_cpu_shares          -VariableName 'INT'
    New-ParamCompleter              -LongName cpus                  -Description $msg.container_run_cpus                -VariableName 'DECIMAL'
    New-ParamCompleter              -LongName cpuset-cpus           -Description $msg.container_run_cpuset_cpus         -VariableName 'STRING'
    New-ParamCompleter              -LongName cpuset-mems           -Description $msg.container_run_cpuset_mems         -VariableName 'STRING'
    New-ParamCompleter -ShortName d -LongName detach                -Description $msg.container_run_detach
    New-ParamCompleter              -LongName detach-keys           -Description $msg.container_run_detach_keys         -VariableName 'STRING'
    New-ParamCompleter              -LongName device                -Description $msg.container_run_device              -VariableName 'LIST'
    New-ParamCompleter              -LongName device-cgroup-rule    -Description $msg.container_run_device_cgroup_rule  -VariableName 'LIST'
    New-ParamCompleter              -LongName device-read-bps       -Description $msg.container_run_device_read_bps     -VariableName 'LIST'
    New-ParamCompleter              -LongName device-read-iops      -Description $msg.container_run_device_read_iops    -VariableName 'LIST'
    New-ParamCompleter              -LongName device-write-bps      -Description $msg.container_run_device_write_bps    -VariableName 'LIST'
    New-ParamCompleter              -LongName device-write-iops     -Description $msg.container_run_device_write_iops   -VariableName 'LIST'
    New-ParamCompleter              -LongName disable-content-trust -Description $msg.container_run_disable_content_trust
    New-ParamCompleter              -LongName dns                   -Description $msg.container_run_dns                 -VariableName 'LIST'
    New-ParamCompleter              -LongName dns-option            -Description $msg.container_run_dns_option          -VariableName 'LIST'
    New-ParamCompleter              -LongName dns-search            -Description $msg.container_run_dns_search          -VariableName 'LIST'
    New-ParamCompleter              -LongName domainname            -Description $msg.container_run_domainname          -VariableName 'STRING'
    New-ParamCompleter              -LongName entrypoint            -Description $msg.container_run_entrypoint          -VariableName 'STRING'
    New-ParamCompleter -ShortName e -LongName env                   -Description $msg.container_run_env                 -VariableName 'LIST'
    New-ParamCompleter              -LongName env-file              -Description $msg.container_run_env_file            -ArgumentType File -VariableName 'LIST'
    New-ParamCompleter              -LongName expose                -Description $msg.container_run_expose              -VariableName 'LIST'
    New-ParamCompleter              -LongName gpus                  -Description $msg.container_run_gpus                -VariableName 'GPU-REQUEST'
    New-ParamCompleter              -LongName group-add             -Description $msg.container_run_group_add           -VariableName 'LIST'
    New-ParamCompleter              -LongName health-cmd            -Description $msg.container_run_health_cmd          -VariableName 'STRING'
    New-ParamCompleter              -LongName health-interval       -Description $msg.container_run_health_interval     -VariableName 'DURATION'
    New-ParamCompleter              -LongName health-retries        -Description $msg.container_run_health_retries      -VariableName 'INT'
    New-ParamCompleter              -LongName health-start-period   -Description $msg.container_run_health_start_period -VariableName 'DURATION'
    New-ParamCompleter              -LongName health-timeout        -Description $msg.container_run_health_timeout      -VariableName 'DURATION'
    New-ParamCompleter -ShortName h -LongName hostname              -Description $msg.container_run_hostname            -VariableName 'STRING'
    New-ParamCompleter              -LongName init                  -Description $msg.container_run_init
    New-ParamCompleter -ShortName i -LongName interactive           -Description $msg.container_run_interactive
    New-ParamCompleter              -LongName ip                    -Description $msg.container_run_ip                  -VariableName 'STRING'
    New-ParamCompleter              -LongName ip6                   -Description $msg.container_run_ip6                 -VariableName 'STRING'
    New-ParamCompleter              -LongName ipc                   -Description $msg.container_run_ipc                 -VariableName 'STRING'
    New-ParamCompleter              -LongName isolation             -Description $msg.container_run_isolation           -Arguments "default","process","hyperv" -VariableName 'STRING'
    New-ParamCompleter              -LongName kernel-memory         -Description $msg.container_run_kernel_memory       -VariableName 'BYTES'
    New-ParamCompleter -ShortName l -LongName label                 -Description $msg.container_run_label               -VariableName 'LIST'
    New-ParamCompleter              -LongName label-file            -Description $msg.container_run_label_file          -ArgumentType File -VariableName 'LIST'
    New-ParamCompleter              -LongName link                  -Description $msg.container_run_link                -VariableName 'LIST'
    New-ParamCompleter              -LongName link-local-ip         -Description $msg.container_run_link_local_ip       -VariableName 'LIST'
    New-ParamCompleter              -LongName log-driver            -Description $msg.container_run_log_driver          -Arguments "json-file","syslog","journald","gelf","fluentd","awslogs","splunk","none" -VariableName 'STRING'
    New-ParamCompleter              -LongName log-opt               -Description $msg.container_run_log_opt             -VariableName 'LIST'
    New-ParamCompleter              -LongName mac-address           -Description $msg.container_run_mac_address         -VariableName 'STRING'
    New-ParamCompleter -ShortName m -LongName memory                -Description $msg.container_run_memory              -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-reservation    -Description $msg.container_run_memory_reservation  -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swap           -Description $msg.container_run_memory_swap         -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swappiness     -Description $msg.container_run_memory_swappiness   -VariableName 'INT'
    New-ParamCompleter              -LongName mount                 -Description $msg.container_run_mount               -VariableName 'MOUNT'
    New-ParamCompleter              -LongName name                  -Description $msg.container_run_name                -VariableName 'STRING'
    New-ParamCompleter              -LongName network               -Description $msg.container_run_network             -ArgumentCompleter $networkCompleter -VariableName 'NETWORK'
    New-ParamCompleter              -LongName network-alias         -Description $msg.container_run_network_alias       -VariableName 'LIST'
    New-ParamCompleter              -LongName no-healthcheck        -Description $msg.container_run_no_healthcheck
    New-ParamCompleter              -LongName oom-kill-disable      -Description $msg.container_run_oom_kill_disable
    New-ParamCompleter              -LongName oom-score-adj         -Description $msg.container_run_oom_score_adj       -VariableName 'INT'
    New-ParamCompleter              -LongName pid                   -Description $msg.container_run_pid                 -VariableName 'STRING'
    New-ParamCompleter              -LongName pids-limit            -Description $msg.container_run_pids_limit          -VariableName 'INT'
    New-ParamCompleter              -LongName platform              -Description $msg.container_run_platform            -VariableName 'STRING'
    New-ParamCompleter              -LongName privileged            -Description $msg.container_run_privileged
    New-ParamCompleter -ShortName p -LongName publish               -Description $msg.container_run_publish             -VariableName 'LIST'
    New-ParamCompleter -ShortName P -LongName publish-all           -Description $msg.container_run_publish_all
    New-ParamCompleter              -LongName pull                  -Description $msg.container_run_pull                -Arguments "always","missing","never" -VariableName 'STRING'
    New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.container_run_quiet
    New-ParamCompleter              -LongName read-only             -Description $msg.container_run_read_only
    New-ParamCompleter              -LongName restart               -Description $msg.container_run_restart             -Arguments "no","always","on-failure","unless-stopped" -VariableName 'STRING'
    New-ParamCompleter              -LongName rm                    -Description $msg.container_run_rm
    New-ParamCompleter              -LongName runtime               -Description $msg.container_run_runtime             -VariableName 'STRING'
    New-ParamCompleter              -LongName security-opt          -Description $msg.container_run_security_opt        -VariableName 'LIST'
    New-ParamCompleter              -LongName shm-size              -Description $msg.container_run_shm_size            -VariableName 'BYTES'
    New-ParamCompleter              -LongName sig-proxy             -Description $msg.container_run_sig_proxy
    New-ParamCompleter              -LongName stop-signal           -Description $msg.container_run_stop_signal         -VariableName 'STRING'
    New-ParamCompleter              -LongName stop-timeout          -Description $msg.container_run_stop_timeout        -VariableName 'INT'
    New-ParamCompleter              -LongName storage-opt           -Description $msg.container_run_storage_opt         -VariableName 'LIST'
    New-ParamCompleter              -LongName sysctl                -Description $msg.container_run_sysctl              -VariableName 'MAP'
    New-ParamCompleter              -LongName tmpfs                 -Description $msg.container_run_tmpfs               -VariableName 'LIST'
    New-ParamCompleter -ShortName t -LongName tty                   -Description $msg.container_run_tty
    New-ParamCompleter              -LongName ulimit                -Description $msg.container_run_ulimit              -VariableName 'ULIMIT'
    New-ParamCompleter -ShortName u -LongName user                  -Description $msg.container_run_user                -VariableName 'STRING'
    New-ParamCompleter              -LongName userns                -Description $msg.container_run_userns              -VariableName 'STRING'
    New-ParamCompleter              -LongName uts                   -Description $msg.container_run_uts                 -VariableName 'STRING'
    New-ParamCompleter -ShortName v -LongName volume                -Description $msg.container_run_volume              -VariableName 'LIST'
    New-ParamCompleter              -LongName volume-driver         -Description $msg.container_run_volume_driver       -VariableName 'STRING'
    New-ParamCompleter              -LongName volumes-from          -Description $msg.container_run_volumes_from        -VariableName 'LIST'
    New-ParamCompleter -ShortName w -LongName workdir               -Description $msg.container_run_workdir             -ArgumentType Directory -VariableName 'STRING'
)

$containerAttachCommand = New-CommandCompleter -Name attach  -Description $msg.container_attach  -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerCommitCommand = New-CommandCompleter -Name commit  -Description $msg.container_commit  -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
    New-ParamCompleter -ShortName a -LongName author   -Description $msg.container_commit_author  -VariableName 'STRING'
    New-ParamCompleter -ShortName c -LongName change   -Description $msg.container_commit_change  -VariableName 'LIST'
    New-ParamCompleter -ShortName m -LongName message  -Description $msg.container_commit_message -VariableName 'STRING'
    New-ParamCompleter              -LongName no-pause -Description $msg.container_commit_no_pause
)
$containerCpCommand = New-CommandCompleter -Name cp      -Description $msg.container_cp -Parameters @(
    New-ParamCompleter -ShortName a -LongName archive     -Description $msg.container_cp_archive
    New-ParamCompleter -ShortName L -LongName follow-link -Description $msg.container_cp_follow_link
    New-ParamCompleter -ShortName q -LongName quiet       -Description $msg.container_cp_quiet
)
$containerCreateCommand = New-CommandCompleter -Name create  -Description $msg.container_create  -Parameters $commonRunParams -ArgumentCompleter $imageCompleter
$containerDiffCommand   = New-CommandCompleter -Name diff    -Description $msg.container_diff    -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerExecCommand   = New-CommandCompleter -Name exec    -Description $msg.container_exec    -NoFileCompletions -ArgumentCompleter $containerCompleter -Parameters @(
    New-ParamCompleter -ShortName d -LongName detach       -Description $msg.container_exec_detach
    New-ParamCompleter              -LongName detach-keys  -Description $msg.container_exec_detach_keys -VariableName 'STRING'
    New-ParamCompleter -ShortName e -LongName env          -Description $msg.container_exec_env         -VariableName 'LIST'
    New-ParamCompleter              -LongName env-file     -Description $msg.container_exec_env_file    -ArgumentType File -VariableName 'LIST'
    New-ParamCompleter -ShortName i -LongName interactive  -Description $msg.container_exec_interactive
    New-ParamCompleter              -LongName privileged   -Description $msg.container_exec_privileged
    New-ParamCompleter -ShortName t -LongName tty          -Description $msg.container_exec_tty
    New-ParamCompleter -ShortName u -LongName user         -Description $msg.container_exec_user        -VariableName 'STRING'
    New-ParamCompleter -ShortName w -LongName workdir      -Description $msg.container_exec_workdir     -ArgumentType Directory -VariableName 'STRING'
)
$containerExportCommand = New-CommandCompleter -Name export  -Description $msg.container_export -Parameters @(
    New-ParamCompleter -ShortName o -LongName output -Description $msg.container_export_output -ArgumentType File -VariableName 'STRING'
) -NoFileCompletions -ArgumentCompleter $allContainerCompleter
$containerKillCommand   = New-CommandCompleter -Name kill    -Description $msg.container_kill -Parameters @(
    New-ParamCompleter -ShortName s -LongName signal -Description $msg.container_kill_signal -VariableName 'STRING'
) -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerLogsCommand   = New-CommandCompleter -Name logs    -Description $msg.container_logs -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
    New-ParamCompleter              -LongName details    -Description $msg.container_logs_details
    New-ParamCompleter -ShortName f -LongName follow     -Description $msg.container_logs_follow
    New-ParamCompleter              -LongName since      -Description $msg.container_logs_since      -VariableName 'STRING'
    New-ParamCompleter -ShortName n -LongName tail       -Description $msg.container_logs_tail       -Arguments "all" -VariableName 'STRING'
    New-ParamCompleter -ShortName t -LongName timestamps -Description $msg.container_logs_timestamps
    New-ParamCompleter              -LongName until      -Description $msg.container_logs_until      -VariableName 'STRING'
)
$containerPsParams = @(
    New-ParamCompleter -ShortName a -LongName all      -Description $msg.container_ps_all
    New-ParamCompleter -ShortName f -LongName filter   -Description $msg.container_ps_filter   -VariableName 'FILTER'
    New-ParamCompleter              -LongName format   -Description $msg.container_ps_format   -VariableName 'STRING'
    New-ParamCompleter -ShortName n -LongName last     -Description $msg.container_ps_last     -VariableName 'INT'
    New-ParamCompleter -ShortName l -LongName latest   -Description $msg.container_ps_latest
    New-ParamCompleter              -LongName no-trunc -Description $msg.container_ps_no_trunc
    New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.container_ps_quiet
    New-ParamCompleter -ShortName s -LongName size     -Description $msg.container_ps_size
)
$containerPauseCommand   = New-CommandCompleter -Name pause   -Description $msg.container_pause   -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerPortCommand    = New-CommandCompleter -Name port    -Description $msg.container_port    -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerRenameCommand  = New-CommandCompleter -Name rename  -Description $msg.container_rename  -NoFileCompletions -ArgumentCompleter $allContainerCompleter
$containerRestartCommand = New-CommandCompleter -Name restart -Description $msg.restart -Parameters @(
    New-ParamCompleter -ShortName s -LongName signal  -Description $msg.restart_signal  -VariableName 'STRING'
    New-ParamCompleter -ShortName t -LongName timeout -Description $msg.restart_timeout -VariableName 'INT'
) -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerRmCommand      = New-CommandCompleter -Name rm      -Description $msg.container_rm -Parameters @(
    New-ParamCompleter -ShortName f -LongName force   -Description $msg.container_rm_force
    New-ParamCompleter -ShortName l -LongName link    -Description $msg.container_rm_link
    New-ParamCompleter -ShortName v -LongName volumes -Description $msg.container_rm_volumes
) -NoFileCompletions -ArgumentCompleter $allContainerCompleter
$containerRunCommand     = New-CommandCompleter -Name run     -Description $msg.container_run     -Parameters $commonRunParams -ArgumentCompleter $imageCompleter
$containerStartCommand   = New-CommandCompleter -Name start   -Description $msg.container_start   -NoFileCompletions -ArgumentCompleter $allContainerCompleter
$containerStatsCommand   = New-CommandCompleter -Name stats   -Description $msg.container_stats   -Parameters @(
    New-ParamCompleter -ShortName a -LongName all       -Description $msg.container_stats_all
    New-ParamCompleter -LongName format                 -Description $msg.container_stats_format    -VariableName 'STRING'
    New-ParamCompleter -LongName no-stream              -Description $msg.container_stats_no_stream
    New-ParamCompleter -LongName no-trunc               -Description $msg.container_stats_no_trunc
) -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerStopCommand    = New-CommandCompleter -Name stop    -Description $msg.container_stop -Parameters @(
    New-ParamCompleter -ShortName s -LongName signal  -Description $msg.container_stop_signal  -VariableName 'STRING'
    New-ParamCompleter -ShortName t -LongName timeout -Description $msg.container_stop_timeout -VariableName 'INT'
) -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerTopCommand     = New-CommandCompleter -Name top     -Description $msg.container_top     -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerUnpauseCommand = New-CommandCompleter -Name unpause -Description $msg.container_unpause -NoFileCompletions -ArgumentCompleter $containerCompleter
$containerUpdateCommand  = New-CommandCompleter -Name update  -Description $msg.update            -Parameters @(
    New-ParamCompleter              -LongName blkio-weight        -Description $msg.update_blkio_weight        -VariableName 'UINT16'
    New-ParamCompleter              -LongName cpu-period          -Description $msg.update_cpu_period          -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-quota           -Description $msg.update_cpu_quota           -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-period       -Description $msg.update_cpu_rt_period       -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-rt-runtime      -Description $msg.update_cpu_rt_runtime      -VariableName 'INT'
    New-ParamCompleter -ShortName c -LongName cpu-shares          -Description $msg.update_cpu_shares          -VariableName 'INT'
    New-ParamCompleter              -LongName cpus                -Description $msg.update_cpus                -VariableName 'DECIMAL'
    New-ParamCompleter              -LongName cpuset-cpus         -Description $msg.update_cpuset_cpus         -VariableName 'STRING'
    New-ParamCompleter              -LongName cpuset-mems         -Description $msg.update_cpuset_mems         -VariableName 'STRING'
    New-ParamCompleter -ShortName m -LongName memory              -Description $msg.update_memory              -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-reservation  -Description $msg.update_memory_reservation  -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swap         -Description $msg.update_memory_swap         -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swappiness   -Description $msg.update_memory_swappiness   -VariableName 'INT'
    New-ParamCompleter              -LongName pids-limit          -Description $msg.update_pids_limit          -VariableName 'INT'
    New-ParamCompleter              -LongName restart             -Description $msg.update_restart             -Arguments "no","always","on-failure","unless-stopped" -VariableName 'STRING'
) -NoFileCompletions -ArgumentCompleter $allContainerCompleter
$containerWaitCommand    = New-CommandCompleter -Name wait    -Description $msg.container_wait    -NoFileCompletions -ArgumentCompleter $containerCompleter

$imageBuildCommand = New-CommandCompleter -Name build   -Description $msg.image_build -Parameters @(
    New-ParamCompleter              -LongName add-host              -Description $msg.image_build_add_host      -VariableName 'LIST'
    New-ParamCompleter              -LongName build-arg             -Description $msg.image_build_build_arg     -VariableName 'LIST'
    New-ParamCompleter              -LongName cache-from            -Description $msg.image_build_cache_from    -VariableName 'STRINGS'
    New-ParamCompleter              -LongName cgroup-parent         -Description $msg.image_build_cgroup_parent -VariableName 'STRING'
    New-ParamCompleter              -LongName compress              -Description $msg.image_build_compress
    New-ParamCompleter              -LongName cpu-period            -Description $msg.image_build_cpu_period    -VariableName 'INT'
    New-ParamCompleter              -LongName cpu-quota             -Description $msg.image_build_cpu_quota     -VariableName 'INT'
    New-ParamCompleter -ShortName c -LongName cpu-shares            -Description $msg.image_build_cpu_shares    -VariableName 'INT'
    New-ParamCompleter              -LongName cpuset-cpus           -Description $msg.image_build_cpuset_cpus   -VariableName 'STRING'
    New-ParamCompleter              -LongName cpuset-mems           -Description $msg.image_build_cpuset_mems   -VariableName 'STRING'
    New-ParamCompleter              -LongName disable-content-trust -Description $msg.image_build_disable_content_trust
    New-ParamCompleter -ShortName f -LongName file                  -Description $msg.image_build_file          -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName force-rm              -Description $msg.image_build_force_rm
    New-ParamCompleter              -LongName iidfile               -Description $msg.image_build_iidfile       -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName isolation             -Description $msg.image_build_isolation     -Arguments "default","process","hyperv" -VariableName 'STRING'
    New-ParamCompleter              -LongName label                 -Description $msg.image_build_label         -VariableName 'LIST'
    New-ParamCompleter -ShortName m -LongName memory                -Description $msg.image_build_memory        -VariableName 'BYTES'
    New-ParamCompleter              -LongName memory-swap           -Description $msg.image_build_memory_swap   -VariableName 'BYTES'
    New-ParamCompleter              -LongName network               -Description $msg.image_build_network       -ArgumentCompleter $networkCompleter -VariableName 'STRING'
    New-ParamCompleter              -LongName no-cache              -Description $msg.image_build_no_cache
    New-ParamCompleter -ShortName o -LongName output                -Description $msg.image_build_output        -VariableName 'STRINGARRAY'
    New-ParamCompleter              -LongName platform              -Description $msg.image_build_platform      -VariableName 'STRING'
    New-ParamCompleter              -LongName progress              -Description $msg.image_build_progress      -Arguments "auto","plain","tty" -VariableName 'STRING'
    New-ParamCompleter              -LongName pull                  -Description $msg.image_build_pull
    New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.image_build_quiet
    New-ParamCompleter              -LongName rm                    -Description $msg.image_build_rm
    New-ParamCompleter              -LongName secret                -Description $msg.image_build_secret        -VariableName 'STRINGARRAY'
    New-ParamCompleter              -LongName shm-size              -Description $msg.image_build_shm_size      -VariableName 'BYTES'
    New-ParamCompleter              -LongName squash                -Description $msg.image_build_squash
    New-ParamCompleter              -LongName ssh                   -Description $msg.image_build_ssh           -VariableName 'STRINGARRAY'
    New-ParamCompleter -ShortName t -LongName tag                   -Description $msg.image_build_tag           -VariableName 'LIST'
    New-ParamCompleter              -LongName target                -Description $msg.image_build_target        -VariableName 'STRING'
    New-ParamCompleter              -LongName ulimit                -Description $msg.image_build_ulimit        -VariableName 'ULIMIT'
)
$imageImportCommand = New-CommandCompleter -Name import  -Description $msg.image_import -Parameters @(
    New-ParamCompleter -ShortName c -LongName change   -Description $msg.image_import_change   -VariableName 'LIST'
    New-ParamCompleter -ShortName m -LongName message  -Description $msg.image_import_message  -VariableName 'STRING'
    New-ParamCompleter              -LongName platform -Description $msg.image_import_platform -VariableName 'STRING'
)
$imageHistoryCommand = New-CommandCompleter -Name history -Description $msg.image_history -Parameters @(
    New-ParamCompleter              -LongName format   -Description $msg.image_history_format   -VariableName 'STRING'
    New-ParamCompleter -ShortName H -LongName human    -Description $msg.image_history_human
    New-ParamCompleter              -LongName no-trunc -Description $msg.image_history_no_trunc
    New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.image_history_quiet
) -NoFileCompletions -ArgumentCompleter $imageCompleter
$imageLoadCommand = New-CommandCompleter -Name load    -Description $msg.image_load -Parameters @(
    New-ParamCompleter -ShortName i -LongName input -Description $msg.image_load_input -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter -ShortName q -LongName quiet -Description $msg.image_load_quiet
)
$imageLsParams = @(
    New-ParamCompleter -ShortName a -LongName all      -Description $msg.image_ls_all
    New-ParamCompleter              -LongName digests  -Description $msg.image_ls_digests
    New-ParamCompleter -ShortName f -LongName filter   -Description $msg.image_ls_filter   -VariableName 'FILTER'
    New-ParamCompleter              -LongName format   -Description $msg.image_ls_format   -VariableName 'STRING'
    New-ParamCompleter              -LongName no-trunc -Description $msg.image_ls_no_trunc
    New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.image_ls_quiet
)
$imagePullCommand = New-CommandCompleter -Name pull    -Description $msg.image_pull -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
    New-ParamCompleter -ShortName a -LongName all-tags              -Description $msg.image_pull_all_tags
    New-ParamCompleter              -LongName disable-content-trust -Description $msg.image_pull_disable_content_trust
    New-ParamCompleter              -LongName platform              -Description $msg.image_pull_platform -VariableName 'STRING'
    New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.image_pull_quiet
)
$imagePushCommand = New-CommandCompleter -Name push    -Description $msg.image_push -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
    New-ParamCompleter -ShortName a -LongName all-tags              -Description $msg.image_push_all_tags
    New-ParamCompleter              -LongName disable-content-trust -Description $msg.image_push_disable_content_trust
    New-ParamCompleter -ShortName q -LongName quiet                 -Description $msg.image_push_quiet
)
$imageRmParams = @(
    New-ParamCompleter -ShortName f -LongName force    -Description $msg.image_rm_force
    New-ParamCompleter              -LongName no-prune -Description $msg.image_rm_no_prune
)
$imageSaveCommand = New-CommandCompleter -Name save    -Description $msg.image_save -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
    New-ParamCompleter -ShortName o -LongName output -Description $msg.image_save_output -ArgumentType File -VariableName 'STRING'
)
$imageTagCommand = New-CommandCompleter -Name tag     -Description $msg.image_tag -NoFileCompletions -ArgumentCompleter $imageCompleter

$systemEventsCommand = New-CommandCompleter -Name events -Description $msg.system_events -NoFileCompletions -Parameters @(
    New-ParamCompleter -ShortName f -LongName filter  -Description $msg.system_events_filter -VariableName 'FILTER'
    New-ParamCompleter              -LongName format  -Description $msg.system_events_format -VariableName 'STRING'
    New-ParamCompleter              -LongName since   -Description $msg.system_events_since  -VariableName 'STRING'
    New-ParamCompleter              -LongName until   -Description $msg.system_events_until  -VariableName 'STRING'
)
$systemInfoCommand = New-CommandCompleter -Name info   -Description $msg.system_info -NoFileCompletions -Parameters @(
    New-ParamCompleter -ShortName f -LongName format -Description $msg.system_info_format -VariableName 'STRING'
)

Register-NativeCompleter -Name docker -Description $msg.docker -Parameters @(
    New-ParamCompleter              -LongName config        -Description $msg.global_config    -ArgumentType Directory -VariableName 'STRING'
    New-ParamCompleter -ShortName c -LongName context       -Description $msg.global_context   -ArgumentCompleter $contextCompleter -VariableName 'STRING'
    New-ParamCompleter -ShortName D -LongName debug         -Description $msg.global_debug
    New-ParamCompleter -ShortName H -LongName host          -Description $msg.global_host      -VariableName 'LIST'
    New-ParamCompleter -ShortName l -LongName log-level     -Description $msg.global_log_level -Arguments "debug","info","warn","error","fatal" -VariableName 'STRING'
    New-ParamCompleter              -LongName tls           -Description $msg.global_tls
    New-ParamCompleter              -LongName tlscacert     -Description $msg.global_tlscacert -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlscert       -Description $msg.global_tlscert   -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlskey        -Description $msg.global_tlskey    -ArgumentType File -VariableName 'STRING'
    New-ParamCompleter              -LongName tlsverify     -Description $msg.global_tlsverify
    New-ParamCompleter -ShortName v -LongName version       -Description $msg.global_version
) -SubCommands @(

    #
    # Management commands
    #

    # Manage Swarm config
    New-CommandCompleter -Name config -Description $msg.config -SubCommands @(
        New-CommandCompleter -Name create  -Description $msg.config_create
        New-CommandCompleter -Name inspect -Description $msg.config_inspect
        New-CommandCompleter -Name ls      -Description $msg.config_list
        New-CommandCompleter -Name rm      -Description $msg.config_rm
    ) -NoFileCompletions

    New-CommandCompleter -Name container -Description $msg.container -SubCommands @(
        $containerAttachCommand
        $containerCommitCommand
        $containerCpCommand
        $containerCreateCommand
        $containerDiffCommand
        $containerExecCommand
        $containerExportCommand
        New-CommandCompleter -Name inspect -Description $msg.container_inspect -NoFileCompletions -ArgumentCompleter $allContainerCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -VariableName 'STRING'
            New-ParamCompleter -ShortName s -LongName size   -Description $msg.inspect_size
        )
        $containerKillCommand
        $containerLogsCommand
        New-CommandCompleter -Name ls      -Description $msg.container_ps -NoFileCompletions -Parameters $containerPsParams
        $containerPauseCommand
        $containerPortCommand
        New-CommandCompleter -Name prune   -Description $msg.container_prune -Parameters @(
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.container_prune_force
            New-ParamCompleter              -LongName filter -Description $msg.container_prune_filter -VariableName 'FILTER'
        ) -NoFileCompletions
        $containerRenameCommand
        $containerRestartCommand
        $containerRmCommand
        $containerRunCommand
        $containerStartCommand
        $containerStatsCommand
        $containerStopCommand
        $containerTopCommand
        $containerUnpauseCommand
        $containerUpdateCommand
        $containerWaitCommand
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
        $imageBuildCommand
        $imageHistoryCommand
        $imageImportCommand
        New-CommandCompleter -Name inspect -Description $msg.image_inspect -NoFileCompletions -ArgumentCompleter $imageCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format   -Description $msg.inspect_format   -VariableName 'STRING'
            New-ParamCompleter              -LongName platform -Description $msg.inspect_platform -VariableName 'STRING'
        )
        $imageLoadCommand
        New-CommandCompleter -Name ls      -Description $msg.image_ls -NoFileCompletions -Parameters $imageLsParams
        New-CommandCompleter -Name prune   -Description $msg.image_prune -Parameters @(
            New-ParamCompleter -ShortName a -LongName all    -Description $msg.image_prune_all
            New-ParamCompleter              -LongName filter -Description $msg.image_prune_filter -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.image_prune_force
        ) -NoFileCompletions
        $imagePullCommand
        $imagePushCommand
        New-CommandCompleter -Name rm      -Description $msg.image_rm -Parameters $imageRmParams -NoFileCompletions -ArgumentCompleter $imageCompleter
        $imageSaveCommand
        $imageTagCommand
    ) -NoFileCompletions

    New-CommandCompleter -Name network -Description $msg.network -SubCommands @(
        New-CommandCompleter -Name connect    -Description $msg.network_connect    -NoFileCompletions -ArgumentCompleter $networkCompleter
        New-CommandCompleter -Name create     -Description $msg.network_create     -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName attachable   -Description $msg.network_create_attachable
            New-ParamCompleter              -LongName aux-address  -Description $msg.network_create_aux_address  -VariableName 'MAP'
            New-ParamCompleter              -LongName config-from  -Description $msg.network_create_config_from  -VariableName 'NETWORK'
            New-ParamCompleter              -LongName config-only  -Description $msg.network_create_config_only
            New-ParamCompleter -ShortName d -LongName driver       -Description $msg.network_create_driver       -Arguments "bridge","host","overlay","macvlan","none" -VariableName 'STRING'
            New-ParamCompleter              -LongName gateway      -Description $msg.network_create_gateway      -VariableName 'STRINGS'
            New-ParamCompleter              -LongName ingress      -Description $msg.network_create_ingress
            New-ParamCompleter              -LongName internal     -Description $msg.network_create_internal
            New-ParamCompleter              -LongName ip-range     -Description $msg.network_create_ip_range     -VariableName 'STRINGS'
            New-ParamCompleter              -LongName ipam-driver  -Description $msg.network_create_ipam_driver  -VariableName 'STRING'
            New-ParamCompleter              -LongName ipam-opt     -Description $msg.network_create_ipam_opt     -VariableName 'MAP'
            New-ParamCompleter              -LongName ipv6         -Description $msg.network_create_ipv6
            New-ParamCompleter              -LongName label        -Description $msg.network_create_label        -VariableName 'LIST'
            New-ParamCompleter -ShortName o -LongName opt          -Description $msg.network_create_opt          -VariableName 'MAP'
            New-ParamCompleter              -LongName scope        -Description $msg.network_create_scope        -Arguments "local","swarm","global" -VariableName 'STRING'
            New-ParamCompleter              -LongName subnet       -Description $msg.network_create_subnet       -VariableName 'STRINGS'
        )
        New-CommandCompleter -Name disconnect -Description $msg.network_disconnect -NoFileCompletions -ArgumentCompleter $networkCompleter
        New-CommandCompleter -Name inspect    -Description $msg.network_inspect    -NoFileCompletions -ArgumentCompleter $networkCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format  -Description $msg.inspect_format -VariableName 'STRING'
            New-ParamCompleter              -LongName verbose -Description $msg.inspect_verbose
        )
        New-CommandCompleter -Name ls         -Description $msg.network_ls         -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.network_ls_filter   -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.network_ls_format   -VariableName 'STRING'
            New-ParamCompleter              -LongName no-trunc -Description $msg.network_ls_no_trunc
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.network_ls_quiet
        )
        New-CommandCompleter -Name prune      -Description $msg.network_prune      -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName filter -Description $msg.network_prune_filter -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.network_prune_force
        )
        New-CommandCompleter -Name rm         -Description $msg.network_rm         -NoFileCompletions -ArgumentCompleter $networkCompleter
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

    New-CommandCompleter -Name system -Description $msg.system -SubCommands @(
        New-CommandCompleter -Name df     -Description $msg.system_df -NoFileCompletions -Parameters @(
            New-ParamCompleter              -LongName format  -Description $msg.system_df_format -VariableName 'STRING'
            New-ParamCompleter -ShortName v -LongName verbose -Description $msg.system_df_verbose
        )
        $systemEventsCommand
        $systemInfoCommand
        New-CommandCompleter -Name prune  -Description $msg.system_prune -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName a -LongName all     -Description $msg.system_prune_all
            New-ParamCompleter              -LongName filter  -Description $msg.system_prune_filter  -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force   -Description $msg.system_prune_force
            New-ParamCompleter              -LongName volumes -Description $msg.system_prune_volumes
        )
    ) -NoFileCompletions

    New-CommandCompleter -Name volume -Description $msg.volume -SubCommands @(
        New-CommandCompleter -Name create   -Description $msg.volume_create -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName d -LongName driver -Description $msg.volume_create_driver -VariableName 'STRING'
            New-ParamCompleter              -LongName label  -Description $msg.volume_create_label  -VariableName 'LIST'
            New-ParamCompleter              -LongName name   -Description $msg.volume_create_name   -VariableName 'STRING'
            New-ParamCompleter -ShortName o -LongName opt    -Description $msg.volume_create_opt    -VariableName 'MAP'
        )
        New-CommandCompleter -Name inspect  -Description $msg.volume_inspect -NoFileCompletions -ArgumentCompleter $volumeCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -VariableName 'STRING'
        )
        New-CommandCompleter -Name ls       -Description $msg.volume_ls -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName f -LongName filter   -Description $msg.volume_ls_filter   -VariableName 'FILTER'
            New-ParamCompleter              -LongName format   -Description $msg.volume_ls_format   -VariableName 'STRING'
            New-ParamCompleter -ShortName q -LongName quiet    -Description $msg.volume_ls_quiet
        )
        New-CommandCompleter -Name prune    -Description $msg.volume_prune -NoFileCompletions -Parameters @(
            New-ParamCompleter -ShortName a -LongName all    -Description $msg.volume_prune_all
            New-ParamCompleter              -LongName filter -Description $msg.volume_prune_filter -VariableName 'FILTER'
            New-ParamCompleter -ShortName f -LongName force  -Description $msg.volume_prune_force
        )
        New-CommandCompleter -Name rm       -Description $msg.volume_rm -NoFileCompletions -ArgumentCompleter $volumeCompleter -Parameters @(
            New-ParamCompleter -ShortName f -LongName force -Description $msg.volume_rm_force
        )
    ) -NoFileCompletions

    #
    # Top-level aliases / common commands
    #

    $containerAttachCommand
    $imageBuildCommand
    $containerCommitCommand
    $containerCpCommand
    $containerCreateCommand
    $containerDiffCommand
    $systemEventsCommand
    $containerExecCommand
    $containerExportCommand
    $imageHistoryCommand
    New-CommandCompleter -Name images  -Description $msg.image_ls -Parameters $imageLsParams -NoFileCompletions
    $imageImportCommand
    $systemInfoCommand

    New-CommandCompleter -Name inspect -Description $msg.inspect -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName format -Description $msg.inspect_format -VariableName 'STRING'
        New-ParamCompleter -ShortName s -LongName size   -Description $msg.inspect_size
        New-ParamCompleter              -LongName type   -Description $msg.inspect_type   -Arguments "container","image","network","node","plugin","secret","service","task","volume" -VariableName 'STRING'
    )

    $containerKillCommand
    $imageLoadCommand

    New-CommandCompleter -Name login   -Description $msg.login   -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName p -LongName password       -Description $msg.login_password       -VariableName 'STRING'
        New-ParamCompleter              -LongName password-stdin -Description $msg.login_password_stdin
        New-ParamCompleter -ShortName u -LongName username       -Description $msg.login_username       -VariableName 'STRING'
    )

    New-CommandCompleter -Name logout  -Description $msg.logout  -NoFileCompletions

    $containerLogsCommand

    New-CommandCompleter -Name manifest -Description $msg.manifest -SubCommands @(
        New-CommandCompleter -Name annotate -Description $msg.manifest_annotate
        New-CommandCompleter -Name create   -Description $msg.manifest_create
        New-CommandCompleter -Name inspect  -Description $msg.manifest_inspect
        New-CommandCompleter -Name push     -Description $msg.manifest_push
        New-CommandCompleter -Name rm       -Description $msg.manifest_rm
    ) -NoFileCompletions

    $containerPauseCommand
    $containerPortCommand
    New-CommandCompleter -Name ps      -Description $msg.container_ps      -NoFileCompletions -Parameters $containerPsParams
    $imagePullCommand
    $imagePushCommand
    $containerRenameCommand
    $containerRestartCommand
    $containerRmCommand
    New-CommandCompleter -Name rmi     -Description $msg.image_rm -Parameters $imageRmParams -NoFileCompletions -ArgumentCompleter $imageCompleter
    $containerRunCommand
    $imageSaveCommand

    New-CommandCompleter -Name search  -Description $msg.search  -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName filter   -Description $msg.search_filter   -VariableName 'FILTER'
        New-ParamCompleter              -LongName format   -Description $msg.search_format   -VariableName 'STRING'
        New-ParamCompleter              -LongName limit    -Description $msg.search_limit    -VariableName 'INT'
        New-ParamCompleter              -LongName no-trunc -Description $msg.search_no_trunc
    )

    $containerStartCommand
    $containerStatsCommand
    $containerStopCommand
    $imageTagCommand
    $containerTopCommand
    $containerUnpauseCommand
    $containerUpdateCommand

    New-CommandCompleter -Name version -Description $msg.version -NoFileCompletions -Parameters @(
        New-ParamCompleter -ShortName f -LongName format -Description $msg.version_format -VariableName 'STRING'
    )

    $containerWaitCommand
) -NoFileCompletions
