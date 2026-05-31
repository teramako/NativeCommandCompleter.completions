<#
 # fzf completion
 #>
Import-Module Sabamiso.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    extended            = Enable extended-search mode
    exact               = Enable exact-match
    case_sensitive      = Case-sensitive match
    case_insensitive    = Case-insensitive match
    literal             = Do not normalize latin script letters
    scheme              = Color scheme
    algo                = Fuzzy matching algorithm
    nth                 = Comma-separated list of field index expressions
    with_nth            = Transform the presentation of each line
    delimiter           = Field delimiter regex
    disabled            = Do not perform search
    no_sort             = Do not sort the result
    track               = Track the current selection
    tac                 = Reverse the order of the input
    tiebreak            = Comma-separated list of sort criteria
    multi               = Enable multi-select with tab/shift-tab
    no_mouse            = Disable mouse
    bind                = Custom key bindings
    cycle               = Enable cyclic scroll
    keep_right          = Keep the right end of the line visible
    scroll_off          = Number of screen lines to keep above or below
    no_hscroll          = Disable horizontal scroll
    hscroll_off         = Number of screen columns to keep to the right
    filepath_word       = Make word-wise movements respect path separators
    jump_labels         = Label characters for jump and jump-accept
    height              = Display height
    min_height          = Minimum height when --height is given in percent
    layout              = Layout
    layout_default      = Display from the bottom of the screen
    layout_reverse      = Display from the top of the screen
    layout_reverse_list = Display from the top, prompt at the bottom
    border              = Draw border around the finder
    border_label        = Label to print on the border
    border_label_pos    = Position of the border label
    no_unicode          = Use ASCII characters instead of Unicode box drawing
    margin              = Screen margin
    padding             = Padding inside border
    info                = Finder info style
    info_default        = Display on the next line to the prompt
    info_right          = Display on the right side of the prompt
    info_inline         = Display on the same line with the default separator
    info_inline_right   = Display on the same line at the right end
    info_hidden         = Do not display finder info
    separator           = String displayed below the prompt line
    no_separator        = Do not display separator
    scrollbar           = Scrollbar character(s)
    no_scrollbar        = Do not display scrollbar
    prompt              = Input prompt
    pointer             = Pointer to the current line
    marker              = Multi-select marker
    header              = String to print as header
    header_lines        = The first N lines as sticky header
    header_first        = Print header before the prompt line
    ellipsis            = Ellipsis string
    ansi                = Enable processing of ANSI color codes
    tabstop             = Number of spaces for a tab character
    color               = Color configuration
    no_bold             = Do not use bold text
    black               = Use black background
    preview             = Execute command for preview
    preview_label       = Label to print on the preview window border
    preview_label_pos   = Position of the preview label
    preview_window      = Preview window layout
    query               = Start the finder with the given query
    select_1            = Automatically select the only match
    exit_0              = Exit if there's no match
    filter              = Filter mode
    print_query         = Print query as the first line
    read0               = Read input delimited by ASCII NUL
    print0              = Print output delimited by ASCII NUL
    sync                = Synchronous search
    listen              = Start HTTP server and listen on the given address
    version             = Display version information
    help                = Display help information
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name fzf -Description 'command-line fuzzy finder' -Parameters @(
    # Search mode
    New-ParamCompleter -ShortName x -LongName extended -Description $msg.extended
    New-ParamCompleter -ShortName e -LongName exact -Description $msg.exact
    New-ParamCompleter -ShortName i -LongName case-sensitive -Description $msg.case_insensitive
    New-ParamCompleter -LongName literal -Description $msg.literal
    New-ParamCompleter -LongName scheme -Description $msg.scheme -Arguments @{ Name = 'SCHEME'; Candidates = "default","path","history" }
    New-ParamCompleter -LongName algo -Description $msg.algo -Arguments @{ Name = 'TYPE'; Candidates = "v1","v2" }

    # Search scope
    New-ParamCompleter -ShortName n -LongName nth -Description $msg.nth -Arguments @{ Name = 'N'; List = $true }
    New-ParamCompleter -LongName with-nth -Description $msg.with_nth -Arguments @{ Name = 'N'; List = $true }
    New-ParamCompleter -ShortName d -LongName delimiter -Description $msg.delimiter -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName disabled -Description $msg.disabled

    # Search result
    New-ParamCompleter -LongName no-sort -Description $msg.no_sort
    New-ParamCompleter -LongName track -Description $msg.track
    New-ParamCompleter -LongName tac -Description $msg.tac
    New-ParamCompleter -LongName tiebreak -Description $msg.tiebreak -Arguments @{ Name = 'CRI'; List = $true }

    # Interface
    New-ParamCompleter -ShortName m -LongName multi -Description $msg.multi -Arguments @{ Name = 'MAX'; Nargs = '?' }
    New-ParamCompleter -LongName no-mouse -Description $msg.no_mouse
    New-ParamCompleter -LongName bind -Description $msg.bind -Arguments @{ Name = 'KEYBINDS' }
    New-ParamCompleter -LongName cycle -Description $msg.cycle
    New-ParamCompleter -LongName keep-right -Description $msg.keep_right
    New-ParamCompleter -LongName scroll-off -Description $msg.scroll_off -Arguments @{ Name = 'LINES' }
    New-ParamCompleter -LongName no-hscroll -Description $msg.no_hscroll
    New-ParamCompleter -LongName hscroll-off -Description $msg.hscroll_off -Arguments @{ Name = 'COLS' }
    New-ParamCompleter -LongName filepath-word -Description $msg.filepath_word
    New-ParamCompleter -LongName jump-labels -Description $msg.jump_labels -Arguments @{ Name = 'CHARS' }

    # Layout
    New-ParamCompleter -LongName height -Description $msg.height -Arguments @{ Name = 'HEIGHT[%]' }
    New-ParamCompleter -LongName min-height -Description $msg.min_height -Arguments @{ Name = 'HEIGHT' }
    New-ParamCompleter -LongName layout -Description $msg.layout -Arguments @{
        Name = 'LAYOUT'; Candidates = @(
            "default`t{0}" -f $msg.layout_default
            "reverse`t{0}" -f $msg.layout_reverse
            "reverse-list`t{0}" -f $msg.layout_reverse_list
        )
    }
    New-ParamCompleter -LongName border -Description $msg.border -Arguments @{ Name = 'STYLE'; Nargs = '?'; Candidates = "rounded","sharp","bold","block","thinblock","double","horizontal","vertical","top","bottom","left","right","none" }
    New-ParamCompleter -LongName border-label -Description $msg.border_label -Arguments @{ Name = 'LABEL' }
    New-ParamCompleter -LongName border-label-pos -Description $msg.border_label_pos -Arguments @{ Name = 'COL' }
    New-ParamCompleter -LongName no-unicode -Description $msg.no_unicode
    New-ParamCompleter -LongName margin -Description $msg.margin -Arguments @{ Name = 'MARGIN' }
    New-ParamCompleter -LongName padding -Description $msg.padding -Arguments @{ Name = 'PADDING' }
    New-ParamCompleter -LongName info -Description $msg.info -Arguments @{
        Name = 'STYLE'; Candidates = @(
            "default`t{0}" -f $msg.info_default
            "right`t{0}" -f $msg.info_right
            "inline`t{0}" -f $msg.info_inline
            "inline-right`t{0}" -f $msg.info_inline_right
            "hidden`t{0}" -f $msg.info_hidden
        )
    }
    New-ParamCompleter -LongName separator -Description $msg.separator -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName no-separator -Description $msg.no_separator
    New-ParamCompleter -LongName scrollbar -Description $msg.scrollbar -Arguments @{ Name = 'CHAR' }
    New-ParamCompleter -LongName no-scrollbar -Description $msg.no_scrollbar
    New-ParamCompleter -LongName prompt -Description $msg.prompt -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName pointer -Description $msg.pointer -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName marker -Description $msg.marker -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName header -Description $msg.header -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName header-lines -Description $msg.header_lines -Arguments @{ Name = 'N' }
    New-ParamCompleter -LongName header-first -Description $msg.header_first
    New-ParamCompleter -LongName ellipsis -Description $msg.ellipsis -Arguments @{ Name = 'STR' }

    # Display
    New-ParamCompleter -LongName ansi -Description $msg.ansi
    New-ParamCompleter -LongName tabstop -Description $msg.tabstop -Arguments @{ Name = 'SPACES' }
    New-ParamCompleter -LongName color -Description $msg.color -Arguments @{ Name = 'COLSPEC' }
    New-ParamCompleter -LongName no-bold -Description $msg.no_bold
    New-ParamCompleter -LongName black -Description $msg.black

    # Preview
    New-ParamCompleter -LongName preview -Description $msg.preview -Arguments @{ Name = 'COMMAND' }
    New-ParamCompleter -LongName preview-label -Description $msg.preview_label -Arguments @{ Name = 'LABEL' }
    New-ParamCompleter -LongName preview-label-pos -Description $msg.preview_label_pos -Arguments @{ Name = 'COL' }
    New-ParamCompleter -LongName preview-window -Description $msg.preview_window -Arguments @{ Name = 'OPTS' }

    # Scripting
    New-ParamCompleter -ShortName q -LongName query -Description $msg.query -Arguments @{ Name = 'STR' }
    New-ParamCompleter -ShortName '1' -LongName select-1 -Description $msg.select_1
    New-ParamCompleter -ShortName '0' -LongName exit-0 -Description $msg.exit_0
    New-ParamCompleter -ShortName f -LongName filter -Description $msg.filter -Arguments @{ Name = 'STR' }
    New-ParamCompleter -LongName print-query -Description $msg.print_query
    New-ParamCompleter -LongName read0 -Description $msg.read0
    New-ParamCompleter -LongName print0 -Description $msg.print0
    New-ParamCompleter -LongName sync -Description $msg.sync
    New-ParamCompleter -LongName listen -Description $msg.listen -Arguments @{ Name = 'ADDR' }

    # Misc
    New-ParamCompleter -LongName version -Description $msg.version
    New-ParamCompleter -LongName help -Description $msg.help
) -NoFileCompletions
