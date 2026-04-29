<#
 # awk completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    awk                  = pattern scanning and text processing language
    assign               = Set variable VAR to value
    bignum               = Force arbitrary precision arithmetic on numbers
    characters_as_bytes  = Treat all input data as single-byte characters
    copyright            = Print copyright information
    debug                = Enable debugging
    dump_variables       = Print a sorted list of global variables and their final values to file
    exec                 = Execute AWK program text
    field_separator      = Use FS for the input field separator
    file                 = Read AWK program from file
    gen_pot              = Generate .pot file on stdout
    help                 = Print usage information
    include              = Load awk source library
    lint                 = Enable warnings about dubious or non-portable constructs
    lint_old             = Warn about constructs that are not available in the original awk
    load                 = Load dynamic extension
    non_decimal_data     = Recognize octal and hexadecimal values in input data
    no_optimize          = Disable default optimizations
    optimize             = Enable optimizations
    posix                = Turn on full POSIX conformance
    pretty_print         = Output a pretty-printed version of the program to file
    profile              = Send profiling data to file
    re_interval          = Allow interval expressions in regex matching
    sandbox              = Run in sandbox mode, disabling system() and redirections
    source               = Read AWK program from source-file
    traditional          = Disable all gawk-specific extensions
    use_lc_numeric       = Force use of locale's decimal point character
    version              = Print version information
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

Register-NativeCompleter -Name awk -Description $msg.awk -Parameters @(
    # Program specification
    New-ParamCompleter -ShortName f -LongName file -Description $msg.file -Arguments @{ Name = 'program-file'; Type = 'File' }
    New-ParamCompleter -ShortName e -LongName source -Description $msg.source -Arguments @{ Name = 'program-text' }
    New-ParamCompleter -ShortName E -LongName exec -Description $msg.exec -Arguments @{ Name = 'program-file'; Type = 'File' }

    # Variable assignment
    New-ParamCompleter -ShortName v -LongName assign -Description $msg.assign -Arguments @{ Name = 'var=val' }

    # Field separator
    New-ParamCompleter -ShortName F -LongName field-separator -Description $msg.field_separator -Arguments @{ Name = 'fs' }

    # Debugging and optimization
    New-ParamCompleter -ShortName D -LongName debug -Description $msg.debug -Arguments @{ Name = 'file'; Nargs = '?'; Type = 'File'}
    New-ParamCompleter -ShortName d -LongName dump-variables -Description $msg.dump_variables -Arguments @{ Name = 'file'; Nargs = '?'; Type = 'File' }
    New-ParamCompleter -ShortName o -LongName pretty-print -Description $msg.pretty_print -Arguments @{ Name = 'file'; Nargs = '?'; Type = 'File' }
    New-ParamCompleter -ShortName p -LongName profile -Description $msg.profile -Arguments @{ Name = 'prof-file'; Nargs = '?'; Type = 'File' }
    New-ParamCompleter -ShortName O -LongName optimize -Description $msg.optimize
    New-ParamCompleter -ShortName s -LongName no-optimize -Description $msg.no_optimize

    # Warnings and compatibility
    New-ParamCompleter -ShortName L -LongName lint -Description $msg.lint -Arguments @{ Name = 'value'; Nargs = '?'; Candidates = "fatal","invalid","no-ext" }
    New-ParamCompleter -ShortName t -LongName lint-old -Description $msg.lint_old
    New-ParamCompleter -ShortName c -LongName traditional -Description $msg.traditional
    New-ParamCompleter -ShortName P -LongName posix -Description $msg.posix

    # Extensions and libraries
    New-ParamCompleter -ShortName i -LongName include -Description $msg.include -Arguments @{  Name = 'source-file'; Type = 'File' }
    New-ParamCompleter -ShortName l -LongName load -Description $msg.load -Arguments @{ Name = 'extension'; Type = 'File' }

    # Data handling
    New-ParamCompleter -ShortName b -LongName characters-as-bytes -Description $msg.characters_as_bytes
    New-ParamCompleter -ShortName g -LongName gen-pot -Description $msg.gen_pot
    New-ParamCompleter -ShortName M -LongName bignum -Description $msg.bignum
    New-ParamCompleter -ShortName n -LongName non-decimal-data -Description $msg.non_decimal_data
    New-ParamCompleter -ShortName N -LongName use-lc-numeric -Description $msg.use_lc_numeric
    New-ParamCompleter -ShortName r -LongName re-interval -Description $msg.re_interval
    New-ParamCompleter -ShortName S -LongName sandbox -Description $msg.sandbox

    # Information
    New-ParamCompleter -ShortName C -LongName copyright -Description $msg.copyright
    New-ParamCompleter -ShortName h -LongName help -Description $msg.help
    New-ParamCompleter -ShortName V -LongName version -Description $msg.version
) -Arguments @{
    Name = 'program-txt'
    Nargs = '0+'
}
