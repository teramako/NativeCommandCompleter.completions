<#
 # curl completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    abstract-unix-socket     = Connect via abstract Unix domain socket
    alt-svc                  = Enable alt-svc with this cache file
    anyauth                  = Pick any authentication method
    append                   = Append to target file when uploading
    basic                    = Use HTTP Basic Authentication
    cacert                   = CA certificate to verify peer against
    capath                   = CA directory to verify peer against
    cert-status              = Verify the status of the server cert
    cert-type                = Certificate file type (DER/PEM/ENG)
    cert                     = Client certificate file and password
    ciphers                  = SSL ciphers to use
    compressed-ssh           = Enable SSH compression
    compressed               = Request compressed response
    config                   = Read config from a file
    connect-timeout          = Maximum time allowed for connection
    connect-to               = Connect to host
    continue-at              = Resumed transfer offset
    cookie-jar               = Write cookies to FILE after operation
    cookie                   = Send cookies from string/file
    create-dirs              = Create necessary local directory hierarchy
    crlf                     = Convert LF to CRLF in upload
    crlfile                  = Get a CRL list in PEM format from the given file
    data-ascii               = HTTP POST ASCII data
    data-binary              = HTTP POST binary data
    data-raw                 = HTTP POST data without special interpretation
    data-urlencode           = HTTP POST data url encoded
    data                     = HTTP POST data
    delegation               = GSS-API delegation permission
    digest                   = Use HTTP Digest Authentication
    disable-eprt             = Inhibit using EPRT or LPRT
    disable-epsv             = Inhibit using EPSV
    disable                  = Disable a curl internal option
    disallow-username-in-url = Disallow username in url
    dns-interface            = Interface to use for DNS requests
    dns-ipv4-addr            = IPv4 address to use for DNS requests
    dns-ipv6-addr            = IPv6 address to use for DNS requests
    dns-servers              = DNS server addrs to use
    doh-url                  = Resolve host names over DOH
    dump-header              = Write the received headers to FILE
    egd-file                 = EGD socket path for random data
    engine                   = Crypto engine to use
    expect100-timeout        = How long to wait for 100-continue
    fail-early               = Fail on first transfer error
    fail                     = Fail silently on HTTP errors
    false-start              = Enable TLS False Start
    form-string              = Specify HTTP multipart POST data
    form                     = Specify HTTP multipart POST data
    ftp-account              = Account data string
    ftp-alternative-to-user  = String to replace USER [name]
    ftp-create-dirs          = Create the remote dirs if not present
    ftp-method               = Control CWD usage
    ftp-pasv                 = Use PASV/EPSV instead of PORT
    ftp-port                 = Use PORT instead of PASV
    ftp-pret                 = Send PRET before PASV
    ftp-skip-pasv-ip         = Skip the IP address for PASV
    ftp-ssl-ccc-mode         = Set CCC mode
    ftp-ssl-ccc              = Send CCC after authenticating
    ftp-ssl-control          = Require SSL/TLS for FTP login, clear for transfer
    get                      = Send the -d data with a HTTP GET
    globoff                  = Disable URL globbing
    happy-eyeballs-timeout-ms = Time for IPv6 before trying IPv4
    haproxy-protocol         = Send HAProxy PROXY protocol v1 header
    head                     = Show document info only
    header                   = Pass custom header(s) to server
    help                     = Get help for commands
    hostpubmd5               = Acceptable MD5 hash of the host public key
    http0.9                  = Allow HTTP 0.9 responses
    http1.0                  = Use HTTP 1.0
    http1.1                  = Use HTTP 1.1
    http2-prior-knowledge    = Use HTTP 2 without HTTP/1.1 Upgrade
    http2                    = Use HTTP 2
    ignore-content-length    = Ignore the size of the remote resource
    include                  = Include protocol response headers in output
    insecure                 = Allow insecure server connections
    interface                = Use network INTERFACE (or address)
    ipv4                     = Resolve names to IPv4 addresses
    ipv6                     = Resolve names to IPv6 addresses
    junk-session-cookies     = Ignore session cookies read from file
    keepalive-time           = Interval time for keepalive probes
    key-type                 = Private key file type (DER/PEM/ENG)
    key                      = Private key file name
    krb                      = Enable Kerberos with security LEVEL
    libcurl                  = Dump libcurl equivalent code of this command line
    limit-rate               = Limit transfer speed to RATE
    list-only                = List only mode
    local-port               = Force use of RANGE for local port numbers
    location-trusted         = Like --location, and send auth to other hosts
    location                 = Follow redirects
    login-options            = Server login options
    mail-auth                = Originator address of the original email
    mail-from                = Mail from this address
    mail-rcpt                = Mail to this address
    manual                   = Display the full manual
    max-filesize             = Maximum file size to download
    max-redirs               = Maximum number of redirects allowed
    max-time                 = Maximum time allowed for the transfer
    metalink                 = Process given URLs as metalink XML file
    negotiate                = Use HTTP Negotiate (SPNEGO) authentication
    netrc-file               = Specify FILE for netrc
    netrc-optional           = Use either .netrc or URL
    netrc                    = Must read .netrc for user name and password
    next                     = Make next URL use its separate set of options
    no-alpn                  = Disable the ALPN TLS extension
    no-buffer                = Disable buffering of the output stream
    no-keepalive             = Disable TCP keepalive on the connection
    no-npn                   = Disable the NPN TLS extension
    no-sessionid             = Disable SSL session-ID reusing
    noproxy                  = List of hosts which do not use proxy
    ntlm-wb                  = Use HTTP NTLM authentication with winbind
    ntlm                     = Use HTTP NTLM authentication
    oauth2-bearer            = OAuth 2 Bearer Token
    output                   = Write to file instead of stdout
    pass                     = Pass phrase for the private key
    path-as-is               = Do not handle sequences of /../ or /./
    pinnedpubkey             = FILE/HASHES Public key to verify peer against
    post301                  = Do not switch to GET after following a 301
    post302                  = Do not switch to GET after following a 302
    post303                  = Do not switch to GET after following a 303
    preproxy                 = Use this proxy first
    progress-bar             = Display transfer progress as a bar
    proto-default            = Use PROTOCOL for any URL missing a scheme
    proto-redir              = Enable/disable PROTOCOLS on redirect
    proto                    = Enable/disable PROTOCOLS
    proxy-anyauth            = Pick any proxy authentication method
    proxy-basic              = Use Basic authentication on the proxy
    proxy-cacert             = CA certificate to verify peer against for proxy
    proxy-capath             = CA directory to verify peer against for proxy
    proxy-cert-type          = Client certificate type for HTTPS proxy
    proxy-cert               = Set client certificate for proxy
    proxy-ciphers            = SSL ciphers to use for proxy
    proxy-crlfile            = Set a CRL list for proxy
    proxy-digest             = Use Digest authentication on the proxy
    proxy-header             = Pass custom header(s) to proxy
    proxy-insecure           = Do HTTPS proxy connections without verifying the proxy
    proxy-key-type           = Private key file type for proxy
    proxy-key                = Private key for HTTPS proxy
    proxy-negotiate          = Use HTTP Negotiate (SPNEGO) authentication on the proxy
    proxy-ntlm               = Use NTLM authentication on the proxy
    proxy-pass               = Pass phrase for the private key for HTTPS proxy
    proxy-pinnedpubkey       = FILE/HASHES public key to verify proxy with
    proxy-service-name       = SPNEGO proxy service name
    proxy-ssl-allow-beast    = Allow security flaw for interop for HTTPS proxy
    proxy-tls13-ciphers      = TLS 1.3 cipher suites for proxy
    proxy-tlsauthtype        = TLS authentication type for HTTPS proxy
    proxy-tlspassword        = TLS password for HTTPS proxy
    proxy-tlsuser            = TLS username for HTTPS proxy
    proxy-tlsv1              = Use TLSv1 for HTTPS proxy
    proxy-user               = Proxy user and password
    proxy                    = Use this proxy
    proxy1.0                 = Use HTTP/1.0 proxy on given port
    proxytunnel              = Operate through a HTTP proxy tunnel
    pubkey                   = SSH Public key file name
    quote                    = Send command(s) to server before transfer
    random-file              = File for reading random data from
    range                    = Retrieve only the bytes within RANGE
    raw                      = Do HTTP raw; no transfer decoding
    referer                  = Referrer URL
    remote-header-name       = Use the header-provided filename
    remote-name-all          = Use the remote file name for all URLs
    remote-name              = Write output to a file named as the remote file
    remote-time              = Set the remote file's time on the local output
    request-target           = Specify the target for this request
    request                  = Specify request command to use
    resolve                  = Resolve the host+port to this address
    retry-connrefused        = Retry on connection refused
    retry-delay              = Wait time between retries
    retry-max-time           = Retry only within this period
    retry                    = Retry request if transient problems occur
    sasl-ir                  = Enable initial response in SASL authentication
    service-name             = SPNEGO service name
    show-error               = Show error even when -s is used
    silent                   = Silent mode
    socks4                   = SOCKS4 proxy on given host + port
    socks4a                  = SOCKS4a proxy on given host + port
    socks5-basic             = Enable username/password auth for SOCKS5 proxies
    socks5-gssapi-nec        = Compatibility with NEC SOCKS5 server
    socks5-gssapi-service    = SOCKS5 proxy service name for GSS-API
    socks5-gssapi            = Enable GSS-API auth for SOCKS5 proxies
    socks5-hostname          = SOCKS5 proxy, pass host name to proxy
    socks5                   = SOCKS5 proxy on given host + port
    speed-limit              = Stop transfers slower than this
    speed-time               = Trigger 'speed-limit' abort after this time
    ssl-allow-beast          = Allow security flaw to improve interop
    ssl-no-revoke            = Disable cert revocation checks (WinSSL)
    ssl-reqd                 = Require SSL/TLS
    ssl                      = Try SSL/TLS
    sslv2                    = Use SSLv2
    sslv3                    = Use SSLv3
    stderr                   = Where to redirect stderr
    styled-output            = Enable styled output for HTTP headers
    suppress-connect-headers = Suppress proxy CONNECT response headers
    tcp-fastopen             = Use TCP Fast Open
    tcp-nodelay              = Use the TCP_NODELAY option
    telnet-option            = Set telnet option
    tftp-blksize             = Set TFTP BLKSIZE option
    tftp-no-options          = Do not send any TFTP options
    time-cond                = Transfer based on a time condition
    tls-max                  = Set maximum allowed TLS version
    tls13-ciphers            = TLS 1.3 cipher suites to use
    tlsauthtype              = TLS authentication type
    tlspassword              = TLS password
    tlsuser                  = TLS user name
    tlsv1.0                  = Use TLSv1.0 or greater
    tlsv1.1                  = Use TLSv1.1 or greater
    tlsv1.2                  = Use TLSv1.2 or greater
    tlsv1.3                  = Use TLSv1.3 or greater
    tlsv1                    = Use TLSv1.0 or greater
    tr-encoding              = Request compressed transfer encoding
    trace-ascii              = Like --trace, but without hex output
    trace-time               = Add time stamps to trace/verbose output
    trace                    = Write a debug trace to FILE
    unix-socket              = Connect through this Unix domain socket
    upload-file              = Transfer local FILE to destination
    url                      = URL to work with
    use-ascii                = Use ASCII/text transfer
    user-agent               = Send User-Agent STRING to server
    user                     = Server user and password
    verbose                  = Make the operation more talkative
    version                  = Show version number and quit
    write-out                = Use output FORMAT after completion
    xattr                    = Store metadata in extended file attributes
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$fileArgument = New-ArgumentCompleter FILE -Type File
$fileTypeArgument = New-ArgumentCompleter TYPE -Candidates 'DER','PEM','ENG'
$dataArgument = New-ArgumentCompleter DATA
$addressArgument = New-ArgumentCompleter ADDRESS

Register-NativeCompleter -Name curl -Description 'transfer a URL' -Parameters @(
    New-ParamCompleter -LongName abstract-unix-socket -Description $msg.'abstract-unix-socket' -Arguments @{ Name = 'PATH' }
    New-ParamCompleter -LongName alt-svc -Description $msg.'alt-svc' -Arguments $fileArgument
    New-ParamCompleter -LongName anyauth -Description $msg.'anyauth'
    New-ParamCompleter -ShortName a -LongName append -Description $msg.'append'
    New-ParamCompleter -LongName basic -Description $msg.'basic'
    New-ParamCompleter -LongName cacert -Description $msg.'cacert' -Arguments $fileArgument
    New-ParamCompleter -LongName capath -Description $msg.'capath' -Arguments @{ Name = 'DIR'; Type = 'Directory' }
    New-ParamCompleter -LongName cert-status -Description $msg.'cert-status'
    New-ParamCompleter -LongName cert-type -Description $msg.'cert-type' -Arguments $fileTypeArgument
    New-ParamCompleter -ShortName E -LongName cert -Description $msg.'cert' -Arguments @{ Name = 'CERT[:PASSWD]' }
    New-ParamCompleter -LongName ciphers -Description $msg.'ciphers' -Arguments @{ Name = 'LIST' }
    New-ParamCompleter -LongName compressed-ssh -Description $msg.'compressed-ssh'
    New-ParamCompleter -LongName compressed -Description $msg.'compressed'
    New-ParamCompleter -ShortName K -LongName config -Description $msg.'config' -Arguments $fileArgument
    New-ParamCompleter -LongName connect-timeout -Description $msg.'connect-timeout' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName connect-to -Description $msg.'connect-to' -Arguments @{ Name = 'HOST1:PORT1:HOST2:PORT2' }
    New-ParamCompleter -ShortName C -LongName continue-at -Description $msg.'continue-at' -Arguments @{ Name = 'OFFSET' }
    New-ParamCompleter -ShortName c -LongName cookie-jar -Description $msg.'cookie-jar' -Arguments $fileArgument
    New-ParamCompleter -ShortName b -LongName cookie -Description $msg.'cookie' -Arguments @{ Name = 'DATA|FILENAME' }
    New-ParamCompleter -LongName create-dirs -Description $msg.'create-dirs'
    New-ParamCompleter -LongName crlf -Description $msg.'crlf'
    New-ParamCompleter -LongName crlfile -Description $msg.'crlfile' -Arguments $fileArgument
    New-ParamCompleter -LongName data-ascii -Description $msg.'data-ascii' -Arguments $dataArgument
    New-ParamCompleter -LongName data-binary -Description $msg.'data-binary' -Arguments $dataArgument
    New-ParamCompleter -LongName data-raw -Description $msg.'data-raw' -Arguments $dataArgument
    New-ParamCompleter -LongName data-urlencode -Description $msg.'data-urlencode' -Arguments $dataArgument
    New-ParamCompleter -ShortName d -LongName data -Description $msg.'data' -Arguments $dataArgument
    New-ParamCompleter -LongName delegation -Description $msg.'delegation' -Arguments @{ Name = 'LEVEL'; Candidates = 'none','policy','always' }
    New-ParamCompleter -LongName digest -Description $msg.'digest'
    New-ParamCompleter -LongName disable-eprt -Description $msg.'disable-eprt'
    New-ParamCompleter -LongName disable-epsv -Description $msg.'disable-epsv'
    New-ParamCompleter -LongName disable -Description $msg.'disable'
    New-ParamCompleter -LongName disallow-username-in-url -Description $msg.'disallow-username-in-url'
    New-ParamCompleter -LongName dns-interface -Description $msg.'dns-interface' -Arguments @{ Name = 'INTERFACE' }
    New-ParamCompleter -LongName dns-ipv4-addr -Description $msg.'dns-ipv4-addr' -Arguments $addressArgument
    New-ParamCompleter -LongName dns-ipv6-addr -Description $msg.'dns-ipv6-addr' -Arguments $addressArgument
    New-ParamCompleter -LongName dns-servers -Description $msg.'dns-servers' -Arguments @{ Name = 'ADDRESSES' }
    New-ParamCompleter -LongName doh-url -Description $msg.'doh-url' -Arguments @{ Name = 'URL' }
    New-ParamCompleter -ShortName D -LongName dump-header -Description $msg.'dump-header' -Arguments $fileArgument
    New-ParamCompleter -LongName egd-file -Description $msg.'egd-file' -Arguments $fileArgument
    New-ParamCompleter -LongName engine -Description $msg.'engine' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -LongName expect100-timeout -Description $msg.'expect100-timeout' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName fail-early -Description $msg.'fail-early'
    New-ParamCompleter -ShortName f -LongName fail -Description $msg.'fail'
    New-ParamCompleter -LongName false-start -Description $msg.'false-start'
    New-ParamCompleter -LongName form-string -Description $msg.'form-string' -Arguments @{ Name = 'NAME=STRING' }
    New-ParamCompleter -ShortName F -LongName form -Description $msg.'form' -Arguments @{ Name = 'NAME=CONTENT' }
    New-ParamCompleter -LongName ftp-account -Description $msg.'ftp-account' -Arguments $dataArgument
    New-ParamCompleter -LongName ftp-alternative-to-user -Description $msg.'ftp-alternative-to-user' -Arguments @{ Name = 'COMMAND' }
    New-ParamCompleter -LongName ftp-create-dirs -Description $msg.'ftp-create-dirs'
    New-ParamCompleter -LongName ftp-method -Description $msg.'ftp-method' -Arguments @{ Name = 'METHOD'; Candidates = 'multicwd','nocwd','singlecwd' }
    New-ParamCompleter -LongName ftp-pasv -Description $msg.'ftp-pasv'
    New-ParamCompleter -ShortName P -LongName ftp-port -Description $msg.'ftp-port' -Arguments $addressArgument
    New-ParamCompleter -LongName ftp-pret -Description $msg.'ftp-pret'
    New-ParamCompleter -LongName ftp-skip-pasv-ip -Description $msg.'ftp-skip-pasv-ip'
    New-ParamCompleter -LongName ftp-ssl-ccc-mode -Description $msg.'ftp-ssl-ccc-mode' -Arguments @{ Name = 'MODE'; Candidates = 'active','passive' }
    New-ParamCompleter -LongName ftp-ssl-ccc -Description $msg.'ftp-ssl-ccc'
    New-ParamCompleter -LongName ftp-ssl-control -Description $msg.'ftp-ssl-control'
    New-ParamCompleter -ShortName G -LongName get -Description $msg.'get'
    New-ParamCompleter -ShortName g -LongName globoff -Description $msg.'globoff'
    New-ParamCompleter -LongName happy-eyeballs-timeout-ms -Description $msg.'happy-eyeballs-timeout-ms' -Arguments @{ Name = 'MILLISECONDS' }
    New-ParamCompleter -LongName haproxy-protocol -Description $msg.'haproxy-protocol'
    New-ParamCompleter -ShortName I -LongName head -Description $msg.'head'
    New-ParamCompleter -ShortName H -LongName header -Description $msg.'header' -Arguments @{ Name = 'LINE' }
    New-ParamCompleter -ShortName h -LongName help -Description $msg.'help' -Arguments 'all','category'
    New-ParamCompleter -LongName hostpubmd5 -Description $msg.'hostpubmd5' -Arguments @{ Name = 'MD5' }
    New-ParamCompleter -LongName http0.9 -Description $msg.'http0.9'
    New-ParamCompleter -ShortName '0' -LongName http1.0 -Description $msg.'http1.0'
    New-ParamCompleter -LongName http1.1 -Description $msg.'http1.1'
    New-ParamCompleter -LongName http2-prior-knowledge -Description $msg.'http2-prior-knowledge'
    New-ParamCompleter -LongName http2 -Description $msg.'http2'
    New-ParamCompleter -LongName ignore-content-length -Description $msg.'ignore-content-length'
    New-ParamCompleter -ShortName i -LongName include -Description $msg.'include'
    New-ParamCompleter -ShortName k -LongName insecure -Description $msg.'insecure'
    New-ParamCompleter -LongName interface -Description $msg.'interface' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -ShortName '4' -LongName ipv4 -Description $msg.'ipv4'
    New-ParamCompleter -ShortName '6' -LongName ipv6 -Description $msg.'ipv6'
    New-ParamCompleter -ShortName j -LongName junk-session-cookies -Description $msg.'junk-session-cookies'
    New-ParamCompleter -LongName keepalive-time -Description $msg.'keepalive-time' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName key-type -Description $msg.'key-type' -Arguments $fileTypeArgument
    New-ParamCompleter -LongName key -Description $msg.'key' -Arguments @{ Name = 'KEY'; Type = 'File' }
    New-ParamCompleter -LongName krb -Description $msg.'krb' -Arguments @{ Name = 'LEVEL'; Candidates = 'clear','safe','confidential','private' }
    New-ParamCompleter -LongName libcurl -Description $msg.'libcurl' -Arguments $fileArgument
    New-ParamCompleter -LongName limit-rate -Description $msg.'limit-rate' -Arguments @{ Name = 'SPEED' }
    New-ParamCompleter -ShortName l -LongName list-only -Description $msg.'list-only'
    New-ParamCompleter -LongName local-port -Description $msg.'local-port' -Arguments @{ Name = 'RANGE' }
    New-ParamCompleter -LongName location-trusted -Description $msg.'location-trusted'
    New-ParamCompleter -ShortName L -LongName location -Description $msg.'location'
    New-ParamCompleter -LongName login-options -Description $msg.'login-options' -Arguments @{ Name = 'OPTIONS' }
    New-ParamCompleter -LongName mail-auth -Description $msg.'mail-auth' -Arguments $addressArgument
    New-ParamCompleter -LongName mail-from -Description $msg.'mail-from' -Arguments $addressArgument
    New-ParamCompleter -LongName mail-rcpt -Description $msg.'mail-rcpt' -Arguments $addressArgument
    New-ParamCompleter -ShortName M -LongName manual -Description $msg.'manual'
    New-ParamCompleter -LongName max-filesize -Description $msg.'max-filesize' -Arguments @{ Name = 'BYTES' }
    New-ParamCompleter -LongName max-redirs -Description $msg.'max-redirs' -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -ShortName m -LongName max-time -Description $msg.'max-time' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName metalink -Description $msg.'metalink'
    New-ParamCompleter -LongName negotiate -Description $msg.'negotiate'
    New-ParamCompleter -LongName netrc-file -Description $msg.'netrc-file' -Arguments $fileArgument
    New-ParamCompleter -LongName netrc-optional -Description $msg.'netrc-optional'
    New-ParamCompleter -ShortName n -LongName netrc -Description $msg.'netrc'
    New-ParamCompleter -LongName next -Description $msg.'next'
    New-ParamCompleter -LongName no-alpn -Description $msg.'no-alpn'
    New-ParamCompleter -ShortName N -LongName no-buffer -Description $msg.'no-buffer'
    New-ParamCompleter -LongName no-keepalive -Description $msg.'no-keepalive'
    New-ParamCompleter -LongName no-npn -Description $msg.'no-npn'
    New-ParamCompleter -LongName no-sessionid -Description $msg.'no-sessionid'
    New-ParamCompleter -LongName noproxy -Description $msg.'noproxy' -Arguments @{ Name = 'LIST' }
    New-ParamCompleter -LongName ntlm-wb -Description $msg.'ntlm-wb'
    New-ParamCompleter -LongName ntlm -Description $msg.'ntlm'
    New-ParamCompleter -LongName oauth2-bearer -Description $msg.'oauth2-bearer' -Arguments @{ Name = 'TOKEN' }
    New-ParamCompleter -ShortName o -LongName output -Description $msg.'output' -Arguments $fileArgument
    New-ParamCompleter -LongName pass -Description $msg.'pass' -Arguments @{ Name = 'PHRASE' }
    New-ParamCompleter -LongName path-as-is -Description $msg.'path-as-is'
    New-ParamCompleter -LongName pinnedpubkey -Description $msg.'pinnedpubkey' -Arguments @{ Name = 'HASHES' }
    New-ParamCompleter -LongName post301 -Description $msg.'post301'
    New-ParamCompleter -LongName post302 -Description $msg.'post302'
    New-ParamCompleter -LongName post303 -Description $msg.'post303'
    New-ParamCompleter -LongName preproxy -Description $msg.'preproxy' -Arguments @{ Name = '[PROTOCOL://]HOST[:PORT]' }
    New-ParamCompleter -ShortName '#' -LongName progress-bar -Description $msg.'progress-bar'
    New-ParamCompleter -LongName proto-default -Description $msg.'proto-default' -Arguments @{ Name = 'PROTOCOL' }
    New-ParamCompleter -LongName proto-redir -Description $msg.'proto-redir' -Arguments @{ Name = 'PROTOCOLS' }
    New-ParamCompleter -LongName proto -Description $msg.'proto' -Arguments @{ Name = 'PROTOCOLS' }
    New-ParamCompleter -LongName proxy-anyauth -Description $msg.'proxy-anyauth'
    New-ParamCompleter -LongName proxy-basic -Description $msg.'proxy-basic'
    New-ParamCompleter -LongName proxy-cacert -Description $msg.'proxy-cacert' -Arguments $fileArgument
    New-ParamCompleter -LongName proxy-capath -Description $msg.'proxy-capath' -Arguments @{ Name = 'DIR'; Type = 'Directory' }
    New-ParamCompleter -LongName proxy-cert-type -Description $msg.'proxy-cert-type' -Arguments @{ Name = 'TYPE'; Candidates = 'DER','PEM' }
    New-ParamCompleter -LongName proxy-cert -Description $msg.'proxy-cert' -Arguments @{ Name = 'CERT[:PASSWD]' }
    New-ParamCompleter -LongName proxy-ciphers -Description $msg.'proxy-ciphers' -Arguments @{ Name = 'LIST' }
    New-ParamCompleter -LongName proxy-crlfile -Description $msg.'proxy-crlfile' -Arguments $fileArgument
    New-ParamCompleter -LongName proxy-digest -Description $msg.'proxy-digest'
    New-ParamCompleter -LongName proxy-header -Description $msg.'proxy-header' -Arguments @{ Name = 'LINE' }
    New-ParamCompleter -LongName proxy-insecure -Description $msg.'proxy-insecure'
    New-ParamCompleter -LongName proxy-key-type -Description $msg.'proxy-key-type' -Arguments $fileTypeArgument
    New-ParamCompleter -LongName proxy-key -Description $msg.'proxy-key' -Arguments @{ Name = 'KEY'; Type = 'File' }
    New-ParamCompleter -LongName proxy-negotiate -Description $msg.'proxy-negotiate'
    New-ParamCompleter -LongName proxy-ntlm -Description $msg.'proxy-ntlm'
    New-ParamCompleter -LongName proxy-pass -Description $msg.'proxy-pass' -Arguments @{ Name = 'PHRASE' }
    New-ParamCompleter -LongName proxy-pinnedpubkey -Description $msg.'proxy-pinnedpubkey' -Arguments @{ Name = 'HASHES' }
    New-ParamCompleter -LongName proxy-service-name -Description $msg.'proxy-service-name' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -LongName proxy-ssl-allow-beast -Description $msg.'proxy-ssl-allow-beast'
    New-ParamCompleter -LongName proxy-tls13-ciphers -Description $msg.'proxy-tls13-ciphers' -Arguments @{ Name = 'LIST' }
    New-ParamCompleter -LongName proxy-tlsauthtype -Description $msg.'proxy-tlsauthtype' -Arguments @{ Name = 'TYPE' }
    New-ParamCompleter -LongName proxy-tlspassword -Description $msg.'proxy-tlspassword' -Arguments @{ Name = 'STRING' }
    New-ParamCompleter -LongName proxy-tlsuser -Description $msg.'proxy-tlsuser' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -LongName proxy-tlsv1 -Description $msg.'proxy-tlsv1'
    New-ParamCompleter -ShortName U -LongName proxy-user -Description $msg.'proxy-user' -Arguments @{ Name = 'USER:PASSWORD' }
    New-ParamCompleter -ShortName x -LongName proxy -Description $msg.'proxy' -Arguments @{ Name = '[PROTOCOL://]HOST[:PORT]' }
    New-ParamCompleter -LongName proxy1.0 -Description $msg.'proxy1.0' -Arguments @{ Name = 'HOST[:PORT]' }
    New-ParamCompleter -ShortName p -LongName proxytunnel -Description $msg.'proxytunnel'
    New-ParamCompleter -LongName pubkey -Description $msg.'pubkey' -Arguments @{ Name = 'KEY'; Type = 'File' }
    New-ParamCompleter -ShortName Q -LongName quote -Description $msg.'quote' -Arguments @{ Name = 'COMMAND' }
    New-ParamCompleter -LongName random-file -Description $msg.'random-file' -Arguments $fileArgument
    New-ParamCompleter -ShortName r -LongName range -Description $msg.'range' -Arguments @{ Name = 'RANGE' }
    New-ParamCompleter -LongName raw -Description $msg.'raw'
    New-ParamCompleter -ShortName e -LongName referer -Description $msg.'referer' -Arguments @{ Name = 'URL' }
    New-ParamCompleter -ShortName J -LongName remote-header-name -Description $msg.'remote-header-name'
    New-ParamCompleter -LongName remote-name-all -Description $msg.'remote-name-all'
    New-ParamCompleter -ShortName O -LongName remote-name -Description $msg.'remote-name'
    New-ParamCompleter -ShortName R -LongName remote-time -Description $msg.'remote-time'
    New-ParamCompleter -LongName request-target -Description $msg.'request-target' -Arguments @{ Name = 'PATH' }
    New-ParamCompleter -ShortName X -LongName request -Description $msg.'request' -Arguments @{ Name = 'COMMAND' }
    New-ParamCompleter -LongName resolve -Description $msg.'resolve' -Arguments @{ Name = 'HOST:PORT:ADDRESS' }
    New-ParamCompleter -LongName retry-connrefused -Description $msg.'retry-connrefused'
    New-ParamCompleter -LongName retry-delay -Description $msg.'retry-delay' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName retry-max-time -Description $msg.'retry-max-time' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName retry -Description $msg.'retry' -Arguments @{ Name = 'NUM' }
    New-ParamCompleter -LongName sasl-ir -Description $msg.'sasl-ir'
    New-ParamCompleter -LongName service-name -Description $msg.'service-name' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -ShortName S -LongName show-error -Description $msg.'show-error'
    New-ParamCompleter -ShortName s -LongName silent -Description $msg.'silent'
    New-ParamCompleter -LongName socks4 -Description $msg.'socks4' -Arguments @{ Name = 'HOST[:PORT]' }
    New-ParamCompleter -LongName socks4a -Description $msg.'socks4a' -Arguments @{ Name = 'HOST[:PORT]' }
    New-ParamCompleter -LongName socks5-basic -Description $msg.'socks5-basic'
    New-ParamCompleter -LongName socks5-gssapi-nec -Description $msg.'socks5-gssapi-nec'
    New-ParamCompleter -LongName socks5-gssapi-service -Description $msg.'socks5-gssapi-service' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -LongName socks5-gssapi -Description $msg.'socks5-gssapi'
    New-ParamCompleter -LongName socks5-hostname -Description $msg.'socks5-hostname' -Arguments @{ Name = 'HOST[:PORT]' }
    New-ParamCompleter -LongName socks5 -Description $msg.'socks5' -Arguments @{ Name = 'HOST[:PORT]' }
    New-ParamCompleter -ShortName Y -LongName speed-limit -Description $msg.'speed-limit' -Arguments @{ Name = 'SPEED' }
    New-ParamCompleter -ShortName y -LongName speed-time -Description $msg.'speed-time' -Arguments @{ Name = 'SECONDS' }
    New-ParamCompleter -LongName ssl-allow-beast -Description $msg.'ssl-allow-beast'
    New-ParamCompleter -LongName ssl-no-revoke -Description $msg.'ssl-no-revoke'
    New-ParamCompleter -LongName ssl-reqd -Description $msg.'ssl-reqd'
    New-ParamCompleter -LongName ssl -Description $msg.'ssl'
    New-ParamCompleter -ShortName '2' -LongName sslv2 -Description $msg.'sslv2'
    New-ParamCompleter -ShortName '3' -LongName sslv3 -Description $msg.'sslv3'
    New-ParamCompleter -LongName stderr -Description $msg.'stderr' -Arguments $fileArgument
    New-ParamCompleter -LongName styled-output -Description $msg.'styled-output'
    New-ParamCompleter -LongName suppress-connect-headers -Description $msg.'suppress-connect-headers'
    New-ParamCompleter -LongName tcp-fastopen -Description $msg.'tcp-fastopen'
    New-ParamCompleter -LongName tcp-nodelay -Description $msg.'tcp-nodelay'
    New-ParamCompleter -ShortName t -LongName telnet-option -Description $msg.'telnet-option' -Arguments @{ Name = 'OPT=VAL' }
    New-ParamCompleter -LongName tftp-blksize -Description $msg.'tftp-blksize' -Arguments @{ Name = 'VALUE' }
    New-ParamCompleter -LongName tftp-no-options -Description $msg.'tftp-no-options'
    New-ParamCompleter -ShortName z -LongName time-cond -Description $msg.'time-cond' -Arguments @{ Name = 'TIME' }
    New-ParamCompleter -LongName tls-max -Description $msg.'tls-max' -Arguments @{ Name = 'VERSION'; Candidates = '1.0','1.1','1.2','1.3' }
    New-ParamCompleter -LongName tls13-ciphers -Description $msg.'tls13-ciphers' -Arguments @{ Name = 'LIST' }
    New-ParamCompleter -LongName tlsauthtype -Description $msg.'tlsauthtype' -Arguments @{ Name = 'TYPE' }
    New-ParamCompleter -LongName tlspassword -Description $msg.'tlspassword' -Arguments @{ Name = 'STRING' }
    New-ParamCompleter -LongName tlsuser -Description $msg.'tlsuser' -Arguments @{ Name = 'USER' }
    New-ParamCompleter -LongName tlsv1.0 -Description $msg.'tlsv1.0'
    New-ParamCompleter -LongName tlsv1.1 -Description $msg.'tlsv1.1'
    New-ParamCompleter -LongName tlsv1.2 -Description $msg.'tlsv1.2'
    New-ParamCompleter -LongName tlsv1.3 -Description $msg.'tlsv1.3'
    New-ParamCompleter -ShortName '1' -LongName tlsv1 -Description $msg.'tlsv1'
    New-ParamCompleter -LongName tr-encoding -Description $msg.'tr-encoding'
    New-ParamCompleter -LongName trace-ascii -Description $msg.'trace-ascii' -Arguments $fileArgument
    New-ParamCompleter -LongName trace-time -Description $msg.'trace-time'
    New-ParamCompleter -LongName trace -Description $msg.'trace' -Arguments $fileArgument
    New-ParamCompleter -LongName unix-socket -Description $msg.'unix-socket' -Arguments @{ Name = 'PATH' }
    New-ParamCompleter -ShortName T -LongName upload-file -Description $msg.'upload-file' -Arguments $fileArgument
    New-ParamCompleter -LongName url -Description $msg.'url' -Arguments @{ Name = 'URL' }
    New-ParamCompleter -ShortName B -LongName use-ascii -Description $msg.'use-ascii'
    New-ParamCompleter -ShortName A -LongName user-agent -Description $msg.'user-agent' -Arguments @{ Name = 'NAME' }
    New-ParamCompleter -ShortName u -LongName user -Description $msg.'user' -Arguments @{ Name = 'USER:PASSWORD' }
    New-ParamCompleter -ShortName v -LongName verbose -Description $msg.'verbose'
    New-ParamCompleter -ShortName V -LongName version -Description $msg.'version'
    New-ParamCompleter -ShortName w -LongName write-out -Description $msg.'write-out' -Arguments @{ Name = 'FORMAT' }
    New-ParamCompleter -LongName xattr -Description $msg.'xattr'
)
