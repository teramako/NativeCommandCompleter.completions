<#
 # openssl completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    openssl                 = OpenSSL command line tool
    help                    = Display help information
    version                 = Display version information

    _asn1parse               = Parse ASN.1 sequences
    _ca                      = Certificate Authority management
    _ciphers                 = Cipher suite description determination
    _cms                     = CMS utility - handles data in CMS format such as S/MIME v3.1 email messages.
    _crl                     = CRL utility - processes CRL files in DER or PEM format.
    _crl2pkcs7               = Create PKCS#7 structure from CRL
    _dgst                    = Message digest calculation
    _dhparam                 = DH parameter manipulation and generation
    _dsa                     = DSA data management
    _dsaparam                = DSA parameter manipulation and generation
    _ec                      = EC key processing
    _ecparam                 = EC parameter manipulation and generation
    _enc                     = Encoding with ciphers
    _engine                  = Engine information and manipulation
    _errstr                  = Error number to error string conversion
    _gendsa                  = Generate DSA private key
    _genpkey                 = Generate private key
    _genrsa                  = Generate RSA private key
    _info                    = Display diverse information
    _kdf                     = Key Derivation Function algorithms
    _list                    = List algorithms and features
    _mac                     = Message Authentication Code algorithms
    _nseq                    = Create or examine netscape certificate sequence
    _ocsp                    = OCSP utility
    _passwd                  = Compute password hashes
    _pkcs12                  = PKCS#12 file utility
    _pkcs7                   = PKCS#7 file utility
    _pkcs8                   = PKCS#8 format private key conversion
    _pkey                    = Public and private key management
    _pkeyparam               = Public key algorithm parameter management
    _pkeyutl                 = Public key algorithm utility
    _prime                   = Check if number is prime
    _rand                    = Generate pseudo-random bytes
    _randfile                = Generate random file
    _rehash                  = Create symbolic links to certificate files
    _req                     = PKCS#10 certificate request and certificate generating utility
    _rsa                     = RSA key management
    _rsautl                  = RSA utility for sign, verify, encrypt and decrypt
    _s_client                = SSL/TLS client program
    _s_server                = SSL/TLS server program
    _s_time                  = SSL/TLS performance timing program
    _sess_id                 = SSL session handling utility
    _smime                   = S/MIME mail processing
    _speed                   = Algorithm speed measurement
    _spkac                   = SPKAC printing and generating utility
    _srp                     = SRP utility
    _storeutl                = STORE utility
    _ts                      = Time Stamping Authority tool
    _verify                 = X.509 certificate verification
    _x509                    = X.509 certificate data management

    verbose                 = Verbose output
    quiet                   = Fewer details output about the operations
    config                  = Configuration file
    in                      = Input file
    out                     = Output file
    inform                  = Input format
    outform                 = Output format
    keyform                 = Private key format
    certform                = Certificate data format
    passin                  = Input file pass phrase source
    passout                 = Output file pass phrase source
    text                    = Print in text form
    noout                   = Don't output encoded version
    modulus                 = Print modulus value
    check                   = Check consistency
    pubin                   = Input is public key
    pubout                  = Output public key
    new                     = Generate new
    newkey                  = Generate new private key
    nodes                   = Don't encrypt private key
    keyout                  = Write private key to file
    days                    = Number of days cert is valid
    subj                    = Set or override request subject
    key                     = Private key file
    cert                    = Certificate file
    CAfile                  = CA certificate file
    no_CAfile               = Do not load the default file of trusted certificates
    CApath                  = CA certificate directory
    no_CApath               = Do not use the default directory of trusted certificates
    CAstore                 = Use uri as a store of CA certificates
    no_CAstore              = Do not use the default store of trusted CA certificates
    verify                  = Turn on peer certificate verification
    cipher                  = Cipher suite
    connect                 = Connect to host:port
    servername              = Set TLS SNI hostname
    starttls                = Use STARTTLS protocol
    brief                   = Brief output
    showcerts               = Show all certificates in chain
    prexit                  = Print session information on exit
    state                   = Print SSL session states
    debug                   = Print extensive debugging information
    msg                     = Show protocol messages
    msgfile                 = File to send output of -msg or -trace
    nbio                    = Turn on non-blocking IO
    crlf                    = Convert LF to CRLF
    ign_eof                 = Ignore input EOF
    no_ign_eof              = Don't ignore input EOF
    tls1                    = Use TLSv1
    tls1_1                  = Use TLSv1.1
    tls1_2                  = Use TLSv1.2
    tls1_3                  = Use TLSv1.3
    no_ssl3                 = Disable SSLv3
    no_tls1                 = Disable TLSv1
    no_tls1_1               = Disable TLSv1.1
    no_tls1_2               = Disable TLSv1.2
    no_tls1_3               = Disable TLSv1.3
    bugs                    = Enable workarounds for known bugs
    batch                   = Batch mode
    no_interactive          = non-interactive mode
    dateopt                 = Specify the date output format
    certopt                 = Customise the print format used with -text
    CRL                     = CRL file to use
    CRLform                 = The CRL file format
    crl_download            = Download CRL from distribution points in the certificate
    verifyCAfile            = Verifying the server's certificate
    verifyCApath            = Verifying the server's certificate containing in the dir
    verifyCAstore           = The URI of a store containing trusted certificates to use
    chainCAfile             = Use to build the client certificate chain
    chainCApath             = A directory containing in client certificate chain
    chainCAstore            = The URI of a store
    requestCAfile           = A file containing a list of certificates
    ca                      = Specifies the "CA" certificate
    cakey                   = Sets the "CA" private key to sign a certificate with
    caform                  = CA certificate data format
    cakeyform               = CA key format
    caserial                = Sets the CA serial number file to use
    pvk_strong              = Enable 'Strong' PVK encoding level (default)
    pvk_weak                = Enable 'Weak' PVK encoding level
    pvk_none                = Don't enforce PVK encoding

    format_PEM              = PEM format
    format_DER              = DER format
    format_P12              = PKCS#12 format
    format_SMIME            = S/MIME format
    format_ENGINE           = ENGINE format

    starttls_smtp           = SMTP protocol
    starttls_pop3           = POP3 protocol
    starttls_imap           = IMAP protocol
    starttls_ftp            = FTP protocol
    starttls_xmpp           = XMPP protocol

    asn1parse_offset        = Starting offset to begin parsing
    asn1parse_length        = Number of bytes to parse
    asn1parse_indent        = Indents the output according to the "depth" of the structures
    asn1parse_oid           = A file containing additional OBJECT IDENTIFIERs (OIDs)
    asn1parse_dump          = Dump unknown data in hex format
    asn1parse_dlimit        = Like -dump, but only the first num bytes are output
    asn1parse_strparse      = Parse the contents octets of the ASN.1 object starting at offset
    asn1parse_genstr        = Generate encoded data based on the specified string
    asn1parse_genconf       = Generate encoded data based on the specified file
    asn1parse_strictpem     = Treat as PEM format with base64 encoded
    asn1parse_item          = Attempt to decode and print the data as an ASN1_ITEM name

    ca_section              = Configuration file section to use (overrides default_ca in the ca section)
    ca_ss_cert              = A single self-signed certificate to be signed by the CA
    ca_spkac                = SPCAK format file
    ca_infiles              = certificate requests files
    ca_outdir               = The directory to output certificates to
    ca_keyfile              = Private key file
    ca_key                  = The password used to encrypt the private key (Better use -passin)
    ca_selfsign             = Create self-signed certificate
    ca_notext               = Don't output the text form of a certificate to the output file
    ca_days                 = The number of days from today
    ca_md                   = The message digest to use
    ca_policy               = This option defines the CA "policy" to use
    ca_preserveDN           = Set the order is the same as the request
    ca_noemailDN            = Delete EMAIL DN from Subject and set to extentions
    ca_extentions           = The section of the configuration file containing X.509 extensions
    ca_extfile              = An additional configuration file to read certificate extensions
    ca_subj                 = Subject name
    ca_create_serial        = Creates a new random serial file if not exists
    ca_rand_serial          = Generate a large random number to use as the serial number
    ca_gencrl               = Generates a CRL
    ca_crl_lastupdate       = Set CRL's lastUpdate field
    ca_crl_nextupdate       = Set CRL's nextUpdate field
    ca_crldays              = The number of days before the next CRL is due
    ca_crlhours             = The number of hours before the next CRL is due
    ca_crlsec               = The number of seconds before the next CRL is due
    ca_revoke               = A filename containing a certificate to revoke
    ca_valid                = A filename containing a certificate to add a Valid certificate entry
    ca_status               = Displays the revocation status
    ca_updatedb             = Updates the database index to purge expired certificates
    ca_crl_reason           = Revocation reason
    ca_crl_hold             = Set the CRL hold instruction (OID)
    ca_crl_compromise       = Set the compromise time (YYYYMMDDHHMMSSZ) to keyCompromise
    ca_crl_CA_compromise    = Set the compromise time (YYYYMMDDHHMMSSZ) to CACompromise
    ca_crlexts              = The section of the configuration file containing CRL extensions to include

    ciphers_s               = List only supported ciphers
    ciphers_psk             = When combined with -s includes cipher suites which require PSK
    ciphers_V               = Like -v, but show hex values additionaly
    ciphers_stdname         = Precede each cipher suite by its standard name
    ciphers_convert         = Convert a standard cipher name to its OpenSSL name
    ciphers_ciphersuites    = Sets the list of TLSv1.3 ciphersuites

    crl_gendelta            = Output a comparison of the main CRL and the one specified here
    crl_badsig              = Corrupt the signature before writing it; useful for testing
    crl_verify              = Verify the signature in the CRL
    crl_fingerprint         = Output the fingerprint of the CRL
    crl_crlnumber           = Output the number of the CRL
    crl_hash                = Output a hash of the issuer name
    crl_hash_old            = Output a hash of the issuer name using the older algorithm (OpenSSL < 1.0.0)
    crl_issuer              = Output the issuer name
    crl_lastupdate          = Output the lastUpdate field
    crl_nextupdate          = Output the nextUpdate field
    crl_nameopt             = how the subject or issuer names are displayed

    crl2pkcs7_certfile      = Filename containing one or more certificates in PEM format
    crl2pkcs7_nocrl         = no CRL is included in the output file and a CRL is not read

    dgst_list               = Prints out a list of supported message digests
    dgst_c                  = Print digest with separating colons
    dgst_hex                = Output as hex dump
    dgst_binary             = Output in binary form
    dgst_r                  = Print digest in coreutils format
    dgst_xoflen             = Set the output length for XOF algorithms, such as shake128 and shake256.
    dgst_sign               = Sign digest
    dgst_verify             = Verify the signature using the public key
    dgst_prverify           = Verify the signature using the private key
    dgst_signature          = The actual signature to verify
    dgst_hmac               = Create a hashed MAC using "key"
    dgst_mac                = Create MAC
    dgst_macopt             = Options to MAC algorithm
    dgst_fips_fingerprint   = Compute HMAC using a specific key for certain OpenSSL-FIPS operations
    dgst_engine_impl        = Use engine id for digest operations

    dhparam_dsaparam        = DSA rather than DH parameters are read or created
    dhparam_genvalue        = Generator value

    dsa_modulus             = Output value of the public key component of the key

    dsaparam_genkey         = Generate a DSA key

    ec_param_out            = Print the elliptic curve parameters
    ec_conv_form            = how the points on the elliptic curve are converted into octet strings
    ec_param_enc            = how the elliptic curve parameters are encoded
    ec_no_public            = omits the public key components from the private key output

    enc_list                = List all supported ciphers
    enc_encrypt             = Encrypt
    enc_decrypt             = Decrypt
    enc_base64              = Base64 encode/decode
    enc_base64_buffer       = Used with -a to specify base64 buffer
    enc_passphrase          = Passphrase is next argument
    enc_passphrase_file     = Read passphrase from file
    enc_md                  = Use the digest to create the key from the passphrase
    enc_iter                = Iteration count
    enc_pbkdf2              = Use PBKDF2 algorithm
    enc_no_salt             = Do not use salt
    enc_salt                = Use salt
    enc_use_actual_salt     = The actual salt to use
    enc_use_actual_key      = The actual key to use
    enc_use_actual_iv       = The actual IV to use
    enc_print_iv            = Print key and IV
    enc_print_key_iv        = Print key, IV and exit
    enc_bufsize             = Buffer size
    enc_no_pad              = Disable standard block padding
    enc_zlib                = Compress or decompress encrypted data using zlib
    enc_null_cipher         = Use NULL cipher

    genrsa_public_exponent  = The public exponent to use
    genrsa_primes           = Specify the number of primes to use while generating the RSA key

    genpkey_outpubkey       = Output the public key
    genpkey_algorithm       = Public key algorithm
    genpkey_pkeyopt         = Set public key algorithm option
    genpkey_genparam        = Generate a set of parameters instead of a private key
    genpkey_paramfile       = Generate a private key based on a set of parameters
    genpkey_text            = Print an (unencrypted) text representation

    req_cipher              = Cipher for encrypting the private key
    req_modulus             = Output value of modulus of the public key
    req_verify              = Verifies the self-signature on the request
    req_noenc               = Create a non-encrypted private key
    req_section             = Section name to be used (default = req)
    req_x509                = Output self-signed certificate
    req_x509v1              = Request generation of certificates with X.509 version 1
    req_set_serial          = Serial number to use when outputting a self-signed certificate
    req_copy_extensions     = how X.509 extensions in certificate requests should be handled
    req_addext              = Add a specific extension to the certificate or the request
    req_precert             = making it a "pre-certificate" (see RFC6962)
    req_reqopt              = Customise the printing format
    req_newhdr              = Adds the word NEW to the PEM file header and footer lines
    req_keygen_engine       = Specifies an engine
    req_nameopt             = how the subject or issuer names are displayed

    rsa_RSAPublicKey_in     = Like -pubin except RSAPublicKey format is used instead
    rsa_RSAPublicKey_out    = Like -pubout except RSAPublicKey format is used instead

    s_client_proxy          = With -connect, specify proxy host and port for HTTP
    s_client_proxy_user     = The proxy user
    s_client_proxy_pass     = The proxy password
    s_client_unix           = Connect over the specified Unix-domain socket
    s_client_quic           = Connect using the QUIC protocol
    s_client_noservername   = Suppresses sending of the SNI (Server Name Indication)
    s_client_verify_return_error = Like with -verify, but returns verification errors
    s_client_verify_quiet   = Limit verify output to only errors
    s_client_reconnect      = Reconnects to the same server 5 times using the same session ID
    s_client_nocommands     = Do not use interactive command letters
    s_client_adv            = Use advanced command mode

    s_server_port           = The TCP port to listen on for connections. (default: 4433)
    s_server_accept         = The optional TCP host and port to listen on for connections. (default: *:4433)
    s_server_verify         = Require client certificate (client does not have to send)
    s_server_verify_strict  = Require client certificate (client must send)
    s_server_unix           = Unix domain socket to accept on
    s_server_unlink         = For -unix, unlink any existing socket first
    s_server_context        = Sets the SSL context id
    s_server_www            = Respond to WWW style requests
    s_server_http           = Respond to WWW style requests, serve files

    verify_CRLfile          = The file or URI should contain one or more CRLs in PEM or DER format
    verify_show_chain       = Display information about the certificate chain
    verify_trusted          = A file or URI of (more or less) trusted certificates
    verify_untrusted        = A file or URI of untrusted certificates to use for chain building
    verify_nameopt          = how the subject or issuer names are displayed

    x509_x509toreq          = Output a PKCS#10 certificate request (rather than a certificate)
    x509_req                = PKCS#10 certificate request is expected instead of a certificate
    x509_copy_extensions    = how to handle X.509 extensions when converting
    x509_signkey            = alias of -key
    x509_nocert             = Do not output a certificate
    x509_fingerprint        = Print fingerprint
    x509_alias              = Print the certificate "alias" (nickname), if any
    x509_serial             = Print serial number
    x509_startdate          = Print the start date ('notBefore')
    x509_enddate            = Print the end date ('notAfter')
    x509_dates              = Print the start and expiry dates
    x509_issuer             = Print issuer
    x509_nameopt            = how the subject or issuer names are displayed
    x509_email              = Print the email address(es) if any
    x509_subject_hash       = Print the "hash" of the subject name
    x509_issuer_hash        = Print the "hash" of the issuer name
    x509_ext                = Print the extensions in text form
    x509_ocspid             = Print the OCSP hash values
    x509_ocsp_uri           = Print the OCSP responder address(es) if any
    x509_multi              = Print information about all input certificates
    x509_checkend           = Check the expires
    x509_checkhost          = Check the host
    x509_checkemail         = Check the email
    x509_checkip            = Check the IP address
    x509_set_serial         = Specifies the serial number to use
    x509_next_serial        = Set the serial to be one more than the number
    x509_preserve_dates     = When signing a certificate, preserve "notBefore" and "notAfter" dates
    x509_set_issuer         = Set issuer name for a new certificate
    x509_set_subject        = Set subject name for a new certificate
    x509_force_pubkey       = Set given public key forcely
    x509_clrext             = Prevent taking over ann extentions from the source
    x509_extfile            = Configuration file containing X.509 extension to add
    x509_extensions         = The section in the extfile to add X.509 extensions from
    x509_CAcreateserial     = Create CA serial number file if does not exist

    rand_base64             = Output as base64
    rand_hex                = Output as hex

    passwd_1                = Use MD5 algorithm
    passwd_apr1             = Use Apache MD5 algorithm
    passwd_aixmd5           = Use the AIX MD5 algorithm
    passwd_crypt            = Use crypt algorithm
    passwd_5                = Use SHA256 algorithm
    passwd_6                = Use SHA512 algorithm
    passwd_salt             = Use provided salt
    passwd_stdin            = Read password from stdin
    passwd_noverify         = Don't verify when reading a password from the terminal
    passwd_table            = In the output list, show "{cleartext}TAB{hash}"
    passwd_reverse          = When the -table option is used, reverse the order of {cleartext} and {hash}

    provider                = Load and initialize the provider identified by name
    providerPath            = Specifies the search path that is to be used for looking for providers
    provparam               = Set configuration parameter key to value val in provider name (optional)
    propquery               = Query for loaded provider's property

    aes128                  = Encrypt with AES-128
    aes192                  = Encrypt with AES-192
    aes256                  = Encrypt with AES-256
    aria128                 = Encrypt with ARIA-128
    aria192                 = Encrypt with ARIA-192
    aria256                 = Encrypt with ARIA-256
    camellia128             = Encrypt with Camellia-128
    camellia192             = Encrypt with Camellia-192
    camellia256             = Encrypt with Camellia-256
    des                     = Encrypt with DES
    des3                    = Encrypt with 3DES
    idea                    = Encrypt with IDEA

    rand                    = A file or files containing random data used to seed the random number generator
    writerand               = Writes the seed data to the specified file
    engine                  = Load the engine

    sigopt                  = Signature algorithm during sign operations
    vfyopt                  = Signature algorithm during verify operations

    not_before              = Set the start date
    not_after               = Set the end date

    utf8                    = interpreted as UTF8 strings
    traditional             = Use PKCS#1 format instead of the PKCS#8
    output_subject          = Output subject
    output_pubkey           = Output public key
    use_ipv4                = Use IPv4
    use_ipv6                = Use IPv6
    cert_chain              = A file or URI of untrusted certificates to use
    build_chain             = Should build the client certificate chain
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$formArgs = @(
    "PEM`t{0}" -f $msg.format_PEM
    "DER`t{0}" -f $msg.format_DER
)
$certformArgs = @(
    "PEM`t{0}" -f $msg.format_PEM
    "DER`t{0}" -f $msg.format_DER
    "P12`t{0}" -f $msg.format_P12
)
$keyformArgs = @(
    "PEM`t{0}" -f $msg.format_PEM
    "DER`t{0}" -f $msg.format_DER
    "P12`t{0}" -f $msg.format_P12
    "ENGINE`t{0}" -f $msg.format_ENGINE
)
$informParam = New-ParamCompleter -Name inform -Description $msg.inform -Arguments $formArgs -VariableName 'format'
$inform2Param = New-ParamCompleter -Name inform -Description $msg.inform -Arguments $keyformArgs-VariableName 'format'
$outformParam = New-ParamCompleter -Name outform -Description $msg.outform -Arguments $formArgs -VariableName 'format'
$keyformParam = New-ParamCompleter -Name keyform -Description $msg.keyform -Arguments $keyformArgs -VariableName 'format'
$certformParam = New-ParamCompleter -Name certform -Description $msg.certform -Arguments $certformArgs -VariableName 'format'
$caFormParam = New-ParamCompleter -Name CAform -Description $msg.caform -Arguments $certformArgs -VariableName 'format'
$caKeyFormParam = New-ParamCompleter -Name CAkeyform -Description $msg.cakeyform -Arguments $keyformArgs -VariableName 'format'
$certParam = New-ParamCompleter -Name cert -Description $msg.cert -Type File -VariableName 'file'
$checkParam = New-ParamCompleter -Name check -Description $msg.check

$sigoptParam = New-ParamCompleter -Name sigopt -Description $msg.sigopt -Type Required -VariableName 'nm:v'
$vfyoptParam = New-ParamCompleter -Name vfyopt -Description $msg.vfyopt -Type Required -VariableName 'nm:v'

$notBeforeParam = New-ParamCompleter -Name startdate, not_before -Description $msg.not_before -Type Required -VariableName 'date'
$notAfterParam = New-ParamCompleter -Name enddate, not_after -Description $msg.not_after -Type Required -VariableName 'date'

$verboseParam = New-ParamCompleter -Name verbose -Description $msg.verbose
$verbose2Param = New-ParamCompleter -Name v -Description $msg.verbose
$quietParam = New-ParamCompleter -Name quiet -Description $msg.quiet
$configParam = New-ParamCompleter -Name config -Description $msg.config -Type File -VariableName 'configfile'

$traditionalParam = New-ParamCompleter -Name traditional -Description $msg.traditional
$outSubjectParam = New-ParamCompleter -Name subject -Description $msg.output_subject
$outPubkeyParam = New-ParamCompleter -Name pubkey -Description $msg.output_pubkey
$CAfileParam = New-ParamCompleter -Name CAfile -Description $msg.CAfile -Type File -VariableName 'file'
$noCAfileParam = New-ParamCompleter -Name no-CAfile -Description $msg.no_CAfile
$CApathParam = New-ParamCompleter -Name CApath -Description $msg.CApath -Type Directory -VariableName 'dir'
$noCApathParam = New-ParamCompleter -Name no-CApath -Description $msg.no_CApath
$CAstoreParam = New-ParamCompleter -Name CAstore -Description $msg.CAstore -Type Required -VariableName 'uri'
$noCAstoreParam = New-ParamCompleter -Name no-CAstore -Description $msg.no_CAstore
$certChainParam = New-ParamCompleter -Name cert_chain -Description $msg.cert_chain -Type File -VariableName 'filename'
$buildChainParam = New-ParamCompleter -Name build_chain -Description $msg.build_chain
$dateoptParam = New-ParamCompleter -Name dateopt -Description $msg.dateopt -Arguments "rfc_822","iso_8601"
$certoptParam = New-ParamCompleter -Name certopt -Description $msg.certopt -Type List -Arguments @(
    "compatible", "no_header", "no_version", "no_serial", "no_signame", "no_validity", "no_subject",
    "no_issuer", "no_pubkey", "no_sigdump", "no_aux", "no_extensions", "ext_default", "ext_error",
    "ext_parse", "ext_dump", "ca_default"
)
$caParam = New-ParamCompleter -Name CA -Description $msg.ca -Type File -VariableName 'filename|uri'
$caKeyParam = New-ParamCompleter -Name CAkey -Description $msg.cakey -Type File -VariableName 'filename|uri'
$caserialParam = New-ParamCompleter -Name CAserial -Description $msg.caserial -Type File -VariableName 'filename'
$pubinParam = New-ParamCompleter -Name pubin -Description $msg.pubin
$puboutParam = New-ParamCompleter -Name pubout -Description $msg.pubout
$pvkStrongParam = New-ParamCompleter -Name pvk-strong -Description $msg.pvk_strong
$pvkWeakParam = New-ParamCompleter -Name pvk-weak -Description $msg.pvk_weak
$pvkNoneParam = New-ParamCompleter -Name pvk-none -Description $msg.pvk_none

$passphraseCompleter = {
    switch -Wildcard ($wordToComplete) {
        'pass:*' { $null }
        'env:*' {
            $w = '{0}*' -f $wordToComplete.Split(':', 2)[1]
            [System.Environment]::GetEnvironmentVariables().Keys |
                Where-Object { $_ -like $w } | ForEach-Object { "env:$_" }
        }
        'file:*' {
            $w = $wordToComplete.Split(':', 2)[1]
            [MT.Comp.Helper]::CompleteFilename($w, $this.CurrentDirectory, $true) |
                ForEach-Object { $_.SetPrefix('file:') }
        }
        'fd:*' { $null }
        'stdin' { $null }
        default: {
            @(
                "pass:`tThe actual password",
                "env:`tFrom Environment variable",
                "file:`tRead from specified file",
                "fd:`tThe file descriptor number",
                "stdin`tFrom standard input"
            ) | Where-Object { $_ -like "$wordToComplete*" }
        }
    }
}

$inParam = New-ParamCompleter -Name in -Description $msg.in -Type File -VariableName 'file'
$outParam = New-ParamCompleter -Name out -Description $msg.out -Type File -VariableName 'file'
$passParam = New-ParamCompleter -Name pass -Description $msg.passout -Type Required -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
$passinParam = New-ParamCompleter -Name passin -Description $msg.passin -Type Required -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
$passoutParam = New-ParamCompleter -Name passout -Description $msg.passout -Type Required -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
$textParam = New-ParamCompleter -Name text -Description $msg.text
$nooutParam = New-ParamCompleter -Name noout -Description $msg.noout

$randParam = New-ParamCompleter -Name rand -Description $msg.rand -Type File -VariableName 'files'
$writerandParam = New-ParamCompleter -Name writerand -Description $msg.writerand -Type File -VariableName 'file'
$engineParam = New-ParamCompleter -Name engine -Description $msg.engine -Type Required -VariableName 'id'

$batchParam = New-ParamCompleter -Name batch -Description $msg.batch
$utf8Param = New-ParamCompleter -Name utf8 -Description $msg.utf8

$providerParam = New-ParamCompleter -Name provider -Description $msg.provider -Type Required -VariableName 'name'
$providerPathParam = New-ParamCompleter -Name provider-path -Description $msg.providerParam -Type Directory -VariableName 'path'
$provparamParam = New-ParamCompleter -Name provparam -Description $msg.provparam -Type Required -VariableName '[name:]key=value'
$propqueryParam = New-ParamCompleter -Name propquery -Description $msg.propquery -Type Required -VariableName 'propq'

$keyParam = New-ParamCompleter -Name key -Description $msg.key -Type File -VariableName 'file'
$pkeyoptParam = New-ParamCompleter -Name pkeyopt -Description $msg.genpkey_pkeyopt -Type Required -VariableName 'opt:value' -ArgumentCompleter {
    $alg = $this.BoundParameters."algorithm"
    if (-not $alg) { return $null }
    ($k, $v) = $_.Split(':', 2)
    if (-not ([string]::IsNullOrEmpty($v))) {
    }

    switch -CaseSensitive ($alg) {
        'RSA' {
            "rsa_keygen_bits:`tKey bit",
            "rsa_keygen_primes:`tThe number of primes",
            "rsa_keygen_pubexp:`tThe RSA public exponent value"
        }
        'RSA-PSS' {
            "rsa_keygen_bits:`tKey bit",
            "rsa_pss_keygen_md:`tDigest for signing",
            "rsa_pss_keygen_mgf1_md:`tDigest for it's MGF1 parameter"
            "rsa_pss_keygen_saltlen:`tMinimum salt length"
        }
        'EC' {
            "ec_paramgen_curve:`tThe EC curve to use",
            "ec_param_enc:`tThe encoding to use for parameters"
        }
        'ML-DSA' {
            "hexseed:`tseed in hexadecimal form"
        }
        'ML-KEM' {
            "hexseed:`tseed in hexadecimal form"
        }
    }
}
$ciphers = (openssl enc -list).ForEach({$_ -split '\s+'}).Where({$_ -like '-*'}).Substring(1)
$cipherParams = $ciphers | ForEach-Object { New-ParamCompleter -Name $_ -Description 'Cipher' }
$digests = (openssl dgst -list).ForEach({$_ -split '\s+'}).Where({$_ -like '-*'}).Substring(1)
$digestParams = $digests | ForEach-Object { New-ParamCompleter -Name $_ -Description 'Digest' }

$encryptParams = @(
    New-ParamCompleter -Name aes128 -Description $msg.aes128
    New-ParamCompleter -Name aes192 -Description $msg.aes192
    New-ParamCompleter -Name aes256 -Description $msg.aes256
    New-ParamCompleter -Name aria128 -Description $msg.aria128
    New-ParamCompleter -Name aria192 -Description $msg.aria192
    New-ParamCompleter -Name aria256 -Description $msg.aria256
    New-ParamCompleter -Name camellia128 -Description $msg.camellia128
    New-ParamCompleter -Name camellia192 -Description $msg.camellia192
    New-ParamCompleter -Name camellia256 -Description $msg.camellia256
    New-ParamCompleter -Name des -Description $msg.des
    New-ParamCompleter -Name des3 -Description $msg.des3
    New-ParamCompleter -Name idea -Description $msg.idea
)

Register-NativeCompleter -Name openssl -Description $msg.openssl -Style Unix -SubCommands @(
    New-CommandCompleter -Name help -Description $msg.help -NoFileCompletions
    New-CommandCompleter -Name version -Description $msg.version -NoFileCompletions

    New-CommandCompleter -Name asn1parse -Description $msg._asn1parse -Style Unix -Parameters @(
        $informParam
        $inParam
        $outParam
        $nooutParam
        New-ParamCompleter -Name offset -Description $msg.asn1parse_offset -Type Required -VariableName 'number'
        New-ParamCompleter -Name length -Description $msg.asn1parse_length -Type Required -VariableName 'number'
        New-ParamCompleter -Name i -Description $msg.asn1parse_indent
        New-ParamCompleter -Name oid -Description $msg.asn1parse_oid -Type File -VariableName 'filename'
        New-ParamCompleter -Name dump -Description $msg.asn1parse_dump
        New-ParamCompleter -Name dlimit -Description $msg.asn1parse_dlimit -Type Required -VariableName 'num'
        New-ParamCompleter -Name strparse -Description $msg.asn1parse_strparse -Type Required -VariableName 'offset'
        New-ParamCompleter -Name genstr -Description $msg.asn1parse_genstr -Type Required -VariableName 'string'
        New-ParamCompleter -Name genconf -Description $msg.asn1parse_genconf -Type File -VariableName 'file'
        New-ParamCompleter -Name strictpem -Description $msg.asn1parse_strictpem
        New-ParamCompleter -Name item -Description $msg.asn1parse_item -Type Required -VariableName 'name'
    )

    New-CommandCompleter -Name ca -Description $msg._ca -Style Unix -Parameters @(
        $verboseParam
        $quietParam
        $configParam
        New-ParamCompleter -Name name, section -Description $msg.ca_section -Type Required -VariableName 'section'
        $inParam
        $informParam
        New-ParamCompleter -Name ss_cert -Description $msg.ca_ss_cert -Type File -VariableName 'filename'
        New-ParamCompleter -Name spkac -Description $msg.ca_spkac -Type File -VariableName 'filename'
        New-ParamCompleter -Name infiles -Description $msg.ca_infiles -Nargs '1+' -Type File -VariableName 'filename'
        $outParam
        New-ParamCompleter -Name outdir -Description $msg.ca_outdir -Type Directory -VariableName 'directory'
        $certParam
        $certformParam
        New-ParamCompleter -Name keyfile -Description $msg.ca_keyfile -Type File -VariableName 'file'
        $keyformParam
        $sigoptParam
        $vfyoptParam
        New-ParamCompleter -Name key -Description $msg.ca_key -Type Required -VariableName 'password'
        $passinParam
        New-ParamCompleter -Name selfsign -Description $msg.ca_selfsign
        New-ParamCompleter -Name notext -Description $msg.ca_notext
        $dateoptParam
        $notBeforeParam
        $notAfterParam
        New-ParamCompleter -Name days -Description $msg.ca_days -Type Required -VariableName 'N'
        New-ParamCompleter -Name md -Description $msg.ca_md -Type Required -VariableName 'alg'
        New-ParamCompleter -Name policy -Description $msg.ca_policy -Type Required -VariableName 'arg'
        New-ParamCompleter -Name preserveDN -Description $msg.ca_preserveDN
        New-ParamCompleter -Name noemailDN -Description $msg.ca_noemailDN
        $batchParam
        New-ParamCompleter -Name extensions -Description $msg.ca_extentions -Type Required -VariableName 'section'
        New-ParamCompleter -Name extfile -Description $msg.ca_extfile -Type File -VariableName 'file'
        New-ParamCompleter -Name subj -Description $msg.ca_subj -Type Required -VariableName 'arg'
        $utf8Param
        New-ParamCompleter -Name create_serial -Description $msg.ca_create_serial
        New-ParamCompleter -Name rand_serial -Description $msg.ca_rand_serial
        $randParam
        $writerandParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
        New-ParamCompleter -Name gencrl -Description $msg.ca_gencrl
        New-ParamCompleter -Name crl_lastupdate -Description $msg.ca_crl_lastupdate -Type Required -VariableName 'time'
        New-ParamCompleter -Name crl_nextupdate -Description $msg.ca_crl_nextupdate -Type Required -VariableName 'time'
        New-ParamCompleter -Name crldays -Description $msg.ca_crldays -Type Required -VariableName 'num'
        New-ParamCompleter -Name crlhours -Description $msg.ca_crlhours -Type Required -VariableName 'num'
        New-ParamCompleter -Name crlsec -Description $msg.ca_crlsec -Type Required -VariableName 'num'
        New-ParamCompleter -Name revoke -Description $msg.ca_revoke -Type File -VariableName 'filename'
        New-ParamCompleter -Name valid -Description $msg.ca_valid -Type File -VariableName 'filename'
        New-ParamCompleter -Name status -Description $msg.ca_status -Type Required -VariableName 'serial'
        New-ParamCompleter -Name updatedb -Description $msg.ca_updatedb
        New-ParamCompleter -Name crl_reason -Description $msg.ca_crl_reason -Type Required -VariableName 'reason'
        New-ParamCompleter -Name crl_hold -Description $msg.ca_crl_hold -Type Required -VariableName 'instruction'
        New-ParamCompleter -Name crl_compromise -Description $msg.ca_crl_compromise -Type Required -VariableName 'time'
        New-ParamCompleter -Name crl_CA_compromise -Description $msg.ca_crl_CA_compromise -Type Required -VariableName 'time'
        New-ParamCompleter -Name crlexts -Description $msg.ca_crlexts -Type Required -VariableName 'section'
    )

    New-CommandCompleter -Name ciphers -Description $msg._ciphers -Style Unix -Parameters @(
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
        New-ParamCompleter -Name s -Description $msg.ciphers_s
        New-ParamCompleter -Name psk -Description $msg.ciphers_psk
        $verbose2Param
        New-ParamCompleter -Name V -Description $msg.ciphers_V
        New-ParamCompleter -Name tls1 -Description $msg.tls1
        New-ParamCompleter -Name tls1_1 -Description $msg.tls1_1
        New-ParamCompleter -Name tls1_2 -Description $msg.tls1_2
        New-ParamCompleter -Name tls1_3 -Description $msg.tls1_3
        New-ParamCompleter -Name stdname -Description $msg.ciphers_stdname
        New-ParamCompleter -Name convert -Description $msg.ciphers_convert -Type Required -VariableName 'name'
        New-ParamCompleter -Name ciphersuites -Description $msg.ciphers_ciphersuites -Type Required -VariableName 'val'
    ) -NoFileCompletions

    New-CommandCompleter -Name crl -Description $msg._crl -Style Unix -Parameters @(
        $informParam
        $outformParam
        $keyParam
        $keyformParam
        $inParam
        $outParam
        New-ParamCompleter -Name gendelta -Description $msg.crl_gendelta -Type File -VariableName 'filename'
        New-ParamCompleter -Name badsig -Description $msg.crl_badsig
        $dateoptParam
        $textParam
        New-ParamCompleter -Name verify -Description $msg.crl_verify
        $nooutParam
        New-ParamCompleter -Name fingerprint -Description $msg.crl_fingerprint
        New-ParamCompleter -Name crlnumber -Description $msg.crl_crlnumber
        New-ParamCompleter -Name hash -Description $msg.crl_hash
        New-ParamCompleter -Name hash_old -Description $msg.crl_hash_old
        New-ParamCompleter -Name issuer -Description $msg.crl_issuer
        New-ParamCompleter -Name lastupdate -Description $msg.crl_lastupdate
        New-ParamCompleter -Name nextupdate -Description $msg.crl_nextupdate
        New-ParamCompleter -Name nameopt -Description $msg.crl_nameopt
        $CAfileParam
        $noCAfileParam
        $CApathParam
        $noCApathParam
        $CAstoreParam
        $noCAstoreParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name crl2pkcs7 -Description $msg._crl2pkcs7 -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        New-ParamCompleter -Name certfile -Description $msg.crl2pkcs7_certfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name nocrl -Description $msg.crl2pkcs7_nocrl
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name dgst -Description $msg._dgst -Style Unix -Parameters @(
        $digestParams
        New-ParamCompleter -Name list -Description $msg.dgst_list
        $inParam
        New-ParamCompleter -Name c -Description $msg.dgst_c
        New-ParamCompleter -Name hex -Description $msg.dgst_hex
        New-ParamCompleter -Name binary -Description $msg.dgst_binary
        New-ParamCompleter -Name r -Description $msg.dgst_r
        $outParam
        New-ParamCompleter -Name xoflen -Description $msg.dgst_xoflen -Type Required -VariableName 'length'
        New-ParamCompleter -Name sign -Description $msg.dgst_sign -Type File -VariableName 'filename|uri'
        $keyformParam
        $sigoptParam
        $passinParam
        New-ParamCompleter -Name verify -Description $msg.dgst_verify -Type File -VariableName 'filename'
        New-ParamCompleter -Name prverify -Description $msg.dgst_prverify -Type File -VariableName 'filename'
        New-ParamCompleter -Name signature -Description $msg.dgst_signature -Type File -VariableName 'filename'
        New-ParamCompleter -Name hmac -Description $msg.dgst_hmac -Type Required -VariableName 'key'
        New-ParamCompleter -Name mac -Description $msg.dgst_mac -Type Required -VariableName 'alg'
        New-ParamCompleter -Name macopt -Description $msg.dgst_macopt -Type Required -VariableName 'nm:y'
        New-ParamCompleter -Name fips-fingerprint -Description $msg.dgst_fips_fingerprint
        $randParam
        $writerandParam
        $engineParam
        New-ParamCompleter -Name engine_impl -Description $msg.dgst_engine_impl -Type Required -VariableName 'id'
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    )

    New-CommandCompleter -Name dhparam -Description $msg._dhparam -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        New-ParamCompleter -Name dsaparam -Description $msg.dhparam_dsaparam
        $checkParam
        New-ParamCompleter -Name 2, 3, 5 -Description $msg.dhparam_genvalue
        $nooutParam
        $textParam
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions -ArgumentCompleter {
        "512`tMinimum value",
        "2048`tDefault value",
        "10000`tMaximum value"
    }

    New-CommandCompleter -Name dsa -Description $msg._dsa -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        $passinParam
        $encryptParams
        $textParam
        $nooutParam
        New-ParamCompleter -Name modulus -Description $msg.dsa_modulus
        $pubinParam
        $puboutParam
        $pvkStrongParam
        $pvkWeakParam
        $pvkNoneParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name dsaparam -Description $msg._dsaparam -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        $nooutParam
        $textParam
        New-ParamCompleter -Name genkey -Description $msg.dsaparam_genkey
        $verboseParam
        $quietParam
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name ec -Description $msg._ec -Style Unix -Parameters @(
        $inform2Param
        $outformParam
        $inParam
        $outParam
        $passinParam
        New-ParamCompleter -Name des -Description $msg.des
        New-ParamCompleter -Name des3 -Description $msg.des3
        New-ParamCompleter -Name idea -Description $msg.idea
        $textParam
        $nooutParam
        New-ParamCompleter -Name param_out -Description $msg.ec_param_out
        $pubinParam
        $puboutParam
        New-ParamCompleter -Name conv_form -Description $msg.ec_conv_form -Arguments "compressed", "uncompressed", "hybrid" -VariableName 'arg'
        New-ParamCompleter -Name param_enc -Description $msg.ec_param_enc -Type Required -VariableName 'arg'
        New-ParamCompleter -Name no_public -Description $msg.ec_no_public
        $checkParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name enc -Description $msg._enc -Style Unix -Parameters @(
        $cipherParams
        New-ParamCompleter -Name list -Description $msg.enc_list
        $inParam
        $outParam
        $passinParam
        $passoutParam
        New-ParamCompleter -Name e -Description $msg.enc_encrypt
        New-ParamCompleter -Name d -Description $msg.enc_decrypt
        New-ParamCompleter -Name base64,a -Description $msg.enc_base64
        New-ParamCompleter -Name A -Description $msg.enc_base64_buffer
        New-ParamCompleter -Name k -Description $msg.enc_passphrase
        New-ParamCompleter -Name kfile -Description $msg.enc_passphrase_file -Type File -VariableName 'file'
        New-ParamCompleter -Name md -Description $msg.enc_md -Type Required -VariableName 'digest'
        New-ParamCompleter -Name iter -Description $msg.enc_iter -Type Required -VariableName 'count'
        New-ParamCompleter -Name pbkdf2 -Description $msg.enc_pbkdf2
        New-ParamCompleter -Name nosalt -Description $msg.enc_no_salt
        New-ParamCompleter -Name salt -Description $msg.enc_salt
        New-ParamCompleter -Name S -Description $msg.enc_use_actual_salt -Type Required -VariableName 'salt'
        New-ParamCompleter -Name K -Description $msg.enc_use_actual_key -Type Required -VariableName 'key'
        New-ParamCompleter -Name iv -Description $msg.enc_use_actual_iv -Type Required -VariableName 'IV'
        New-ParamCompleter -Name p -Description $msg.enc_print_iv
        New-ParamCompleter -Name P -Description $msg.enc_print_key_iv
        New-ParamCompleter -Name bufsize -Description $msg.bufsize -Type Required -VariableName 'size'
        New-ParamCompleter -Name nopad -Description $msg.enc_no_pad
        $verbose2Param
        New-ParamCompleter -Name z -Description $msg.enc_zlib
        New-ParamCompleter -Name none -Description $msg.enc_null_cipher
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
        $engineParam
    )

    New-CommandCompleter -Name genrsa -Description $msg._genrsa -Style Unix -Parameters @(
        $outParam
        $passoutParam
        $encryptParams
        New-ParamCompleter -Name F4,f4,3 -Description $msg.genrsa_public_exponent
        New-ParamCompleter -Name primes -Description $msg.genrsa_primes -Type Required -VariableName 'num'
        $verboseParam
        $quietParam
        $traditionalParam
        $randParam
        $writerandParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name genpkey -Description $msg._genpkey -Parameters @(
        $outParam
        New-ParamCompleter -Name outpubkey -Description $msg.genpkey_outpubkey -Type File -VariableName 'filename'
        $outformParam
        $verboseParam
        $quietParam
        $passParam
        $cipherParams
        New-ParamCompleter -Name algorithm -Description $msg.genpkey_algorithm -Type Required -VariableName 'alg' -Arguments @(
            "RSA", "DSA", "DH", "DHX", "EC", "X25519", "ED448"
        )
        $pkeyoptParam
        New-ParamCompleter -Name genparam -Description $msg.genpkey_genparam
        New-ParamCompleter -Name paramfile -Description $msg.genpkey_paramfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name text -Description $msg.genpkey_text
        $randParam
        $writerandParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
        $configParam
    )

    New-CommandCompleter -Name req -Description $msg._req -Style Unix -Parameters @(
        $informParam
        $outformParam
        New-ParamCompleter -Name cipher -Description $msg.req_cipher -Type Required -VariableName 'name'
        $inParam
        $sigoptParam
        $vfyoptParam
        $passinParam
        $passoutParam
        $outParam
        $textParam
        $outSubjectParam
        $outPubkeyParam
        $nooutParam
        New-ParamCompleter -Name modulus -Description $msg.req_modulus
        New-ParamCompleter -Name verify -Description $msg.req_verify
        New-ParamCompleter -Name new -Description $msg.new
        New-ParamCompleter -Name newkey -Description $msg.newkey -Type Required -VariableName 'arg'
        $pkeyoptParam
        $keyParam
        $keyformParam
        New-ParamCompleter -Name keyout -Description $msg.keyout -Type File -VariableName 'file'
        New-ParamCompleter -Name noenc -Description $msg.req_noenc
        New-ParamCompleter -Name nodes -Description $msg.nodes
        $digestParams
        $configParam
        New-ParamCompleter -Name section -Description $msg.req_section -Type Required -VariableName 'name'
        New-ParamCompleter -Name subj -Description $msg.subj -Type Required -VariableName 'arg'
        New-ParamCompleter -Name x509 -Description $msg.req_x509
        New-ParamCompleter -Name x509v1 -Description $msg.req_x509v1
        $caParam
        $caKeyParam
        $notBeforeParam
        New-ParamCompleter -Name not_before -Description $msg.not_before -Type Required -VariableName 'date'
        New-ParamCompleter -Name not_after -Description $msg.not_after -Type Required -VariableName 'date'
        New-ParamCompleter -Name days -Description $msg.days -Type Required -VariableName 'n'
        New-ParamCompleter -Name set_serial -Description $msg.req_set_serial -Type Required -VariableName 'n'
        New-ParamCompleter -Name copy_extensions -Description $msg.req_copy_extensions -Arguments "none","copy","copyall" -VariableName 'arg'
        New-ParamCompleter -Name extensions, reqexts -Description $msg.ca_extentions -Type Required -VariableName 'section'
        New-ParamCompleter -Name addext -Description $msg.req_addext -Type Required -VariableName 'ext'
        New-ParamCompleter -Name precert -Description $msg.req_precert
        $utf8Param
        New-ParamCompleter -Name reqopt -Description $msg.req_reqopt  -Type List -VariableName 'option'
        New-ParamCompleter -Name newhdr -Description $msg.req_newhdr
        $batchParam
        $verboseParam
        $quietParam
        New-ParamCompleter -Name keygen_engine -Description $msg.req_keygen_engine -Type Required -VariableName 'id'
        New-ParamCompleter -Name nameopt -Description $msg.req_nameopt -Type Required -VariableName 'option'
        $randParam
        $writerandParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    )

    New-CommandCompleter -Name rsa -Description $msg._rsa -Style Unix -Parameters @(
        New-ParamCompleter -Name inform -Description $msg.inform -Arguments @(
            "PEM`t{0}" -f $msg.format_PEM
            "DER`t{0}" -f $msg.format_DER
            "P12`t{0}" -f $msg.format_P12
            "ENGINE`t{0}" -f $msg.format_ENGINE
        ) -VariableName 'format'
        $outformParam
        $traditionalParam
        $inParam
        $passinParam
        $outParam
        $passoutParam
        $encryptParams
        $textParam
        $nooutParam
        New-ParamCompleter -Name modulus -Description $msg.modulus
        $checkParam
        $pubinParam
        $puboutParam
        New-ParamCompleter -Name RSAPublicKey_in -Description $msg.rsa_RSAPublicKey_in
        New-ParamCompleter -Name RSAPublicKey_out -Description $msg.rsa_RSAPublicKey_out
        $pvkStrongParam
        $pvkWeakParam
        $pvkNoneParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    )

    New-CommandCompleter -Name s_client -Description $msg._s_client -Style Unix -Parameters @(
        New-ParamCompleter -Name connect -Description $msg.connect -Type Required -VariableName 'host:port'
        New-ParamCompleter -Name proxy -Description $msg.s_client_proxy -Type Required -VariableName 'host:port'
        New-ParamCompleter -Name proxy_user -Description $msg.s_client_proxy_user -Type Required -VariableName 'userid'
        New-ParamCompleter -Name proxy_pass -Description $msg.s_client_proxy_pass -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
        New-ParamCompleter -Name unix -Description $msg.s_client_unix -Type File -VariableName 'path'
        New-ParamCompleter -Name '4' -Description $msg.use_ipv4
        New-ParamCompleter -Name '6' -Description $msg.use_ipv6
        New-ParamCompleter -Name quic -Description $msg.s_client_quic
        New-ParamCompleter -Name servername -Description $msg.servername -Type Required -VariableName 'name'
        New-ParamCompleter -Name noservername -Description $msg.s_client_noservername
        $certParam
        $certformParam
        $certChainParam
        $buildChainParam
        New-ParamCompleter -Name CRL -Description $msg.CRL -Type File -VariableName 'filename'
        New-ParamCompleter -Name CRLform -Description $msg.CRLform -Arguments $formArgs -VariableName 'form'
        New-ParamCompleter -Name crl_download -Description $msg.crl_download
        $keyParam
        $keyformParam
        $passParam
        New-ParamCompleter -Name verify -Description $msg.verify -Type Required -VariableName 'depth'
        New-ParamCompleter -Name verify_return_error -Description $msg.s_client_verify_return_error
        New-ParamCompleter -Name verify_quiet -Description $msg.s_client_verify_quiet
        New-ParamCompleter -Name verifyCAfile -Description $msg.verifyCAfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name verifyCApath -Description $msg.verifyCApath -Type Directory -VariableName 'dir'
        New-ParamCompleter -Name verifyCAstore -Description $msg.verifyCAstore -Type Required -VariableName 'uri'
        New-ParamCompleter -Name chainCAfile -Description $msg.chainCAfile -Type File -VariableName 'file'
        New-ParamCompleter -Name chainCApath -Description $msg.chainCApath -Type Directory -VariableName 'directory'
        New-ParamCompleter -Name chainCAstore -Description $msg.chainCAstore -Type Required -VariableName 'uri'
        New-ParamCompleter -Name requestCAfile -Description $msg.requestCAfile -Type File -VariableName 'file'

        New-ParamCompleter -Name reconnect -Description $msg.s_client_reconnect
        New-ParamCompleter -Name showcerts -Description $msg.showcerts
        New-ParamCompleter -Name prexit -Description $msg.prexit
        New-ParamCompleter -Name no-interactive -Description $msg.no_interactive
        New-ParamCompleter -Name state -Description $msg.state
        New-ParamCompleter -Name debug -Description $msg.debug
        New-ParamCompleter -Name nocommands -Description $msg.s_client_nocommands
        New-ParamCompleter -Name adv -Description $msg.s_client_adv

        $CAfileParam
        $CApathParam
        New-ParamCompleter -Name cipher -Description $msg.cipher -Type Required -VariableName 'cipherlist'
        New-ParamCompleter -Name starttls -Description $msg.starttls -Arguments @(
            "smtp`t{0}" -f $msg.starttls_smtp
            "pop3`t{0}" -f $msg.starttls_pop3
            "imap`t{0}" -f $msg.starttls_imap
            "ftp`t{0}" -f $msg.starttls_ftp
            "xmpp`t{0}" -f $msg.starttls_xmpp
        ) -VariableName 'protocol'
        New-ParamCompleter -Name quiet -Description $msg.quiet
        New-ParamCompleter -Name brief -Description $msg.brief
        New-ParamCompleter -Name msg -Description $msg.msg
        New-ParamCompleter -Name nbio -Description $msg.nbio
        New-ParamCompleter -Name crlf -Description $msg.crlf
        New-ParamCompleter -Name ign_eof -Description $msg.ign_eof
        New-ParamCompleter -Name no_ign_eof -Description $msg.no_ign_eof
        New-ParamCompleter -Name tls1 -Description $msg.tls1
        New-ParamCompleter -Name tls1_1 -Description $msg.tls1_1
        New-ParamCompleter -Name tls1_2 -Description $msg.tls1_2
        New-ParamCompleter -Name tls1_3 -Description $msg.tls1_3
        New-ParamCompleter -Name no_ssl3 -Description $msg.no_ssl3
        New-ParamCompleter -Name no_tls1 -Description $msg.no_tls1
        New-ParamCompleter -Name no_tls1_1 -Description $msg.no_tls1_1
        New-ParamCompleter -Name no_tls1_2 -Description $msg.no_tls1_2
        New-ParamCompleter -Name no_tls1_3 -Description $msg.no_tls1_3
        New-ParamCompleter -Name bugs -Description $msg.bugs
    ) -NoFileCompletions

    New-CommandCompleter -Name s_server -Description $msg._s_server -Style Unix -Parameters @(
        New-ParamCompleter -Name port -Description $msg.s_server_port
        New-ParamCompleter -Name accept -Description $msg.s_server_accept -Type Required -VariableName 'val'
        New-ParamCompleter -Name unix -Description $msg.server_unix -Type Required -VariableName 'val'
        New-ParamCompleter -Name '4' -Description $msg.use_ipv4
        New-ParamCompleter -Name '6' -Description $msg.use_ipv6
        New-ParamCompleter -Name unlink -Description $msg.s_server_unlink
        New-ParamCompleter -Name context -Description $msg.s_server_context -Type Required -VariableName 'val'
        New-ParamCompleter -Name verify -Description $msg.s_server_verify -Type Required -VariableName 'depth'
        New-ParamCompleter -Name Verify -Description $msg.s_server_verify_strict -Type Required -VariableName 'depth'
        $certParam
        New-ParamCompleter -Name cert2 -Description $msg.cert -Type File -VariableName 'file'
        $certformParam
        $certChainParam
        $buildChainParam
        New-ParamCompleter -Name serverinfo -Description $msg.s_server_serverinfo -Typ Required -VariableName 'val'
        $keyParam
        New-ParamCompleter -Name key2 -Description $msg.key -Type File -VariableName 'file'
        $keyformParam
        $passParam
        New-ParamCompleter -Name crlf -Description $msg.crlf
        New-ParamCompleter -Name debug -Description $msg.debug
        New-ParamCompleter -Name msg -Description $msg.msg
        New-ParamCompleter -Name msgfile -Description $msg.msgfile
        New-ParamCompleter -Name state -Description $msg.state
        New-ParamCompleter -Name CRL -Description $msg.CRL -Type File -VariableName 'filename'
        New-ParamCompleter -Name CRLform -Description $msg.CRLform -Arguments $formArgs -VariableName 'form'
        New-ParamCompleter -Name crl_download -Description $msg.crl_download
        New-ParamCompleter -Name verifyCAfile -Description $msg.verifyCAfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name verifyCApath -Description $msg.verifyCApath -Type Directory -VariableName 'dir'
        New-ParamCompleter -Name verifyCAstore -Description $msg.verifyCAstore -Type Required -VariableName 'uri'
        New-ParamCompleter -Name chainCAfile -Description $msg.chainCAfile -Type File -VariableName 'file'
        New-ParamCompleter -Name chainCApath -Description $msg.chainCApath -Type Directory -VariableName 'directory'
        New-ParamCompleter -Name chainCAstore -Description $msg.chainCAstore -Type Required -VariableName 'uri'
        New-ParamCompleter -Name requestCAfile -Description $msg.requestCAfile -Type File -VariableName 'file'
        New-ParamCompleter -Name quiet -Description $msg.quiet
        New-ParamCompleter -Name www -Description $msg.s_server_www
        New-ParamCompleter -Name WWW, HTTP -Description $msg.s_server_http
        New-ParamCompleter -Name servername -Description $msg.servername -Type Required -VariableName 'name'
        $CAfileParam
        $CApathParam
        New-ParamCompleter -Name cipher -Description $msg.cipher -Type Required -VariableName 'cipherlist'
        New-ParamCompleter -Name nbio -Description $msg.nbio
    )

    New-CommandCompleter -Name verify -Description $msg._verify -Style Unix -Parameters @(
        New-ParamCompleter -Name CRLfile -Description $msg.verify_CRLfile -Type File -VariableName 'filename|uri'
        New-ParamCompleter -Name crl_download -Description $msg.crl_download
        New-ParamCompleter -Name show_chain
        $verboseParam
        New-ParamCompleter -Name trusted -Description $msg.verify_trusted -Type File -VariableName 'filename|uri'
        New-ParamCompleter -Name untrusted -Description $msg.verify_untrusted -Type File -VariableName 'filename|uri'
        $vfyoptParam
        New-ParamCompleter -Name nameopt -Description $msg.verify_nameopt -Type Required -VariableName 'option'
        $CAfileParam
        $CApathParam
    )

    New-CommandCompleter -Name x509 -Description $msg._x509 -Style Unix -Parameters @(
        $inParam
        $passinParam
        New-ParamCompleter -Name new -Description $msg.new
        New-ParamCompleter -Name x509toreq -Description $msg.x509_x509toreq
        New-ParamCompleter -Name req -Description $msg.x509_req
        New-ParamCompleter -Name copy_extensions -Description $msg.x509_copy_extensions -Arguments 'none','copy','copyall'
        $informParam
        $vfyoptParam
        $keyParam
        New-ParamCompleter -Name signkey -Description $msg.x509_signkey -Type File -VariableName 'filename|uri'
        $keyformParam
        $outParam
        $outformParam
        New-ParamCompleter -Name nocert -Description $msg.x509_nocert
        $nooutParam

        $dateoptParam
        $textParam
        $certoptParam
        New-ParamCompleter -Name fingerprint -Description $msg.x509_fingerprint
        New-ParamCompleter -Name alias -Description $msg.x509_alias
        New-ParamCompleter -Name serial -Description $msg.x509_serial
        New-ParamCompleter -Name startdate -Description $msg.x509_startdate
        New-ParamCompleter -Name enddate -Description $msg.x509_enddate
        New-ParamCompleter -Name dates -Description $msg.x509_dates
        $outSubjectParam
        New-ParamCompleter -Name issuer -Description $msg.x509_issuer
        New-ParamCompleter -Name nameopt -Description $msg.x509_nameopt -Type Required -VariableName 'option'
        New-ParamCompleter -Name email -Description $msg.x509_email
        New-ParamCompleter -Name hash, subject_hash -Description $msg.x509_subject_hash
        New-ParamCompleter -Name issuer_hash -Description $msg.x509_issuer_hash
        New-ParamCompleter -Name ext -Description $msg.x509_ext -Type List -Arguments @(
            "basicConstraints", "keyUsage", "extendedKeyUsage", "subjectKeyIdentifier", "authorityKeyIdentifier",
            "subjectAltName", "issuerAltName", "authorityInfoAccess", "crlDistributionPoints", "issuingDistributionPoint",
            "certificatePolicies", "policyConstraints", "nameConstraints", "noCheck", "tlsfeature"
        )
        New-ParamCompleter -Name ocspid -Description $msg.x509_ocspid
        New-ParamCompleter -Name ocsp_uri -Description $msg.x509_ocsp_uri
        $outPubkeyParam
        New-ParamCompleter -Name modulus -Description $msg.modulus
        New-ParamCompleter -Name multi -Description $msg.x509_multi

        New-ParamCompleter -Name checkend -Description $msg.x509_checkend -Type Required -VariableName 'sec'
        New-ParamCompleter -Name checkhost -Description $msg.x509_checkhost -Type Required -VariableName 'host'
        New-ParamCompleter -Name checkemail -Description $msg.x509_checkemail -Type Required -VariableName 'email'
        New-ParamCompleter -Name checkip -Description $msg.x509_checkip -Type Required -VariableName 'ipaddr'

        New-ParamCompleter -Name set_serial -Description $msg.x509_set_serial -Type Required -VariableName 'n'
        New-ParamCompleter -Name next_serial -Description $msg.x509_next_serial
        New-ParamCompleter -Name not_before -Description $msg.not_before -Type Required -VariableName 'date'
        New-ParamCompleter -Name not_after -Description $msg.not_after -Type Required -VariableName 'date'
        New-ParamCompleter -Name days -Description $msg.days -Type Required -VariableName 'n'
        New-ParamCompleter -Name preserve_dates -Description $msg.x509_preserve_dates

        New-ParamCompleter -Name set_issuer -Description $msg.x509_set_issuer -Type Required -VariableName 'arg'
        New-ParamCompleter -Name set_subject, subj -Description $msg.x509_set_subject -Type Required -VariableName 'arg'
        New-ParamCompleter -Name force_pubkey -Description $msg.x509_force_pubkey -Type File -VariableName 'filename'
        New-ParamCompleter -Name clrext -Description $msg.x509_clrext
        New-ParamCompleter -Name extfile -Description $msg.x509_extfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name extensions -Description $msg.x509_extensions -Type Required -VariableName 'section'
        $sigoptParam
        New-ParamCompleter -Name badsig -Description $msg.crl_badsig
        $digestParams

        $caParam
        $caFormParam
        $caKeyParam
        $caKeyFormParam
        $caserialParam
        New-ParamCompleter -Name CAcreateserial -Description $msg.x509_CAcreateserial

        $randParam
        $writerandParam
        $engineParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    )

    New-CommandCompleter -Name speed -Description $msg._speed -Style Unix -Parameters @(
        $configParam
        New-ParamCompleter -Name elapsed -Description 'Measure time in real time'
        New-ParamCompleter -Name evp -Description 'Use EVP cipher' -Type Required -VariableName 'alg'
        New-ParamCompleter -Name multi -Description 'Run multiple operations in parallel' -Type Required -VariableName 'num'
        New-ParamCompleter -Name async_jobs -Description 'Enable async mode and start specified number of jobs'  -Type Required -VariableName 'num'
        New-ParamCompleter -Name misalign   -Description 'Misalign the buffers by the specified number of bytes' -Type Required -VariableName 'num'
        New-ParamCompleter -Name hmac -Description 'Time the HMAC algorithm using the specified message digest' -Arguments $digests -VariableName 'digest'
        New-ParamCompleter -Name cmac -Description 'Time the CMAC algorithm using the specified cipher' -Arguments $ciphers -VariableName 'cipher'
        New-ParamCompleter -Name decrypt -Description 'Time the decryption instead of encryption. Affects only the EVP testing'
        New-ParamCompleter -Name mb -Description 'Enable multi-block mode on EVP-named cipher'
        New-ParamCompleter -Name aead -Description 'Benchmark EVP-named AEAD cipher in TLS-like sequence'
        New-ParamCompleter -Name kem-algorithms -Description 'Benchmark KEM algorithms: key generation, encapsulation, decapsulation'
        New-ParamCompleter -Name signature-algorithms -Description 'Benchmark signature algorithms: key generation, signature, verification'
        New-ParamCompleter -Name primes -Description 'Generate a num-prime RSA key and use it to run the benchmarks' -Type Required -VariableName 'num'
        New-ParamCompleter -Name seconds -Description 'Run benchmarks for num seconds' -Type Required -VariableName 'num'
        New-ParamCompleter -Name bytes -Description 'Run benchmarks on num-byte buffers' -Type Required -VariableName 'num'
        New-ParamCompleter -Name mr -Description 'Produce the summary in a mechanical, machine-readable, format'
        New-ParamCompleter -Name mlock -Description 'Lock memory into RAM for more deterministic measurements'
        New-ParamCompleter -Name testmode -Description 'Runs only 1 iteration of each algorithm test'
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions -ArgumentCompleter {
        $list = 'md5', 'sha1', 'rmd160', 'sha256', 'sha512', 'hmac', 'des-ede3',
                'aes-128-cbc', 'aes-192-cbc', 'aes-256-cbc',
                'camellia-128-cbc', 'camellia-192-cbc', 'camellia-256-cbc',
                'ghash', 'rand', 'kmac128', 'kmac256'
        $list.Where({ $_ -like "$wordToComplete*" })
    }

    New-CommandCompleter -Name rand -Description $msg._rand -Style Unix -Parameters @(
        $outParam
        New-ParamCompleter -Name base64 -Description $msg.rand_base64
        New-ParamCompleter -Name hex -Description $msg.rand_hex
        $engineParam
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions

    New-CommandCompleter -Name passwd -Description $msg._passwd -Style Unix -Parameters @(
        New-ParamCompleter -Name 1 -Description $msg.passwd_1
        New-ParamCompleter -Name apr1 -Description $msg.passwd_apr1
        New-ParamCompleter -Name aixmd5 -Description $msg.passwd_aixmd5
        New-ParamCompleter -Name 5 -Description $msg.passwd_5
        New-ParamCompleter -Name 6 -Description $msg.passwd_6
        New-ParamCompleter -Name salt -Description $msg.passwd_salt -Type Required -VariableName 'string'
        $inParam
        New-ParamCompleter -Name stdin -Description $msg.passwd_stdin
        New-ParamCompleter -Name noverify -Description $msg.passwd_noverify
        New-ParamCompleter -Name quiet -Description $msg.quiet
        New-ParamCompleter -Name table -Description $msg.passwd_table
        New-ParamCompleter -Name reverse -Description $msg.passwd_reverse
        $randParam
        $writerandParam
        $providerParam
        $providerPathParam
        $provparamParam
        $propqueryParam
    ) -NoFileCompletions
) -NoFileCompletions
