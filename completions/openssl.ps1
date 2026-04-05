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
    ssl3                    = Use SSLv3
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

    ecparam_check_named     = Check if the curve parameters match any built-in curves
    ecparam_name            = Use the EC parameters with the specified 'short' name
    ecparam_list_curves     = Print out a list of all implemented EC parameters names
    ecparam_no_seed         = Do not include the 'seed' for parameter generation in the structure
    ecparam_genkey          = Generate an EC private key

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

    info_configdir          = Outputs the default directory for OpenSSL configuration files
    info_enginesdir         = Outputs the default directory for OpenSSL engine modules
    info_modulesdir         = Outputs the default directory for OpenSSL dynamically loadable modules other than engine modules
    info_dsoext             = Outputs the DSO extension OpenSSL uses
    info_dirnamesep         = Outputs the separator character between a directory specification and a filename
    info_listsep            = Outputs the OpenSSL list separator character
    info_seeds              = Outputs the randomness seed sources
    info_cpusettings        = Outputs the OpenSSL CPU settings info
    info_windowscontext     = Outputs the Windows install context

    kdf_keylen              = The output size of the derived key
    kdf_binary              = Output the derived key in binary form
    kdf_cipher              = Specify the cipher
    kdf_digest              = Specify the digest
    kdf_mac                 = Specify the MAC
    kdf_kdfopt              = Passes options to the KDF algorithm

    list_select             = Only list algorithms that match this name
    list_singlecolumn       = List in a single column
    list_all_algorithms     = Display lists of all algorithms
    list_commands           = Display a list of standard commands
    list_standard_commands  = List of standard commands
    list_digest_commands    = Display a list of message digest commands
    list_cipher_commands    = Display a list of cipher commands
    list_cipher_algorithms  = Display a list of symmetric cipher algorithms
    list_digest_algorithms  = Display a list of digest algorithms
    list_kdf_algorithms     = Display a list of kdf algorithms
    list_mac_algorithms     = Display a list of mac algorithms
    list_random_instances   = List the primary, public and private random number generator details
    list_random_generators  = Display a list of random number generators
    list_encoders           = Display a list of encoders
    list_decoders           = Display a list of decoders
    list_public_key_algorithms = Display a list of public key algorithms
    list_public_key_methods = Display a list of public key methods
    list_key_managers       = Display a list of key managers
    list_skey_managers      = Display a list of symmetric key managers
    list_key_exchange_algorithms = Display a list of key exchange algorithms
    list_kem_algorithms     = Display a list of key encapsulation algorithms
    list_tls_groups         = Display a list of the IANA names of all available TLS groups
    list_all_tls_groups     = Display a list of the names of all available TLS groups, including any aliases
    list_tls1_2             = List those compatible with TLS 1.2
    list_tls1_3             = List those compatible with TLS 1.3
    list_signature_algorithms = Display a list of signature algorithms
    list_tls_signature_algorithms = Display the list of signature algorithms available for TLS handshakes
    list_asymcipher_algorithms = Display a list of asymmetric cipher algorithms
    list_store_loaders      = Display a list of store loaders
    list_providers          = Display a list of all loaded providers with their names, version and status
    list_engines            = Display a list of loaded engines
    list_disabled           = Display a list of disabled features
    list_objects            = Display a list of built in objects, i.e. OIDs with names
    list_options            = Output a two-column list of the options accepted by the specified command

    mac_binary              = Output the MAC in binary form
    mac_cipher              = Used by CMAC and GMAC to specify the cipher algorithm
    mac_digest              = Used by HMAC as an alphanumeric string

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

    s_time_www              = Specify the page to GET from the server
    s_time_new              = Use a new session ID for each connection
    s_time_reuse            = Use the same session ID
    s_time_bugs             = Enable various workarounds for SSL/TLS bugs
    s_time_time             = Connection time to the server (seconds)

    sess_id_cert            = Output a certificate if present in the session
    sess_id_context         = Output session information uses the supplied ID

    smime_encrypt           = Encrypt mail for the given recipient certificates
    smime_decrypt           = Decrypt mail using the supplied certificate and private key
    smime_sign              = Sign mail using the supplied certificate and private key
    smime_resign            = Resign a message
    smime_verify            = Verify signed mail
    smime_pk7out            = Write out a PEM encoded PKCS#7 structure
    smime_indef             = Enable streaming I/O for encoding operations
    smime_noindef           = Disable streaming I/O
    smime_content           = File containing the detached content, only useful with the -verify
    smime_text              = Adds 'text/plain' MIME headers to the supplied message if encrypting or signing
    smime_md                = Digest algorithm to use when signing or resigning
    smime_nointern          = Use only the certificates specified in the -certfile
    smime_noverify          = Do not verify the signers certificate of a signed message
    smime_nochain           = Do not do chain verification of signers certificates
    smime_nosigs            = Don't try to verify the signatures on the message
    smime_nocerts           = Do not include the signer's certificate when signing
    smime_noattr            = Do not include a set of attributes when signing
    smime_nodetach          = Use opaque signing when signing
    smime_nosmimecap        = Do not include the SMIMECapabilities attribute when signing
    smime_binary            = Do not convert to "canonical" format
    smime_crlfeol           = Use CRLF as end of line instead of LF
    smime_certfile          = Allows additional certificates to be specified
    smime_signer            = A signing certificate when signing or resigning a message
    smime_recip             = The recipients certificate when decrypting a message
    smime_inkey             = The private key to use when signing or decrypting
    smime_to                = Add mail header 'To'
    smime_from              = Add mail header 'From'
    smime_subject           = Add mail header 'Subject'

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

    pkcs7_print             = Print out the full PKCS7 object
    pkcs7_print_certs       = Prints out any certificates or CRLs

    pkcs8_topk8             = Write a private key as PKCS#8 format
    pkcs8_traditional       = Write a private key as traditional format
    pkcs8_iter              = Iteration count in deriving the encryption key
    pkcs8_noiter            = use 1 as iteration count
    pkcs8_nocrypt           = Generate an unencrypted PrivateKeyInfo structure
    pkcs8_v2                = Set the PKCS#5 v2.0 algorithm
    pkcs8_v2prf             = Set the PRF algorithm to use with PKCS#5 v2.0
    pkcs8_v1                = Use PKCS#5 v1.5 or PKCS#12 algorithm
    pkcs8_scrypt            = Use the scrypt algorithm for private key encryption
    pkcs8_scrypt_N          = Modify scrypt parameter 'N'
    pkcs8_scrypt_r          = Modify scrypt parameter 'r'
    pkcs8_scrypt_p          = Modify scrypt parameter 'p'
    pkcs8_saltlen           = Set the salt length for the PBE algorithm

    pkcs12_password         = With -export, same as -passout, otherwise -passin
    pkcs12_twopass          = Prompt for separate integrity and encryption passwords
    pkcs12_nokeys           = No private keys will be output
    pkcs12_nocerts          = No certificates will be output
    pkcs12_legacy           = Use legacy mode of operation and automatically load the legacy provider

    pkey_pubcheck           = Check the correctness of either a public key or the public component of a key pair
    pkey_text_pub           = Output in text form only the public key components (also for private keys)

    pkeyutl_rawin           = Indicate that the signature or verification input data is raw data
    pkeyutl_digest          = Specify the digest algorithm used before signing or verifying
    pkeyutl_secret          = Specify the shared-secret output filename
    pkeyutl_sigfile         = Signature file, required and allowed for -verify operations only
    pkeyutl_inkey           = The input key, by default it should be a private key
    pkeyutl_certin          = The input is a certificate containing a public key
    pkeyutl_rev             = Reverse the order of the input buffer
    pkeyutl_sign            = Sign the input data and output the signed result
    pkeyutl_verify          = Verify the input data against the signature given with the -sigfile option
    pkeyutl_verifyrecover   = Verify the given signature and output the recovered data
    pkeyutl_encrypt         = Encrypt the input data using a public key
    pkeyutl_decrypt         = Decrypt the input data using a private key
    pkeyutl_derive          = Derive a shared secret using own private (EC)DH key and peer key
    pkeyutl_peerkey         = File containing the peer public or private (EC)DH key to use with the key derivation
    pkeyutl_peerform        = The peer key format
    pkeyutl_encap           = Use a Key Encapsulation Mechanism (KEM) to encapsulate a shared-secret to a peer's public key
    pkeyutl_decap           = Decode an encapsulated secret, with the use of a -private key
    pkeyutl_kemop           = Used with the -encap/-decap commands and specifies the KEM mode
    pkeyutl_kdf             = Use key derivation function algorithm
    pkeyutl_kdflen          = Set the output length for KDF
    pkeyutl_hexdump         = hex dump the output data
    pkeyutl_asn1parse       = Parse the ASN.1 output data to check its DER encoding and print any errors

    prime_hex               = Enable hex format for output or input to primality checking
    prime_generate          = Generate a prime number
    prime_bits              = Generate a prime with num bits
    prime_safe              = Generate a "safe" prime

    rehash_old              = Use old-style hashing (MD5, as opposed to SHA-1) for generating links
    rehash_n                = Do not remove existing links
    rehash_compat           = Generate links for both old-style (MD5) and new-style (SHA1) hashing
    rehash_v                = Print messages about old links removed and new links created

    speed_elapsed           = Measure time in real time
    speed_evp               = Use EVP cipher
    speed_multi             = Run multiple operations in parallel
    speed_async_jobs        = Enable async mode and start specified number of jobs
    speed_misalign          = Misalign the buffers by the specified number of bytes
    speed_hmac              = Time the HMAC algorithm using the specified message digest
    speed_cmac              = Time the CMAC algorithm using the specified cipher
    speed_decrypt           = Time the decryption instead of encryption. Affects only the EVP testing
    speed_mb                = Enable multi-block mode on EVP-named cipher
    speed_aead              = Benchmark EVP-named AEAD cipher in TLS-like sequence
    speed_kem_algorithms    = Benchmark KEM algorithms: key generation, encapsulation, decapsulation
    speed_signature_algorithms = Benchmark signature algorithms: key generation, signature, verification
    speed_primes            = Generate a num-prime RSA key and use it to run the benchmarks
    speed_seconds           = Run benchmarks for num seconds
    speed_bytes             = Run benchmarks on num-byte buffers
    speed_mr                = Produce the summary in a mechanical, machine-readable, format
    speed_mlock             = Lock memory into RAM for more deterministic measurements
    speed_testmode          = Runs only 1 iteration of each algorithm test

    storeutl_r              = Fetch objects recursively when possible
    storeutl_certs          = Only select the certificates
    storeutl_keys           = Only select the keys
    storeutl_crls           = Only select the CRLs
    storeutl_subject        = Search for an object having the subject name
    storeutl_issuer         = Search for an object having the issuer name
    storeutl_serial         = Search for an object having the serial number
    storeutl_alias          = Search for an object having the given alias
    storeutl_fingerprint    = Search for an object having the given fingerprint
    storeutl_digest         = The digest that was used to compute the fingerprint given with -fingerprint

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
$smimeformArgs = @( $formArgs; "SMIME`t{0}" -f $msg.format_SMIME )
$smimekeyformArgs = @( $certformArgs; "SMIME`t{0}" -f $msg.format_SMIME )
$informParam = New-ParamCompleter -Name inform -Description $msg.inform -Arguments $formArgs -VariableName 'format'
$inform2Param = New-ParamCompleter -Name inform -Description $msg.inform -Arguments $keyformArgs -VariableName 'format'
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

$batchParam = New-ParamCompleter -Name batch -Description $msg.batch
$utf8Param = New-ParamCompleter -Name utf8 -Description $msg.utf8

$providerParam = New-ParamCompleter -Name provider -Description $msg.provider -Type Required -VariableName 'name'
$providerPathParam = New-ParamCompleter -Name provider-path -Description $msg.providerPath -Type Directory -VariableName 'path'
$provparamParam = New-ParamCompleter -Name provparam -Description $msg.provparam -Type Required -VariableName '[name:]key=value'
$propqueryParam = New-ParamCompleter -Name propquery -Description $msg.propquery -Type Required -VariableName 'propq'
$providerParams = $providerParam, $providerPathParam, $provparamParam, $propqueryParam

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
        $providerParams
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
        $providerParams
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
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name crl2pkcs7 -Description $msg._crl2pkcs7 -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        New-ParamCompleter -Name certfile -Description $msg.crl2pkcs7_certfile -Type File -VariableName 'filename'
        New-ParamCompleter -Name nocrl -Description $msg.crl2pkcs7_nocrl
        $providerParams
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
        New-ParamCompleter -Name engine_impl -Description $msg.dgst_engine_impl -Type Required -VariableName 'id'
        $providerParams
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
        $providerParams
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
        $providerParams
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
        $providerParams
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
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name ecparam -Description $msg._ecparam -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        $nooutParam
        $textParam
        $checkParam
        New-ParamCompleter -Name check_named -Description $msg.ecparam_check_named
        New-ParamCompleter -Name name -Description $msg.ecparam_name -Type Required -VariableName 'arg'
        New-ParamCompleter -Name list_curves -Description $msg.ecparam_list_curves
        New-ParamCompleter -Name conv_form -Description $msg.ec_conv_form -Arguments "compressed", "uncompressed", "hybrid" -VariableName 'arg'
        New-ParamCompleter -Name param_enc -Description $msg.ec_param_enc -Type Required -VariableName 'arg'
        New-ParamCompleter -Name no_seed -Description $msg.ecparam_no_seed
        New-ParamCompleter -Name genkey -Description $msg.ecparam_genkey
        $randParam
        $writerandParam
        $providerParams
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
        $providerParams
    )

    New-CommandCompleter -Name errstr -Description $msg._errstr -Style Unix -NoFileCompletions

    New-CommandCompleter -Name gendsa -Description $msg._gendsa -Style Unix -Parameters @(
        $outParam
        $passoutParam
        $encryptParams
        $verboseParam
        $quietParam
        $randParam
        $writerandParam
        $providerParams
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
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name genpkey -Description $msg._genpkey -Style Unix -Parameters @(
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
        $providerParams
        $configParam
    ) -NoFileCompletions

    New-CommandCompleter -Name info -Description $msg._info -Style Unix -Parameters @(
        New-ParamCompleter -Name configdir -Description $msg.info_configdir
        New-ParamCompleter -Name enginesdir -Description $msg.info_enginesdir
        New-ParamCompleter -Name modulesdir -Description $msg.info_modulesdir
        New-ParamCompleter -Name dsoext -Description $msg.info_dsoext
        New-ParamCompleter -Name dirnamesep -Description $msg.info_dirnamesep
        New-ParamCompleter -Name listsep -Description $msg.info_listsep
        New-ParamCompleter -Name seeds -Description $msg.info_seeds
        New-ParamCompleter -Name cpusettings -Description $msg.info_cpusettings
        New-ParamCompleter -Name windowscontext -Description $msg.info_windowscontext
    ) -NoFileCompletions

    New-CommandCompleter -Name kdf -Description $msg._kdf -Style Unix -Parameters @(
        New-ParamCompleter -Name keylen -Description $msg.kdf_keylen -Type Required -VariableName 'num'
        $outParam
        New-ParamCompleter -Name binay -Description $msg.kdf_binary
        New-ParamCompleter -Name cipher -Description $msg.kdf_cipher -Type Required -VariableName 'name'
        New-ParamCompleter -Name digest -Description $msg.kdf_digest -Type Required -VariableName 'name'
        New-ParamCompleter -Name mac -Description $msg.kdf_mac -Type Required -VariableName 'name'
        New-ParamCompleter -Name kdfopt -Description $msg.kdf_kdfopt -Type Required -VariableName 'nm:v'
        $providerParams
    ) -NoFileCompletions -ArgumentCompleter {
        "TLS1-PRF", "HKDF", "SSKDF", "PBKDF2", "SSHKDF", "X942KDF-ASN1", "X942KDF-CONCAT", "X963KDF", "SCRYPT" |
            Where-Object { $_ -like "$wordToComplete*" }
    }

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
        $providerParams
    )

    New-CommandCompleter -Name rsa -Description $msg._rsa -Style Unix -Parameters @(
        $inform2Param
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
        $providerParams
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
    ) -NoFileCompletions

    New-CommandCompleter -Name s_time -Description $msg._s_time -Style Unix -Parameters @(
        New-ParamCompleter -Name connect -Description $msg.connect -Type Required -VariableName 'host:port'
        New-ParamCompleter -Name www -Description $msg.s_time_www -Type Required -VariableName 'page'
        $certParam
        $keyParam
        New-ParamCompleter -Name verify -Description $msg.s_server_verify -Type Required -VariableName 'depth'
        New-ParamCompleter -Name new -Description $msg.s_time_new
        New-ParamCompleter -Name reuse -Description $msg.s_time_reuse
        New-ParamCompleter -Name bugs -Description $msg.s_time_bugs
        New-ParamCompleter -Name cipher -Description $msg.cipher -Type Required -VariableName 'cipherlist'
        New-ParamCompleter -Name ciphersuites -Description $msg.ciphers_ciphersuites -Type Required -VariableName 'val'
        New-ParamCompleter -Name time -Description $msg.s_time_time -Type Required -VariableName 'length'
        New-ParamCompleter -Name nameopt -Description $msg.verify_nameopt -Type Required -VariableName 'option'
        $CAfileParam
        $noCAfileParam
        $CApathParam
        $noCApathParam
        $CAstoreParam
        $noCAstoreParam
        $providerParams
        New-ParamCompleter -Name ssl3 -Description $msg.ssl3
        New-ParamCompleter -Name tls1 -Description $msg.tls1
        New-ParamCompleter -Name tls1_1 -Description $msg.tls1_1
        New-ParamCompleter -Name tls1_2 -Description $msg.tls1_2
        New-ParamCompleter -Name tls1_3 -Description $msg.tls1_3
    ) -NoFileCompletions

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
        $providerParams
    )

    New-CommandCompleter -Name speed -Description $msg._speed -Style Unix -Parameters @(
        $configParam
        New-ParamCompleter -Name elapsed -Description $msg.speed_elapsed
        New-ParamCompleter -Name evp -Description $msg.speed_evp -Type Required -VariableName 'alg'
        New-ParamCompleter -Name multi -Description $msg.speed_multi -Type Required -VariableName 'num'
        New-ParamCompleter -Name async_jobs -Description $msg.speed_async_jobs -Type Required -VariableName 'num'
        New-ParamCompleter -Name misalign   -Description $msg.speed_misalign -Type Required -VariableName 'num'
        New-ParamCompleter -Name hmac -Description $msg.speed_hmac -Arguments $digests -VariableName 'digest'
        New-ParamCompleter -Name cmac -Description $msg.speed_cmac -Arguments $ciphers -VariableName 'cipher'
        New-ParamCompleter -Name decrypt -Description $msg.speed_decrypt
        New-ParamCompleter -Name mb -Description $msg.speed_mb
        New-ParamCompleter -Name aead -Description $msg.speed_aead
        New-ParamCompleter -Name kem-algorithms -Description $msg.speed_kem_algorithms
        New-ParamCompleter -Name signature-algorithms -Description $msg.speed_signature_algorithms
        New-ParamCompleter -Name primes -Description $msg.speed_primes -Type Required -VariableName 'num'
        New-ParamCompleter -Name seconds -Description $msg.speed_seconds -Type Required -VariableName 'num'
        New-ParamCompleter -Name bytes -Description $msg.speed_bytes -Type Required -VariableName 'num'
        New-ParamCompleter -Name mr -Description $msg.speed_mr
        New-ParamCompleter -Name mlock -Description $msg.speed_mlock
        New-ParamCompleter -Name testmode -Description $msg.speed_testmode
        $randParam
        $writerandParam
        $providerParams
    ) -NoFileCompletions -ArgumentCompleter {
        $list = 'md5', 'sha1', 'rmd160', 'sha256', 'sha512', 'hmac', 'des-ede3',
                'aes-128-cbc', 'aes-192-cbc', 'aes-256-cbc',
                'camellia-128-cbc', 'camellia-192-cbc', 'camellia-256-cbc',
                'ghash', 'rand', 'kmac128', 'kmac256'
        $list.Where({ $_ -like "$wordToComplete*" })
    }

    New-CommandCompleter -Name list -Description $msg._list -Style Unix -Parameters @(
        $verboseParam
        New-ParamCompleter -Name select -Description $msg.list_select -Type Required -VariableName 'name'
        New-ParamCompleter -Name 1 -Description $msg.list_singlecolumn
        New-ParamCompleter -Name all-algorithms -Description $msg.list_all_algorithms
        New-ParamCompleter -Name commands -Description $msg.list_commands
        New-ParamCompleter -Name standard-commands -Description $msg.list_standard_commands
        New-ParamCompleter -Name digest-commands -Description $msg.list_digest_commands
        New-ParamCompleter -Name cipher-commands -Description $msg.list_cipher_commands
        New-ParamCompleter -Name cipher-algorithms -Description $msg.list_cipher_algorithms
        New-ParamCompleter -Name digest-algorithms -Description $msg.list_digest_algorithms
        New-ParamCompleter -Name kdf-algorithms -Description $msg.list_kdf_algorithms
        New-ParamCompleter -Name mac-algorithms -Description $msg.list_mac_algorithms
        New-ParamCompleter -Name random-instances -Description $msg.list_random_instances
        New-ParamCompleter -Name random-generators -Description $msg.list_random_generators
        New-ParamCompleter -Name encoders -Description $msg.list_encoders
        New-ParamCompleter -Name decoders -Description $msg.list_decoders
        New-ParamCompleter -Name public-key-algorithms -Description $msg.list_public_key_algorithms
        New-ParamCompleter -Name public-key-methods -Description $msg.list_public_key_methods
        New-ParamCompleter -Name key-managers -Description $msg.list_key_managers
        New-ParamCompleter -Name skey-managers -Description $msg.list_skey_managers
        New-ParamCompleter -Name key-exchange-algorithms -Description $msg.list_key_exchange_algorithms
        New-ParamCompleter -Name kem-algorithms -Description $msg.list_kem_algorithms
        New-ParamCompleter -Name tls-groups -Description $msg.list_tls_groups
        New-ParamCompleter -Name all-tls-groups -Description $msg.list_all_tls_groups
        New-ParamCompleter -Name tls1_2 -Description $msg.list_tls1_2
        New-ParamCompleter -Name tls1_3 -Description $msg.list_tls1_3
        New-ParamCompleter -Name signature-algorithms -Description $msg.list_signature_algorithms
        New-ParamCompleter -Name tls-signature-algorithms -Description $msg.list_tls_signature_algorithms
        New-ParamCompleter -Name asymcipher-algorithms -Description $msg.list_asymcipher_algorithms
        New-ParamCompleter -Name store-loaders -Description $msg.list_store_loaders
        New-ParamCompleter -Name providers -Description $msg.list_providers
        New-ParamCompleter -Name engines -Description $msg.list_engines
        New-ParamCompleter -Name disabled -Description $msg.list_disabled
        New-ParamCompleter -Name objects -Description $msg.list_objects
        New-ParamCompleter -Name options -Description $msg.list_options -Type Required -VariableName 'command'
    ) -NoFileCompletions

    New-CommandCompleter -Name mac -Description $msg._mac -Style Unix -Parameters @(
        $inParam
        $outParam
        New-ParamCompleter -Name binary -Description $msg.mac_binary
        New-ParamCompleter -Name cipher -Description $msg.mac_cipher -Type Required -VariableName 'name'
        New-ParamCompleter -Name digest -Description $msg.mac_digest -Type Required -VariableName 'name'
        New-ParamCompleter -Name macopt -Description $msg.mac_macopt -Type Required -VariableName 'nm:v'
        $providerParams
    )

    New-CommandCompleter -Name rand -Description $msg._rand -Style Unix -Parameters @(
        $outParam
        New-ParamCompleter -Name base64 -Description $msg.rand_base64
        New-ParamCompleter -Name hex -Description $msg.rand_hex
        $randParam
        $writerandParam
        $providerParams
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
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name pkcs7 -Description $msg._pkcs7 -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        New-ParamCompleter -Name print -Description $msg.pkcs7_print
        New-ParamCompleter -Name print_certs -Description $msg.pkcs7_print_certs
        $quietParam
        $textParam
        $nooutParam
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name pkcs8 -Description $msg._pkcs8 -Style Unix -Parameters @(
        New-ParamCompleter -Name topk8 -Description $msg.pkcs8_topk8
        $informParam
        $outformParam
        New-ParamCompleter -Name traditional -Description $msg.pkcs8_traditional
        $inParam
        $passinParam
        $outParam
        New-ParamCompleter -Name iter -Description $msg.pkcs8_iter -Type Require -VariableName 'count'
        New-ParamCompleter -Name noiter -Description $msg.pkcs8_noiter
        New-ParamCompleter -Name nocrypt -Description $msg.pkcs8_nocrypt
        New-ParamCompleter -Name v2 -Description $msg.pkcs8_v2 -VariableName 'alg' -Arguments "aes128", "aes256", "des3"
        New-ParamCompleter -Name v2prf -Description $msg.pkcs8_v2prf -VariableName 'alg' -Arguments "hmacWithSHA256", "hmacWithSHA1"
        New-ParamCompleter -Name v1 -Description $msg.pkcs8_v1 -VariableName 'alg'
        New-ParamCompleter -Name scrypt -Description $msg.pkcs8_scrypt
        New-ParamCompleter -Name scrypt_N -Description $msg.pkcs8_scrypt_N -Type Required -VariableName 'N'
        New-ParamCompleter -Name scrypt_r -Description $msg.pkcs8_scrypt_r -Type Required -VariableName 'r'
        New-ParamCompleter -Name scrypt_p -Description $msg.pkcs8_scrypt_p -Type Required -VariableName 'p'
        New-ParamCompleter -Name saltlen -Description $msg.pkcs8_saltlen -Type Required -VariableName 'size'
        $randParam
        $writerandParam
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name pkcs12 -Description $msg._pkcs12 -Style Unix -Parameters @(
        $passinParam
        $passoutParam
        New-ParamCompleter -Name password -Description $msg.pkcs12_password -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
        New-ParamCompleter -Name twopass -Description $msg.pkcs12_twopass
        New-ParamCompleter -Name nokeys -Description $msg.pkcs12_nokeys
        New-ParamCompleter -Name nocerts -Description $msg.pkcs12_nocerts
        $nooutParam
        New-ParamCompleter -Name legacy -Description $msg.pkcs12_legacy
        $providerParams
        $randParam
        $writerandParam
    ) -NoFileCompletions

    New-CommandCompleter -Name pkey -Description $msg._pkey -Style Unix -Parameters @(
        $providerParams
        $checkParam
        New-ParamCompleter -Name pubcheck -Description $msg.pkey_pubcheck
        $inParam
        $inform2Param
        $passinParam
        $pubinParam
        $outParam
        $outformParam
        $cipherParams
        $passoutParam
        New-ParamCompleter -Name traditional -Description $msg.pkcs8_traditional
        $puboutParam
        $nooutParam
        $textParam
        New-ParamCompleter -Name text_pub -Description $msg.pkey_text_pub
        New-ParamCompleter -Name ec_conv_form -Description $msg.ec_conv_form -Arguments "compressed", "uncompressed", "hybrid" -VariableName 'arg'
        New-ParamCompleter -Name ec_param_enc -Description $msg.ec_param_enc -Type Required -VariableName 'arg'
    ) -NoFileCompletions

    New-CommandCompleter -Name pkeyparam -Description $msg._pkeyparam -Style Unix -Parameters @(
        $inParam
        $outParam
        $textParam
        $nooutParam
        $checkParam
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter-Name pkeyutl -Description $msg._pkeyutl -Style Unix -Parameters @(
        $inParam
        New-ParamCompleter -Name rawin -Description $msg.pkeyutl_rawin
        New-ParamCompleter -Name digest -Description $msg.pkeyutl_digest -Type Required -VariableName 'algorithm'
        $outParam
        New-ParamCompleter -Name secret -Description $msg.pkeyutl_secret -Type File -VariableName 'filename'
        New-ParamCompleter -Name sigfile -Description $msg.pkeyutl_sigfile -Type File -VariableName 'file'
        New-ParamCompleter -Name inkey -Description $msg.pkeyutl_inkey -Type File -VariableName 'filename|uri'
        $keyformParam
        $passinParam
        $pubinParam
        New-ParamCompleter -Name certin -Description $msg.pkeyutl_certin
        New-ParamCompleter -Name rev -Description $msg.pkeyutl_rev
        New-ParamCompleter -Name sign -Description $msg.pkeyutl_sign
        New-ParamCompleter -Name verify -Description $msg.pkeyutl_verify
        New-ParamCompleter -Name verifyrecover -Description $msg.pkeyutl_verifyrecover
        New-ParamCompleter -Name encrypt -Description $msg.pkeyutl_encrypt
        New-ParamCompleter -Name decrypt -Description $msg.pkeyutl_decrypt
        New-ParamCompleter -Name derive -Description $msg.pkeyutl_derive
        New-ParamCompleter -Name peerkey -Description $msg.pkeyutl_peerkey -Type File -VariableName 'file'
        New-ParamCompleter -Name peerform -Description $msg.pkeyutl_peerform -Arguments $keyformArgs -VariableName 'form'
        New-ParamCompleter -Name encap -Description $msg.pkeyutl_encap
        New-ParamCompleter -Name decap -Description $msg.pkeyutl_decap
        New-ParamCompleter -Name kemop -Description $msg.pkeyutl_kemop -Type Required -VariableName 'mode'
        New-ParamCompleter -Name kdf -Description $msg.pkeyutl_kdf -Type Required -VariableName 'algorithm'
        New-ParamCompleter -Name kdflen -Description $msg.pkeyutl_kdflen -Type Required -VariableName 'length'
        $pkeyoptParam
        New-ParamCompleter -Name pkeyopt_passin -Description $msg.pkeyutl_pkeyopt_passin -Type Required -VariableName 'arg' -ArgumentCompleter $passphraseCompleter
        New-ParamCompleter -Name hexdump -Description $msg.pkeyutl_hexdump
        New-ParamCompleter -Name asn1parse -Description $msg.pkeyutl_asn1parse
        $randParam
        $writerandParam
        $providerParams
        $configParam
    ) -NoFileCompletions

    New-CommandCompleter -Name prime -Description $msg._prime -Style Unix -Parameters @(
        New-ParamCompleter -Name hex -Description $msg.prime_hex
        $inParam
        New-ParamCompleter -Name generate -Description $msg.prime_generate
        New-ParamCompleter -Name bits -Description $msg.prime_bits -Type Required -VariableName 'num'
        New-ParamCompleter -Name safe -Description $msg.prime_safe
        $providerParams
    ) -NoFileCompletions

    New-CommandCompleter -Name rehash -Description $msg._rehash -Style Unix -Parameters @(
        New-ParamCompleter -Name old -Description $msg.rehash_old
        New-ParamCompleter -Name n -Description $msg.rehash_n
        New-ParamCompleter -Name compat -Description $msg.rehash_compat
        New-ParamCompleter -Name v -Description $msg.rehash_v
        $providerParams
    )

    New-CommandCompleter -Name sess_id -Description $msg._sess_id -Style Unix -Parameters @(
        $informParam
        $outformParam
        $inParam
        $outParam
        $textParam
        New-ParamCompleter -Name cert -Description $msg.sess_id_cert
        $nooutParam
        New-ParamCompleter -name context -Description $msg.sess_id_context -Type Required -VariableName 'ID'
    )

    New-CommandCompleter -Name smime -Description $msg._smime -Style Unix -Parameters @(
        New-ParamCompleter -Name encrypt -Description $msg.smime_encrypt
        New-ParamCompleter -Name decrypt -Description $msg.smime_decrypt
        New-ParamCompleter -Name sign -Description $msg.smime_sign
        New-ParamCompleter -Name resign -Description $msg.smime_resign
        New-ParamCompleter -Name verify -Description $msg.smime_verify
        New-ParamCompleter -Name pk7out -Description $msg.smime_pk7out
        $inParam
        $outParam
        New-ParamCompleter -Name inform -Description $msg.inform -Arguments $smimeformArgs -VariableName 'format'
        New-ParamCompleter -Name outform -Description $msg.outform -Arguments $smimeformArgs -VariableName 'format'
        New-ParamCompleter -Name keyform -Description $msg.keyform -Arguments $smimekeyformArgs -VariableName 'format'
        New-ParamCompleter -Name stream,indef -Description $msg.smime_indef
        New-ParamCompleter -Name noindef -Description $msg.smime_noindef
        New-ParamCompleter -Name content -Description $msg.smime_content -Type File -VariableName 'filename'
        New-ParamCompleter -Name text -Description $msg.smime_text
        New-ParamCompleter -Name md -Description $msg.smime_md -Arguments $digests -VariableName 'digest'
        $cipherParams
        New-ParamCompleter -Name nointern -Description $msg.smime_nointern
        New-ParamCompleter -Name noverify -Description $msg.smime_noverify
        New-ParamCompleter -Name nochain -Description $msg.smime_nochain
        New-ParamCompleter -Name nosigs -Description $msg.smime_nosigs
        New-ParamCompleter -Name nocerts -Description $msg.smime_nocerts
        New-ParamCompleter -Name noattr -Description $msg.smime_noattr
        New-ParamCompleter -Name nodetach -Description $msg.smime_nodetach
        New-ParamCompleter -Name nosmimecap -Description $msg.smime_nosmimecap
        New-ParamCompleter -Name binary -Description $msg.smime_binary
        New-ParamCompleter -Name crlfeol -Description $msg.smime_crlfeol
        New-ParamCompleter -Name certfile -Description $msg.smime_certfile -Type File -VariableName 'file'
        New-ParamCompleter -Name signer -Description $msg.smime_signer -Type File -VariableName 'file'
        New-ParamCompleter -Name recip -Description $msg.smime_recip -Type File -VariableName 'file'
        New-ParamCompleter -Name inkey -Description $msg.smime_inkey -Type File -VariableName 'filename|uri'
        $passinParam
        New-ParamCompleter -Name to -Description $msg.smime_to -Type Required -VariableName 'addr'
        New-ParamCompleter -Name from -Description $msg.smime_from -Type Required -VariableName 'addr'
        New-ParamCompleter -Name subject -Description $msg.smime_subject -Type Required -VariableName 's'
        $CAfileParam
        $noCAfileParam
        $CApathParam
        $noCApathParam
        $CAstoreParam
        $noCAstoreParam
        $randParam
        $writerandParam
        $providerParams
        $configParam
    )

    New-CommandCompleter -Name storeutl -Description $msg._storeutl-Style Unix -Parameters @(
        $outParam
        $nooutParam
        $passinParam
        $textParam
        New-ParamCompleter -Name r -Description $msg.storeutl_r
        New-ParamCompleter -Name certs -Description $msg.storeutl_certs
        New-ParamCompleter -Name keys -Description $msg.storeutl_keys
        New-ParamCompleter -Name crls -Description $msg.storeutl_crls
        New-ParamCompleter -Name subject -Description $msg.storeutl_subject -Type Required -VariableName 'arg'
        New-ParamCompleter -Name issuer -Description $msg.storeutl_issuer -Type Required -VariableName 'arg'
        New-ParamCompleter -Name serial -Description $msg.storeutl_serial -Type Required -VariableName 'arg'
        New-ParamCompleter -Name alias -Description $msg.storeutl_alias -Type Required -VariableName 'arg'
        New-ParamCompleter -Name fingerprint -Description $msg.storeutl_fingerprint -Type Required -VariableName 'arg'
        New-ParamCompleter -Name digest -Description $msg.storeutl_digest
        $providerParams
    ) -NoFileCompletions
) -NoFileCompletions
