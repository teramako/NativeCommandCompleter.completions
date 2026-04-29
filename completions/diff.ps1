<#
 # diff completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    normal                  = Output a normal diff
    brief                   = Output only whether the files differ
    reportIdenticalFiles    = Report when two files are the same
    context                 = Output NUM lines of copied context
    shortC                  = Output 3 lines of copied context
    unified                 = Output NUM lines of unified context
    shortU                  = Output 3 lines of unified context
    ed                      = Output an ed script
    rcs                     = Output an RCS format diff
    sideBySide              = Output in two columns
    width                   = Output at most NUM print columns
    leftColumn              = Output only the left column of common lines
    suppressCommonLines     = Do not output common lines
    showCFunction           = Show which C function each change is in
    showFunctionLine        = Show the most recent line matching REGEX
    label                   = Use LABEL instead of file name and timestamp (can be repeated)
    expandTabs              = Expand tabs to spaces in output
    initialTab              = Make tabs line up by prepending a tab
    tabsize                 = Tab stops every NUM (default 8) print columns
    suppressBlankEmpty      = Suppress space or tab before empty output lines
    paginate                = pass output through 'pr' to paginate it
    recursive               = Recursively compare subdirectories
    noDereference           = Don't follow symbolic links
    newFile                 = Treat absent files as empty
    unidirectionalNewFile   = Treat absent first files as empty
    ignoreFileNameCase      = Ignore case when comparing file names
    noIgnoreFileNameCase    = Consider case when comparing file names
    exclude                 = Exclude files that match PAT
    excludeFrom             = Exclude files that match any pattern in FILE
    startingFile            = Start with FILE when comparing directories
    fromFile                = Compare FILE1 to all operands
    toFile                  = Compare FILE2 to all operands
    ignoreCase              = Ignore case differences
    ignoreTabExpansion      = Ignore changes due to tab expansion
    ignoreTrailingSpace     = Ignore white space at line end
    ignoreSpaceChange       = Ignore changes in the amount of white space
    ignoreAllSpace          = Ignore all white space
    ignoreBlankLines        = Ignore changes whose lines are all blank
    ignoreMatchingLines     = Ignore changes whose lines match the REGEX
    text                    = Treat all files as text
    stripTrailingCr         = Strip trailing carriage return on input
    ifdef                   = output merged file with '#ifdef NAME' diffs
    gtypeGroupFormat        = Format GTYPE input groups with GFMT
    lineFormat              = Format all input lines with LFMT
    ltypeLineFormat         = Format LTYPE input lines with LFMT
    minimal                 = Try to find a smaller set of changes
    horizonLines            = Keep NUM lines of the common prefix and suffix
    speedLargeFiles         = Assume large files and many scattered small changes
    color                   = Colorize the output
    palette                 = The colors to use when --color is active
    help                    = Display help and exit
    version                 = Display version and exit
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name diff -Parameters @(
    New-ParamCompleter -LongName normal -Description $msg.normal
    New-ParamCompleter -ShortName q -LongName brief -Description $msg.brief
    New-ParamCompleter -ShortName s -LongName reportIdenticalFiles -Description $msg.reportIdenticalFiles
    New-ParamCompleter -ShortName C -LongName context -Description $msg.context -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -ShortName c -Description $msg.shortC
    New-ParamCompleter -ShortName U -LongName unified -Description $msg.unified -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -ShortName u -Description $msg.shortU
    New-ParamCompleter -ShortName e -LongName ed -Description $msg.ed
    New-ParamCompleter -ShortName n -LongName rcs -Description $msg.rcs
    New-ParamCompleter -ShortName y -LongName sideBySide -Description $msg.sideBySide
    New-ParamCompleter -ShortName W -LongName width -Description $msg.width -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -LongName leftColumn -Description $msg.leftColumn
    New-ParamCompleter -LongName suppressCommonLines -Description $msg.suppressCommonLines
    New-ParamCompleter -ShortName p -LongName showCFunction -Description $msg.showCFunction
    New-ParamCompleter -ShortName F -LongName showFunctionLine -Description $msg.showFunctionLine -Arguments @{ Name = 'REGEX' }
    New-ParamCompleter -LongName label -Description $msg.label -Arguments @{ Name = 'LABEL' }
    New-ParamCompleter -ShortName t -LongName expandTabs -Description $msg.expandTabs
    New-ParamCompleter -ShortName T -LongName initialTab -Description $msg.initialTab
    New-ParamCompleter -LongName tabsize -Description $msg.tabsize -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -LongName suppressBlankEmpty -Description $msg.suppressBlankEmpty
    New-ParamCompleter -ShortName l -LongName paginate -Description $msg.paginate
    New-ParamCompleter -ShortName r -LongName recursive -Description $msg.recursive
    New-ParamCompleter -LongName noDereference -Description $msg.noDereference
    New-ParamCompleter -ShortName N -LongName newFile -Description $msg.newFile
    New-ParamCompleter -LongName unidirectionalNewFile -Description $msg.unidirectionalNewFile
    New-ParamCompleter -LongName ignoreFileNameCase -Description $msg.ignoreFileNameCase
    New-ParamCompleter -LongName noIgnoreFileNameCase -Description $msg.noIgnoreFileNameCase
    New-ParamCompleter -ShortName x -LongName exclude -Description $msg.exclude -Arguments @{ Name = 'PAT' }
    New-ParamCompleter -ShortName X -LongName excludeFrom -Description $msg.excludeFrom -Arguments @{ Name = 'FILE'; Type = 'File' }
    New-ParamCompleter -ShortName S -LongName startingFile -Description $msg.startingFile -Arguments @{ Name = 'FILE'; Type = 'File' }
    New-ParamCompleter -LongName fromFile -Description $msg.fromFile -Arguments @{ Name = 'FILE1'; Type = 'File' }
    New-ParamCompleter -LongName toFile -Description $msg.toFile -Arguments @{ Name = 'FILE2'; Type = 'File' }
    New-ParamCompleter -ShortName i -LongName ignoreCase -Description $msg.ignoreCase
    New-ParamCompleter -ShortName E -LongName ignoreTabExpansion -Description $msg.ignoreTabExpansion
    New-ParamCompleter -ShortName Z -LongName ignoreTrailingSpace -Description $msg.ignoreTrailingSpace
    New-ParamCompleter -ShortName b -LongName ignoreSpaceChange -Description $msg.ignoreSpaceChange
    New-ParamCompleter -ShortName w -LongName ignoreAllSpace -Description $msg.ignoreAllSpace
    New-ParamCompleter -ShortName B -LongName ignoreBlankLines -Description $msg.ignoreBlankLines
    New-ParamCompleter -ShortName I -LongName ignoreMatchingLines -Description $msg.ignoreMatchingLines -Arguments @{ Name = 'REGEX' }
    New-ParamCompleter -ShortName a -LongName text -Description $msg.text
    New-ParamCompleter -LongName stripTrailingCr -Description $msg.stripTrailingCr
    New-ParamCompleter -ShortName D -LongName ifdef -Description $msg.ifdef -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -LongName gtypeGroupFormat -Description $msg.gtypeGroupFormat -Arguments @{ Name = 'GFMT' }
    New-ParamCompleter -LongName lineFormat -Description $msg.lineFormat -Arguments @{ Name = 'LFMT' }
    New-ParamCompleter -LongName ltypeLineFormat -Description $msg.ltypeLineFormat -Arguments @{ Name = 'LFMT' }
    New-ParamCompleter -ShortName d -LongName minimal -Description $msg.minimal
    New-ParamCompleter -LongName horizonLines -Description $msg.horizonLines -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -LongName speedLargeFiles -Description $msg.speedLargeFiles
    New-ParamCompleter -LongName color -Description $msg.color -Arguments @{ Name = 'WHEN'; Nargs = '?'; Candidates = 'never','always','auto' }
    New-ParamCompleter -LongName palette -Description $msg.palette -Arguments @{ Name = 'COLORS' }
    New-ParamCompleter -LongName help -Description $msg.help
    New-ParamCompleter -ShortName v -LongName version -Description $msg.version
)
