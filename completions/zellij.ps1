<#
 # zellij completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    zellij                          = A terminal workspace with batteries included

    # Top-level options
    config                          = Change where zellij looks for the configuration file
    config_dir                      = Change where zellij looks for plugins and layouts
    data_dir                        = Change where zellij looks for plugins and layouts
    debug                           = Gather additional debug information
    help                            = Print help information
    layout                          = Name of a layout file in the layout directory
    max_panes                       = Maximum panes on screen, 0 for unlimited
    new_session_with_layout         = Start with a specified layout string
    session                         = Attach to a session with a specific name
    version                         = Print version information

    # Subcommands
    action                          = Send actions to a specific session
    attach                          = Attach to a session
    delete_all_sessions             = Delete all sessions
    delete_session                  = Delete a specific session
    edit                            = Open a file in a new pane with your default editor
    kill_all_sessions               = Kill all sessions
    kill_session                    = Kill a specific session
    list_aliases                    = List active aliases
    list_sessions                   = List running sessions
    options                         = Change configuration options
    pipe                            = Send data to a plugin
    plugin                          = Load a plugin
    run                             = Run a command in a new pane
    setup                           = Setup zellij and check configurations
    watch                           = Attach to a session in read-only mode

    # Common pane options
    borderless                      = Start pane without a border
    close_on_exit                   = Close the pane immediately when its command exits
    close_replaced_pane             = Close the replaced pane instead of suspending it
    cwd                             = Change the working directory of the new pane
    direction                       = Direction to open the new pane in
    floating                        = Open the new pane in floating mode
    height                          = The height if the pane is floating (integer or percent)
    in_place                        = Open pane in place of the current pane
    name                            = Name of the new pane
    near_current_pane               = Open the pane near the current one
    pinned                          = Whether to pin a floating pane so it is always on top
    start_suspended                 = Start the command suspended
    stacked                         = Open the pane in stacked mode
    width                           = The width if the pane is floating (integer or percent)
    x                               = The x coordinate if the pane is floating
    y                               = The y coordinate if the pane is floating
    auto_comfirm_y                  = Automatically confirm

    # run
    run_block_until_exit            = Block until the command exits (regardless of exit status)
    run_block_until_exit_failure    = Block until the command exits with failure
    run_block_until_exit_success    = Block until the command exits successfully
    run_blocking                    = Block until the command has finished and its pane closed

    # edit
    edit_line_number                = Open the file at the specified line number

    # attach
    attach_create_if_not_exists     = Create a session if one does not exist
    attach_index                    = Attach to session with this index
    attach_read_only                = Attach to session in read-only mode

    # setup
    setup_check                     = Check the configuration
    setup_clean                     = Start with default configuration
    setup_dump_config               = Dump default configuration to stdout
    setup_dump_layout               = Dump a default layout file to stdout
    setup_dump_swap_layout          = Dump a default swap layout file to stdout
    setup_generate_auto_start       = Generate auto-start script for the specified shell
    setup_generate_completion       = Generate shell completions for the specified shell

    # list-sessions
    ls_no_formatting                = Disable ANSI formatting in the output
    ls_short                        = Print session name only

    # options
    opt_attach_to_session           = Attach to session specified in session-name if it exists
    opt_copy_clipboard              = OSC52 destination clipboard
    opt_copy_command                = Use a user supplied command for clipboard instead of OSC52
    opt_copy_on_select              = Automatically copy when selecting text
    opt_default_layout              = Set the default layout
    opt_default_mode                = Set the default mode
    opt_default_shell               = Set the default shell
    opt_layout_dir                  = Set the layout_dir, defaults to subdirectory of config dir
    opt_mirror_session              = Mirror session when multiple users are connected
    opt_mouse_mode                  = Set the handling of mouse events
    opt_on_force_close              = Set behaviour on force close (quit or detach)
    opt_pane_frames                 = Set display of the pane frames
    opt_scroll_buffer_size          = Set scroll buffer size
    opt_scrollback_editor           = Explicit full path to open the scrollback editor
    opt_session_name                = The name of the session to create when starting Zellij
    opt_simplified_ui               = Allow plugins to use a more simplified layout
    opt_theme                       = Set the default theme
    opt_theme_dir                   = Set the theme_dir, defaults to subdirectory of config dir

    # plugin
    plugin_url                      = Plugin URL, eg. file:/path/to/my/plugin.wasm
    plugin_configuration            = A space-separated list of key=value pairs for the plugin
    plugin_skip_plugin_cache        = Skip plugin cache, useful for plugin development
    plugin_floating                 = Open the plugin in floating mode
    plugin_in_place                 = Open the plugin in place of the current pane

    # pipe
    pipe_args                       = The data to pipe (defaults to STDIN)
    pipe_name                       = Name of the pipe
    pipe_payload                    = The message payload
    pipe_plugin                     = Target plugin URL to send the data to
    pipe_skip_plugin_cache          = Skip plugin cache when launching the plugin

    # kill-session / delete-session
    kill_force                      = Kill the session even if it has attached clients

    # action subcommands
    action_close_pane               = Close the focused pane
    action_close_tab                = Close the current tab
    action_dump_layout              = Dump current layout to stdout
    action_dump_screen              = Dump the focused pane scrollback to a file
    action_edit                     = Open a file in a new pane with your default EDITOR
    action_edit_scrollback          = Open the pane scrollback in your default editor
    action_focus_next_pane          = Change focus to the next pane
    action_focus_previous_pane      = Change focus to the previous pane
    action_go_to_next_tab           = Go to the next tab
    action_go_to_previous_tab       = Go to the previous tab
    action_go_to_tab                = Go to tab with specified index
    action_go_to_tab_name           = Go to tab with specified name
    action_half_page_scroll_down    = Scroll down half page in focused pane
    action_half_page_scroll_up      = Scroll up half page in focused pane
    action_launch_or_focus_plugin   = Launch a plugin or focus it if already running
    action_launch_plugin            = Launch a plugin
    action_list_clients             = List all clients connected to the current session
    action_move_focus               = Move the focused pane in the specified direction
    action_move_focus_or_tab        = Move focus to pane or tab (if on screen edge)
    action_move_pane                = Change location of focused pane in the specified direction
    action_move_pane_backwards      = Move pane position backwards in the stack
    action_new_pane                 = Open a new pane
    action_new_tab                  = Create a new tab
    action_page_scroll_down         = Scroll down one page in the focused pane
    action_page_scroll_up           = Scroll up one page in the focused pane
    action_query_tab_names          = Query all tab names
    action_rename_pane              = Rename the focused pane
    action_rename_tab               = Rename the focused tab
    action_resize                   = Resize the focused pane
    action_scroll_down              = Scroll down 1 line in the focused pane
    action_scroll_to_bottom         = Scroll to bottom in the focused pane
    action_scroll_to_top            = Scroll to top in the focused pane
    action_scroll_up                = Scroll up 1 line in the focused pane
    action_stack_panes              = Turn specified panes into a stack
    action_start_or_reload_plugin   = Launch a plugin or reload it if already running
    action_switch_mode              = Switch input mode of all connected clients
    action_toggle_active_sync_tab   = Toggle sending text input to all panes in current tab
    action_toggle_floating_panes    = Toggle visibility of all floating panes in current tab
    action_toggle_fullscreen        = Toggle fullscreen focus pane and normal layout
    action_toggle_pane_embed        = Embed focused pane if floating, or float it if embedded
    action_toggle_pane_frames       = Toggle frames around panes in the UI
    action_toggle_pane_pinned       = Toggle pinned state of the focused floating pane
    action_undo_rename_pane         = Remove a previously set pane name
    action_undo_rename_tab          = Remove a previously set tab name
    action_write                    = Write bytes to the focused pane
    action_write_chars              = Write characters to the focused pane
    action_change_floating_coords   = Change coordinates of a floating pane
    action_clear                    = Clear all buffers for the focused pane

    action_go_to_tab_create         = Create a tab if one does not exist
    action_new_pane_close_on_exit   = Close the pane immediately when its command exits
    action_new_pane_cwd             = Change the working directory of the new pane
    action_new_pane_direction       = Direction to open the new pane in
    action_new_pane_floating        = Open the new pane in floating mode
    action_new_pane_name            = Name of the new pane
    action_new_pane_suspended       = Start the command suspended
    action_new_tab_cwd              = Change the working directory of the new tab
    action_new_tab_layout           = Path to a layout file
    action_new_tab_name             = Name of the new tab
    action_change_floating_height   = The height of the pane as integer or percent
    action_change_floating_width    = The width of the pane as integer or percent
    action_change_floating_x        = The x coordinate of the pane as integer or percent
    action_change_floating_y        = The y coordinate of the pane as integer or percent
    action_change_floating_pane_id  = The pane_id of the floating pane (eg. terminal_1)
    action_change_floating_pinned   = Whether to pin the floating pane
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$directionArguments  = "right", "left", "up", "down"
$trueFalseArguments  = "true", "false"
$modeArguments       = "locked", "pane", "tab", "resize", "move", "search", "session", "tmux"
$shellArguments      = "bash", "fish", "zsh", "elvish"
$onForceCloseArgs    = "quit", "detach"
$clipboardArguments  = "system", "primary"

$sessionCompleter = {
    zellij list-sessions --no-formatting 2>$null | ForEach-Object {
        $d = $_.Split(" ", 2)
        if ($d[0] -like "$wordToComplete*") {
            "{0}`t{1}" -f $d
        }
    }
}
$directionCompleter = {
    param([int] $position, [int] $argIndex)
    if ($argIndex -eq 0) { "right", "left", "up", "down" | Where-Object { $_ -like "$wordToComplete*" } }
}
$resizeCompleter = {
    param([int] $position, [int] $argIndex)
    if ($argIndex -eq 0) { "right","left","up","down","+","-" | Where-Object { $_ -like "$wordToComplete*" } }
}
$modeCompleter = {
    param([int] $position, [int] $argIndex)
    if ($argIndex -eq 0) { "locked", "pane", "tab", "resize", "move", "search", "session", "tmux" | Where-Object { $_ -like "$wordToComplete*" } }
}

# Shared pane parameters used in multiple subcommands
$floatingParam      = New-ParamCompleter -ShortName f -LongName floating   -Description $msg.floating
$inPlaceParam       = New-ParamCompleter -ShortName i -LongName in-place   -Description $msg.in_place
$directionParam     = New-ParamCompleter -ShortName d -LongName direction  -Description $msg.direction  -Arguments $directionArguments -VariableName 'DIRECTION'
$cwdParam           = New-ParamCompleter              -LongName cwd        -Description $msg.cwd        -ArgumentType Directory        -VariableName 'CWD'
$nameParam          = New-ParamCompleter -ShortName n -LongName name       -Description $msg.name       -VariableName 'NAME'
$xParam             = New-ParamCompleter -ShortName x -LongName x          -Description $msg.x          -VariableName 'X'
$yParam             = New-ParamCompleter -ShortName y -LongName y          -Description $msg.y          -VariableName 'Y'
$widthParam         = New-ParamCompleter              -LongName width      -Description $msg.width      -VariableName 'WIDTH'
$heightParam        = New-ParamCompleter              -LongName height     -Description $msg.height     -VariableName 'HEIGHT'
$pinnedParam        = New-ParamCompleter              -LongName pinned     -Description $msg.pinned     -Arguments $trueFalseArguments -VariableName 'PINNED'
$borderlessParam    = New-ParamCompleter -ShortName b -LongName borderless -Description $msg.borderless -Arguments $trueFalseArguments -VariableName 'BORDERLESS'
$nearCurrentParam   = New-ParamCompleter              -LongName near-current-pane   -Description $msg.near_current_pane
$closeReplacedParam = New-ParamCompleter              -LongName close-replaced-pane -Description $msg.close_replaced_pane
$helpParam          = New-ParamCompleter -ShortName h -LongName help       -Description $msg.help

Register-NativeCompleter -Name zellij -Description $msg.zellij -Parameters @(
    New-ParamCompleter -ShortName c -LongName config      -Description $msg.config     -ArgumentType File       -VariableName 'CONFIG'
    New-ParamCompleter              -LongName config-dir  -Description $msg.config_dir -ArgumentType Directory  -VariableName 'CONFIG_DIR'
    New-ParamCompleter              -LongName data-dir    -Description $msg.data_dir   -ArgumentType Directory  -VariableName 'DATA_DIR'
    New-ParamCompleter -ShortName d -LongName debug       -Description $msg.debug
    New-ParamCompleter -ShortName h -LongName help        -Description $msg.help
    New-ParamCompleter -ShortName l -LongName layout      -Description $msg.layout     -ArgumentType File       -VariableName 'LAYOUT'
    New-ParamCompleter              -LongName max-panes   -Description $msg.max_panes  -VariableName 'MAX_PANES'
    New-ParamCompleter -ShortName n -LongName new-session-with-layout -Description $msg.new_session_with_layout -VariableName 'LAYOUT_STRING'
    New-ParamCompleter -ShortName s -LongName session     -Description $msg.session    -VariableName 'SESSION'  -ArgumentCompleter $sessionCompleter
    New-ParamCompleter -ShortName v -LongName version     -Description $msg.version
) -SubCommands @(

    # action
    New-CommandCompleter -Name action -Description $msg.action -Parameters @(
        $helpParam
    ) -SubCommands @(
        New-CommandCompleter -Name change-floating-pane-coordinates -Description $msg.action_change_floating_coords -Parameters @(
            New-ParamCompleter -ShortName p -LongName pane-id -Description $msg.action_change_floating_pane_id -VariableName 'PANE_ID'
            New-ParamCompleter              -LongName height  -Description $msg.action_change_floating_height  -VariableName 'HEIGHT'
            New-ParamCompleter              -LongName width   -Description $msg.action_change_floating_width   -VariableName 'WIDTH'
            New-ParamCompleter -ShortName x -LongName x       -Description $msg.action_change_floating_x       -VariableName 'X'
            New-ParamCompleter -ShortName y -LongName y       -Description $msg.action_change_floating_y       -VariableName 'Y'
            New-ParamCompleter              -LongName pinned  -Description $msg.action_change_floating_pinned  -Arguments $trueFalseArguments -VariableName 'PINNED'
            $helpParam
        ) -NoFileCompletions
        New-CommandCompleter -Name clear       -Description $msg.action_clear       -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name close-pane  -Description $msg.action_close_pane  -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name close-tab   -Description $msg.action_close_tab   -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name dump-layout -Description $msg.action_dump_layout -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name dump-screen -Description $msg.action_dump_screen -Parameters $helpParam
        New-CommandCompleter -Name edit        -Description $msg.action_edit -Parameters @(
            $directionParam
            $floatingParam
            New-ParamCompleter -ShortName l -LongName line-number -Description $msg.edit_line_number -VariableName 'LINE_NUMBER'
            $helpParam
        )
        New-CommandCompleter -Name edit-scrollback      -Description $msg.action_edit_scrollback      -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name focus-next-pane      -Description $msg.action_focus_next_pane      -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name focus-previous-pane  -Description $msg.action_focus_previous_pane  -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name go-to-next-tab       -Description $msg.action_go_to_next_tab       -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name go-to-previous-tab   -Description $msg.action_go_to_previous_tab   -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name go-to-tab            -Description $msg.action_go_to_tab            -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name go-to-tab-name       -Description $msg.action_go_to_tab_name       -Parameters @(
            New-ParamCompleter -ShortName c -LongName create -Description $msg.action_go_to_tab_create
            $helpParam
        ) -NoFileCompletions
        New-CommandCompleter -Name half-page-scroll-down  -Description $msg.action_half_page_scroll_down  -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name half-page-scroll-up    -Description $msg.action_half_page_scroll_up    -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name launch-or-focus-plugin -Description $msg.action_launch_or_focus_plugin -Parameters @(
            $floatingParam
            $helpParam
        ) -NoFileCompletions
        New-CommandCompleter -Name launch-plugin -Description $msg.action_launch_plugin -Parameters @(
            $floatingParam
            $helpParam
        ) -NoFileCompletions
        New-CommandCompleter -Name list-clients        -Description $msg.action_list_clients        -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name move-focus          -Description $msg.action_move_focus          -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $directionCompleter
        New-CommandCompleter -Name move-focus-or-tab   -Description $msg.action_move_focus_or_tab   -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $directionCompleter
        New-CommandCompleter -Name move-pane           -Description $msg.action_move_pane           -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $directionCompleter
        New-CommandCompleter -Name move-pane-backwards -Description $msg.action_move_pane_backwards -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name new-pane            -Description $msg.action_new_pane            -Parameters @(
            New-ParamCompleter -ShortName c -LongName close-on-exit   -Description $msg.action_new_pane_close_on_exit
            $cwdParam
            New-ParamCompleter -ShortName d -LongName direction       -Description $msg.action_new_pane_direction -Arguments $directionArguments -VariableName 'DIRECTION'
            New-ParamCompleter -ShortName f -LongName floating        -Description $msg.action_new_pane_floating
            New-ParamCompleter -ShortName n -LongName name            -Description $msg.action_new_pane_name      -VariableName 'NAME'
            New-ParamCompleter -ShortName s -LongName start-suspended -Description $msg.action_new_pane_suspended
            $helpParam
        )
        New-CommandCompleter -Name new-tab -Description $msg.action_new_tab -Parameters @(
            New-ParamCompleter -ShortName c -LongName cwd    -Description $msg.action_new_tab_cwd    -ArgumentType Directory -VariableName 'CWD'
            New-ParamCompleter -ShortName l -LongName layout -Description $msg.action_new_tab_layout -ArgumentType File      -VariableName 'LAYOUT'
            New-ParamCompleter -ShortName n -LongName name   -Description $msg.action_new_tab_name   -VariableName 'NAME'
            $helpParam
        )
        New-CommandCompleter -Name page-scroll-down              -Description $msg.action_page_scroll_down        -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name page-scroll-up                -Description $msg.action_page_scroll_up          -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name query-tab-names               -Description $msg.action_query_tab_names         -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name rename-pane                   -Description $msg.action_rename_pane             -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name rename-tab                    -Description $msg.action_rename_tab              -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name resize                        -Description $msg.action_resize                  -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $resizeCompleter
        New-CommandCompleter -Name scroll-down                   -Description $msg.action_scroll_down             -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name scroll-to-bottom              -Description $msg.action_scroll_to_bottom        -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name scroll-to-top                 -Description $msg.action_scroll_to_top           -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name scroll-up                     -Description $msg.action_scroll_up               -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name stack-panes                   -Description $msg.action_stack_panes             -Parameters $helpParam
        New-CommandCompleter -Name start-or-reload-plugin        -Description $msg.action_start_or_reload_plugin  -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name switch-mode                   -Description $msg.action_switch_mode             -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $modeCompleter
        New-CommandCompleter -Name toggle-active-sync-tab        -Description $msg.action_toggle_active_sync_tab  -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name toggle-floating-panes         -Description $msg.action_toggle_floating_panes   -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name toggle-fullscreen             -Description $msg.action_toggle_fullscreen       -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name toggle-pane-embed-or-floating -Description $msg.action_toggle_pane_embed       -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name toggle-pane-frames            -Description $msg.action_toggle_pane_frames      -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name toggle-pane-pinned            -Description $msg.action_toggle_pane_pinned      -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name undo-rename-pane              -Description $msg.action_undo_rename_pane        -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name undo-rename-tab               -Description $msg.action_undo_rename_tab         -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name write                         -Description $msg.action_write                   -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name write-chars                   -Description $msg.action_write_chars             -Parameters $helpParam -NoFileCompletions
        New-CommandCompleter -Name help                          -Description $msg.help                           -NoFileCompletions
    ) -NoFileCompletions

    # attach
    New-CommandCompleter -Name attach -Aliases a -Description $msg.attach -Parameters @(
        New-ParamCompleter -ShortName c -LongName create        -Description $msg.attach_create_if_not_exists
        New-ParamCompleter -ShortName i -LongName index         -Description $msg.attach_index         -VariableName 'INDEX'
        New-ParamCompleter -ShortName r -LongName read-only     -Description $msg.attach_read_only
        $helpParam
    ) -NoFileCompletions -SubCommands @(
        New-CommandCompleter -Name options -Description $msg.options -Parameters @(
            New-ParamCompleter -LongName attach-to-session   -Description $msg.opt_attach_to_session  -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName copy-clipboard      -Description $msg.opt_copy_clipboard     -Arguments $clipboardArguments -VariableName 'CLIPBOARD'
            New-ParamCompleter -LongName copy-command        -Description $msg.opt_copy_command       -VariableName 'COMMAND'
            New-ParamCompleter -LongName copy-on-select      -Description $msg.opt_copy_on_select     -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName default-layout      -Description $msg.opt_default_layout     -VariableName 'LAYOUT'
            New-ParamCompleter -LongName default-mode        -Description $msg.opt_default_mode       -Arguments $modeArguments      -VariableName 'MODE'
            New-ParamCompleter -LongName default-shell       -Description $msg.opt_default_shell      -VariableName 'SHELL'
            New-ParamCompleter -LongName layout-dir          -Description $msg.opt_layout_dir         -ArgumentType Directory        -VariableName 'DIR'
            New-ParamCompleter -LongName mirror-session      -Description $msg.opt_mirror_session     -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName mouse-mode          -Description $msg.opt_mouse_mode         -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName on-force-close      -Description $msg.opt_on_force_close     -Arguments $onForceCloseArgs   -VariableName 'BEHAVIOR'
            New-ParamCompleter -LongName pane-frames         -Description $msg.opt_pane_frames        -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName scroll-buffer-size  -Description $msg.opt_scroll_buffer_size -VariableName 'SIZE'
            New-ParamCompleter -LongName scrollback-editor   -Description $msg.opt_scrollback_editor  -ArgumentType File             -VariableName 'PATH'
            New-ParamCompleter -LongName session-name        -Description $msg.opt_session_name       -VariableName 'NAME'
            New-ParamCompleter -LongName simplified-ui       -Description $msg.opt_simplified_ui      -Arguments $trueFalseArguments -VariableName 'BOOL'
            New-ParamCompleter -LongName theme               -Description $msg.opt_theme              -VariableName 'THEME'
            New-ParamCompleter -LongName theme-dir           -Description $msg.opt_theme_dir          -ArgumentType Directory        -VariableName 'DIR'
            $helpParam
        ) -NoFileCompletions
    ) -ArgumentCompleter $sessionCompleter

    # delete-all-sessions
    New-CommandCompleter -Name delete-all-sessions -Description $msg.delete_all_sessions -Parameters @(
        New-ParamCompleter -ShortName y -LongName yes -Description $msg.auto_comfirm_y
        $helpParam
    ) -NoFileCompletions

    # delete-session
    New-CommandCompleter -Name delete-session -Description $msg.delete_session -Parameters @(
        New-ParamCompleter -ShortName f -LongName force -Description $msg.kill_force
        $helpParam
    ) -NoFileCompletions -ArgumentCompleter $sessionCompleter

    # edit
    New-CommandCompleter -Name edit -Description $msg.edit -Parameters @(
        $borderlessParam
        $closeReplacedParam
        $cwdParam
        $directionParam
        $floatingParam
        $heightParam
        $inPlaceParam
        New-ParamCompleter -ShortName l -LongName line-number -Description $msg.edit_line_number -VariableName 'LINE_NUMBER'
        $nearCurrentParam
        $pinnedParam
        $widthParam
        $xParam
        $yParam
        $helpParam
    )

    # kill-all-sessions
    New-CommandCompleter -Name kill-all-sessions -Aliases ka -Description $msg.kill_all_sessions -Parameters @(
        New-ParamCompleter -ShortName y -LongName yes -Description $msg.auto_comfirm_y
        $helpParam
    ) -NoFileCompletions

    # kill-session
    New-CommandCompleter -Name kill-session -Aliases k -Description $msg.kill_session -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $sessionCompleter

    # list-aliases
    New-CommandCompleter -Name list-aliases -Description $msg.list_aliases -Parameters $helpParam -NoFileCompletions

    # list-sessions
    New-CommandCompleter -Name list-sessions -Aliases ls -Description $msg.list_sessions -Parameters @(
        New-ParamCompleter -ShortName n -LongName no-formatting -Description $msg.ls_no_formatting
        New-ParamCompleter -ShortName s -LongName short         -Description $msg.ls_short
        $helpParam
    ) -NoFileCompletions

    # options
    New-CommandCompleter -Name options -Description $msg.options -Parameters @(
        New-ParamCompleter -LongName attach-to-session   -Description $msg.opt_attach_to_session  -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName copy-clipboard      -Description $msg.opt_copy_clipboard     -Arguments $clipboardArguments -VariableName 'CLIPBOARD'
        New-ParamCompleter -LongName copy-command        -Description $msg.opt_copy_command       -VariableName 'COMMAND'
        New-ParamCompleter -LongName copy-on-select      -Description $msg.opt_copy_on_select     -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName default-layout      -Description $msg.opt_default_layout     -VariableName 'LAYOUT'
        New-ParamCompleter -LongName default-mode        -Description $msg.opt_default_mode       -Arguments $modeArguments      -VariableName 'MODE'
        New-ParamCompleter -LongName default-shell       -Description $msg.opt_default_shell      -VariableName 'SHELL'
        New-ParamCompleter -LongName layout-dir          -Description $msg.opt_layout_dir         -ArgumentType Directory        -VariableName 'DIR'
        New-ParamCompleter -LongName mirror-session      -Description $msg.opt_mirror_session     -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName mouse-mode          -Description $msg.opt_mouse_mode         -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName on-force-close      -Description $msg.opt_on_force_close     -Arguments $onForceCloseArgs   -VariableName 'BEHAVIOR'
        New-ParamCompleter -LongName pane-frames         -Description $msg.opt_pane_frames        -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName scroll-buffer-size  -Description $msg.opt_scroll_buffer_size -VariableName 'SIZE'
        New-ParamCompleter -LongName scrollback-editor   -Description $msg.opt_scrollback_editor  -ArgumentType File             -VariableName 'PATH'
        New-ParamCompleter -LongName session-name        -Description $msg.opt_session_name       -VariableName 'NAME'
        New-ParamCompleter -LongName simplified-ui       -Description $msg.opt_simplified_ui      -Arguments $trueFalseArguments -VariableName 'BOOL'
        New-ParamCompleter -LongName theme               -Description $msg.opt_theme              -VariableName 'THEME'
        New-ParamCompleter -LongName theme-dir           -Description $msg.opt_theme_dir          -ArgumentType Directory        -VariableName 'DIR'
        $helpParam
    ) -NoFileCompletions

    # pipe
    New-CommandCompleter -Name pipe -Description $msg.pipe -Parameters @(
        New-ParamCompleter -ShortName a -LongName args              -Description $msg.pipe_args    -VariableName 'ARGS'
        New-ParamCompleter -ShortName n -LongName name              -Description $msg.pipe_name    -VariableName 'NAME'
        New-ParamCompleter -ShortName p -LongName payload           -Description $msg.pipe_payload -VariableName 'PAYLOAD'
        New-ParamCompleter              -LongName plugin            -Description $msg.pipe_plugin  -VariableName 'PLUGIN_URL'
        New-ParamCompleter              -LongName skip-plugin-cache -Description $msg.pipe_skip_plugin_cache
        $helpParam
    ) -NoFileCompletions

    # plugin
    New-CommandCompleter -Name plugin -Description $msg.plugin -Parameters @(
        New-ParamCompleter -ShortName c -LongName configuration     -Description $msg.plugin_configuration -VariableName 'KEY=VALUE'
        New-ParamCompleter -ShortName f -LongName floating          -Description $msg.plugin_floating
        New-ParamCompleter -ShortName i -LongName in-place          -Description $msg.plugin_in_place
        New-ParamCompleter              -LongName skip-plugin-cache -Description $msg.plugin_skip_plugin_cache
        New-ParamCompleter -ShortName u -LongName url               -Description $msg.plugin_url -VariableName 'URL'
        $helpParam
    ) -NoFileCompletions

    # run
    New-CommandCompleter -Name run -Description $msg.run -Parameters @(
        $borderlessParam
        New-ParamCompleter              -LongName block-until-exit         -Description $msg.run_block_until_exit
        New-ParamCompleter              -LongName block-until-exit-failure -Description $msg.run_block_until_exit_failure
        New-ParamCompleter              -LongName block-until-exit-success -Description $msg.run_block_until_exit_success
        New-ParamCompleter              -LongName blocking                 -Description $msg.run_blocking
        New-ParamCompleter -ShortName c -LongName close-on-exit            -Description $msg.close_on_exit
        $closeReplacedParam
        $cwdParam
        $directionParam
        $floatingParam
        $heightParam
        $inPlaceParam
        $nameParam
        $nearCurrentParam
        $pinnedParam
        New-ParamCompleter -ShortName s -LongName start-suspended -Description $msg.start_suspended
        New-ParamCompleter              -LongName stacked         -Description $msg.stacked
        $widthParam
        $xParam
        $yParam
        $helpParam
    )

    # setup
    New-CommandCompleter -Name setup -Description $msg.setup -Parameters @(
        New-ParamCompleter -LongName check               -Description $msg.setup_check
        New-ParamCompleter -LongName clean               -Description $msg.setup_clean
        New-ParamCompleter -LongName dump-config         -Description $msg.setup_dump_config
        New-ParamCompleter -LongName dump-layout         -Description $msg.setup_dump_layout         -VariableName 'LAYOUT'
        New-ParamCompleter -LongName dump-swap-layout    -Description $msg.setup_dump_swap_layout    -VariableName 'LAYOUT'
        New-ParamCompleter -LongName generate-auto-start -Description $msg.setup_generate_auto_start -Arguments $shellArguments -VariableName 'SHELL'
        New-ParamCompleter -LongName generate-completion -Description $msg.setup_generate_completion -Arguments $shellArguments -VariableName 'SHELL'
        $helpParam
    ) -NoFileCompletions

    # watch
    New-CommandCompleter -Name watch -Description $msg.watch -Parameters $helpParam -NoFileCompletions -ArgumentCompleter $sessionCompleter

    # help
    New-CommandCompleter -Name help -Description $msg.help -NoFileCompletions

) -NoFileCompletions
