<#
 # ffmpeg completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    ffmpeg                          = video converter
    input_file                      = Input file
    output_file                     = Output file
    overwrite                       = Overwrite output files without asking
    no_overwrite                    = Do not overwrite output files
    codec                           = Set codec (copy to copy stream)
    codec_audio                     = Set audio codec
    codec_video                     = Set video codec
    codec_subtitle                  = Set subtitle codec
    codec_data                      = Set data codec
    filter                          = Set stream filtergraph
    filter_audio                    = Set audio filtergraph
    filter_video                    = Set video filtergraph
    filter_complex                  = Create a complex filtergraph
    bitrate                         = Set bitrate
    bitrate_audio                   = Set audio bitrate
    bitrate_video                   = Set video bitrate
    frames                          = Set number of frames to output
    frames_audio                    = Set number of audio frames to output
    frames_video                    = Set number of video frames to output
    quality                         = Set quality (codec-specific)
    quality_audio                   = Set audio quality
    quality_video                   = Set video quality
    format                          = Force format
    input_format                    = Force input format
    sample_format                   = Set sample format
    sample_rate                     = Set sample rate
    channels                        = Set number of audio channels
    channel_layout                  = Set channel layout
    video_size                      = Set frame size
    pixel_format                    = Set pixel format
    frame_rate                      = Set frame rate
    aspect_ratio                    = Set aspect ratio
    video_sync                      = Video sync method
    audio_sync                      = Audio sync method
    start_time                      = Set start time offset
    duration                        = Limit the duration of data read from input
    timestamp                       = Set the recording timestamp
    metadata                        = Set metadata
    disposition                     = Set disposition
    program                         = Add program with specified streams
    target                          = Specify target file type
    shortest                        = Finish encoding when the shortest input stream ends
    accurate_seek                   = Enable accurate seeking
    seek_timestamp                  = Enable seeking by timestamp
    thread_queue_size               = Set the maximum number of queued packets
    stream_loop                     = Set number of times input stream shall be looped
    loop_output                     = Number of times to loop output
    map                             = Set input stream mapping
    map_chapters                    = Set chapters mapping
    map_metadata                    = Set metadata information of outfile from infile
    threads                         = Set number of threads
    preset                          = Set preset
    stats                           = Print progress report during encoding
    progress                        = Write program-readable progress information
    stdin                           = Enable stdin interaction
    debug                           = Print specific debug info
    benchmark                       = Add timings for benchmarking
    benchmark_all                   = Add timings for each task
    timelimit                       = Set max runtime in seconds
    dump                            = Dump each input packet
    hex                             = Dump packets as hex
    re                              = Read input at native frame rate
    stream_group                    = Add stream group
    dcodec                          = Alias for -codec:d
    acodec                          = Alias for -codec:a
    vcodec                          = Alias for -codec:v
    scodec                          = Alias for -codec:s
    dn                              = Disable data stream
    an                              = Disable audio stream
    vn                              = Disable video stream
    sn                              = Disable subtitle stream
    pass                            = Select the pass number (1 or 2)
    passlogfile                     = Select two pass log file name prefix
    vstats                          = Dump video coding statistics to file
    vstats_file                     = Dump video coding statistics to file
    vstats_version                  = Version of vstats format
    hide_banner                     = Do not show program banner
    loglevel                        = Set logging level
    report                          = Generate a report
    max_alloc                       = Set maximum size of single allocated block
    cpuflags                        = Force specific CPU flags
    cpucount                        = Force specific CPU count
    help                            = Show help
    version                         = Show version
    formats                         = Show available formats
    devices                         = Show available devices
    codecs                          = Show available codecs
    decoders                        = Show available decoders
    encoders                        = Show available encoders
    bsfs                            = Show available bit stream filters
    protocols                       = Show available protocols
    filters                         = Show available filters
    pix_fmts                        = Show available pixel formats
    layouts                         = Show standard channel layouts
    sample_fmts                     = Show available audio sample formats
    dispositions                    = Show available stream dispositions
    colors                          = Show available color names
    sources                         = List sources of input device
    sinks                           = List sinks of output device
    hwaccels                        = Show available HW acceleration methods
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$codecArgument       = New-ArgumentCompleter codec
$bitrageArgument     = New-ArgumentCompleter bitrate
$filtergraphArgument = New-ArgumentCompleter filtergraph

Register-NativeCompleter -Name ffmpeg -Description $msg.ffmpeg -Style Unix -Parameters @(
    # Main options
    New-ParamCompleter -Name f -Description $msg.format -Arguments @{ Name = 'fmt' }
    New-ParamCompleter -Name i -Description $msg.input_file -Arguments @{ Name = 'input'; Type = 'File' }
    New-ParamCompleter -Name y -Description $msg.overwrite
    New-ParamCompleter -Name n -Description $msg.no_overwrite

    # Codec options
    New-ParamCompleter -Name c -Description $msg.codec -Arguments $codecArgument
    New-ParamCompleter -Name codec -Description $msg.codec -Arguments $codecArgument
    New-ParamCompleter -Name acodec -Description $msg.acodec -Arguments $codecArgument
    New-ParamCompleter -Name vcodec -Description $msg.vcodec -Arguments $codecArgument
    New-ParamCompleter -Name scodec -Description $msg.scodec -Arguments $codecArgument
    New-ParamCompleter -Name dcodec -Description $msg.dcodec -Arguments $codecArgument

    # Bitrate options
    New-ParamCompleter -Name b -Description $msg.bitrate -Arguments $bitrageArgument
    New-ParamCompleter -Name ab -Description $msg.bitrate_audio -Arguments $bitrageArgument
    New-ParamCompleter -Name vb -Description $msg.bitrate_video -Arguments $bitrageArgument

    # Filter options
    New-ParamCompleter -Name filter -Description $msg.filter -Arguments $filtergraphArgument
    New-ParamCompleter -Name af -Description $msg.filter_audio -Arguments $filtergraphArgument
    New-ParamCompleter -Name vf -Description $msg.filter_video -Arguments $filtergraphArgument
    New-ParamCompleter -Name filter_complex -Description $msg.filter_complex -Arguments $filtergraphArgument

    # Frame options
    New-ParamCompleter -Name frames -Description $msg.frames -Arguments @{ Name = 'number' }
    New-ParamCompleter -Name r -Description $msg.frame_rate -Arguments @{ Name = 'rate' }
    New-ParamCompleter -Name s -Description $msg.video_size -Arguments @{ Name = 'size' }
    New-ParamCompleter -Name aspect -Description $msg.aspect_ratio -Arguments @{ Name = 'aspect' }
    New-ParamCompleter -Name pix_fmt -Description $msg.pixel_format -Arguments @{ Name = 'format' }

    # Audio options
    New-ParamCompleter -Name ar -Description $msg.sample_rate -Arguments @{ Name = 'rate' }
    New-ParamCompleter -Name ac -Description $msg.channels -Arguments @{ Name = 'channels' }
    New-ParamCompleter -Name sample_fmt -Description $msg.sample_format -Arguments @{ Name = 'format' }
    New-ParamCompleter -Name channel_layout -Description $msg.channel_layout -Arguments @{ Name = 'layout' }

    # Quality options
    New-ParamCompleter -Name q -Description $msg.quality -Arguments @{ Name = 'quality' }
    New-ParamCompleter -Name qscale -Description $msg.quality -Arguments @{ Name = 'quality' }

    # Time options
    New-ParamCompleter -Name ss -Description $msg.start_time -Arguments @{ Name = 'position' }
    New-ParamCompleter -Name t -Description $msg.duration -Arguments @{ Name = 'duration' }
    New-ParamCompleter -Name to -Description $msg.duration -Arguments @{ Name = 'position' }
    New-ParamCompleter -Name timestamp -Description $msg.timestamp -Arguments @{ Name = 'date' }

    # Metadata options
    New-ParamCompleter -Name metadata -Description $msg.metadata -Arguments @{ Name = 'key=value' }
    New-ParamCompleter -Name disposition -Description $msg.disposition -Arguments @{ Name = 'value' }
    New-ParamCompleter -Name program -Description $msg.program -Arguments @{ Name = 'title=program' }

    # Stream selection
    New-ParamCompleter -Name map -Description $msg.map -Arguments @{ Name = 'stream' }
    New-ParamCompleter -Name map_chapters -Description $msg.map_chapters -Arguments @{ Name = 'input' }
    New-ParamCompleter -Name map_metadata -Description $msg.map_metadata -Arguments @{ Name = 'spec' }

    # Stream disable
    New-ParamCompleter -Name an -Description $msg.an
    New-ParamCompleter -Name vn -Description $msg.vn
    New-ParamCompleter -Name sn -Description $msg.sn
    New-ParamCompleter -Name dn -Description $msg.dn

    # Advanced options
    New-ParamCompleter -Name threads -Description $msg.threads -Arguments @{ Name = 'count' }
    New-ParamCompleter -Name preset -Description $msg.preset -Arguments @{ Name = 'preset' }
    New-ParamCompleter -Name target -Description $msg.target -Arguments @{ Name = 'type' }
    New-ParamCompleter -Name pass -Description $msg.pass -Arguments @{ Name = 'n' }
    New-ParamCompleter -Name passlogfile -Description $msg.passlogfile -Arguments @{ Name = 'prefix'; Type = 'File' }
    New-ParamCompleter -Name shortest -Description $msg.shortest
    New-ParamCompleter -Name accurate_seek -Description $msg.accurate_seek
    New-ParamCompleter -Name seek_timestamp -Description $msg.seek_timestamp
    New-ParamCompleter -Name thread_queue_size -Description $msg.thread_queue_size -Arguments @{ Name = 'size' }
    New-ParamCompleter -Name stream_loop -Description $msg.stream_loop -Arguments @{ Name = 'count' }
    New-ParamCompleter -Name loop -Description $msg.loop_output -Arguments @{ Name = 'count' }

    # Sync options
    New-ParamCompleter -Name vsync -Description $msg.video_sync -Arguments @{ Name = 'method' }
    New-ParamCompleter -Name async -Description $msg.audio_sync -Arguments @{ Name = 'samples' }

    # Format options
    New-ParamCompleter -Name fmt -Description $msg.input_format -Arguments @{ Name = 'format' }

    # Statistics and logging
    New-ParamCompleter -Name stats -Description $msg.stats
    New-ParamCompleter -Name progress -Description $msg.progress -Arguments @{ Name = 'url' }
    New-ParamCompleter -Name stdin -Description $msg.stdin
    New-ParamCompleter -Name debug -Description $msg.debug -Arguments @{ Name = 'flags' }
    New-ParamCompleter -Name loglevel -Description $msg.loglevel -Arguments @{ Name = 'level' }
    New-ParamCompleter -Name report -Description $msg.report
    New-ParamCompleter -Name vstats -Description $msg.vstats
    New-ParamCompleter -Name vstats_file -Description $msg.vstats_file -Arguments @{ Name = 'file'; Type = 'File' }
    New-ParamCompleter -Name vstats_version -Description $msg.vstats_version -Arguments @{ Name = 'version' }

    # Benchmark options
    New-ParamCompleter -Name benchmark -Description $msg.benchmark
    New-ParamCompleter -Name benchmark_all -Description $msg.benchmark_all
    New-ParamCompleter -Name timelimit -Description $msg.timelimit -Arguments @{ Name = 'duration' }

    # Debug options
    New-ParamCompleter -Name dump -Description $msg.dump
    New-ParamCompleter -Name hex -Description $msg.hex

    # Other options
    New-ParamCompleter -Name re -Description $msg.re
    New-ParamCompleter -Name stream_group -Description $msg.stream_group -Arguments @{ Name = 'spec' }
    New-ParamCompleter -Name max_alloc -Description $msg.max_alloc -Arguments @{ Name = 'bytes' }
    New-ParamCompleter -Name cpuflags -Description $msg.cpuflags -Arguments @{ Name = 'flags' }
    New-ParamCompleter -Name cpucount -Description $msg.cpucount -Arguments @{ Name = 'count' }

    # Display options
    New-ParamCompleter -Name hide_banner -Description $msg.hide_banner
    New-ParamCompleter -Name h -Description $msg.help -Arguments @{ Name = 'topic'; Nargs = '?' }
    New-ParamCompleter -Name version -Description $msg.version
    New-ParamCompleter -Name formats -Description $msg.formats
    New-ParamCompleter -Name devices -Description $msg.devices
    New-ParamCompleter -Name codecs -Description $msg.codecs
    New-ParamCompleter -Name decoders -Description $msg.decoders
    New-ParamCompleter -Name encoders -Description $msg.encoders
    New-ParamCompleter -Name bsfs -Description $msg.bsfs
    New-ParamCompleter -Name protocols -Description $msg.protocols
    New-ParamCompleter -Name filters -Description $msg.filters
    New-ParamCompleter -Name pix_fmts -Description $msg.pix_fmts
    New-ParamCompleter -Name layouts -Description $msg.layouts
    New-ParamCompleter -Name sample_fmts -Description $msg.sample_fmts
    New-ParamCompleter -Name dispositions -Description $msg.dispositions
    New-ParamCompleter -Name colors -Description $msg.colors
    New-ParamCompleter -Name sources -Description $msg.sources -Arguments @{ Name = 'device' }
    New-ParamCompleter -Name sinks -Description $msg.sinks -Arguments @{ Name = 'device' }
    New-ParamCompleter -Name hwaccels -Description $msg.hwaccels
)
