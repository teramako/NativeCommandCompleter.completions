<#
 # convert completion
 #>
Import-Module NativeCommandCompleter.psm -ErrorAction SilentlyContinue

$msg = data { ConvertFrom-StringData @'
    convert                = convert between image formats as well as resize an image, blur, crop, despeckle, dither, draw on, flip, join, re-sample, and much more
    adjoin                 = join images into a single multi-image file
    affine                 = affine transform matrix
    alpha                  = on, activate, off, deactivate, set, opaque, copy, transparent, extract, background, or shape
    annotate               = annotate the image with text
    antialias              = remove pixel-aliasing
    append                 = append an image sequence
    attenuate              = lessen (or intensify) when adding noise to an image
    authenticate           = decipher image with this password
    auto_gamma             = automagically adjust gamma level of image
    auto_level             = automagically adjust color levels of image
    auto_orient            = automagically orient (rotate) image
    auto_threshold         = automatically perform image thresholding
    background             = background color
    bench                  = measure performance
    bias                   = add bias when convolving an image
    black_point_compensation = use black point compensation
    black_threshold        = force all pixels below the threshold into black
    blue_primary           = chromaticity blue primary point
    blue_shift             = simulate a scene at nighttime in the moonlight
    blur                   = reduce image noise and reduce detail levels
    border                 = surround image with a border of color
    bordercolor            = border color
    brightness_contrast    = improve brightness / contrast of the image
    cache                  = megabytes of memory available to the pixel cache
    caption                = assign a caption to an image
    cdl                    = color correct with a color decision list
    channel                = apply option to select image channels
    charcoal               = simulate a charcoal drawing
    chop                   = remove pixels from the image interior
    clamp                  = restrict pixel range from 0 to the quantum depth
    clahe                  = contrast limited adaptive histogram equalization
    clip                   = clip along the first path from the 8BIM profile
    clip_mask              = associate a clip mask with the image
    clip_path              = clip along a named path from the 8BIM profile
    clone                  = clone an image
    clut                   = apply a color lookup table to the image
    coalesce               = merge a sequence of images
    colorize               = colorize the image with the fill color
    colormap               = define the colormap type
    color_matrix           = apply color correction to the image
    colors                 = preferred number of colors in the image
    colorspace             = set image colorspace
    combine                = combine a sequence of images
    comment                = annotate image with comment
    compare                = mathematically and visually annotate the difference between an image and its reconstruction
    complex                = perform complex mathematics on an image sequence
    compose                = set image composite operator
    composite              = composite image
    compress               = image compression type
    connected_components   = connected-components uniquely labeled
    contrast               = enhance or reduce the image contrast
    contrast_stretch       = improve contrast by stretching the intensity range
    convolve               = apply a convolution kernel to the image
    copy                   = copy pixels from one area of an image to another
    crop                   = cut out a rectangular region of the image
    cycle                  = cycle the image colormap
    decipher               = convert cipher pixels to plain pixels
    debug                  = display copious debugging information
    define                 = define one or more image format options
    deconstruct            = break down an image sequence into constituent parts
    delay                  = display the next image after pausing
    delete                 = delete the image from the image sequence
    density                = horizontal and vertical density of the image
    depth                  = image depth
    despeckle              = reduce the speckles within an image
    direction              = render text right-to-left or left-to-right
    display                = get image or font from this X server
    dispose                = layer disposal method
    distort                = distort images according to given method and args
    distribute_cache       = distributed pixel cache spanning one or more servers
    dither                 = apply error diffusion to image
    draw                   = annotate the image with a graphic primitive
    duplicate              = duplicate an image one or more times
    edge                   = apply a filter to detect edges in the image
    emboss                 = emboss an image
    encipher               = convert plain pixels to cipher pixels
    encoding               = text encoding type
    endian                 = endianness (MSB or LSB) of the image
    enhance                = apply a digital filter to enhance a noisy image
    equalize               = perform histogram equalization to an image
    evaluate               = evaluate an arithmetic, relational, or logical expression
    evaluate_sequence      = evaluate an arithmetic, relational, or logical expression for an image sequence
    extent                 = set the image size
    extract                = extract area from image
    family                 = render text with this font family
    features               = analyze image features
    fft                    = implements the discrete Fourier transform (DFT)
    fill                   = color to use when filling a graphic primitive
    filter                 = use this filter when resizing an image
    flatten                = flatten a sequence of images
    flip                   = flip image vertically
    floodfill              = floodfill the image with color
    flop                   = flop image horizontally
    font                   = render text with this font
    foreground             = define the foreground color
    format_option          = output formatted image characteristics
    frame                  = surround image with an ornamental border
    function               = apply a function to the image
    fuzz                   = colors within this distance are considered equal
    fx                     = apply mathematical expression to an image channel(s)
    gamma                  = level of gamma correction
    gaussian_blur          = reduce image noise and reduce detail levels
    geometry               = preferred size or location of the image
    gravity                = horizontal and vertical text placement
    grayscale              = convert image to grayscale
    green_primary          = chromaticity green primary point
    help                   = print program options
    highlight_color        = set the highlight color for the comparison image
    hough_lines            = identify lines in the image
    iconGeometry           = specify the icon geometry
    iconic                 = iconic animation
    identify               = identify the format and characteristics of the image
    ift                    = implements the inverse discrete Fourier transform (DFT)
    immutable              = prohibit image edits
    implode                = implode image pixels about the center
    insert                 = insert last image into the image sequence
    intensity              = method to generate intensity value from pixel
    intent                 = type of rendering intent when managing the image color
    interlace              = type of image interlacing scheme
    interpolate            = pixel color interpolation method
    interline_spacing      = set the space between two text lines
    interword_spacing      = set the space between two words
    kerning                = set the space between two letters
    kmeans                 = K means color reduction
    kuwahara               = edge preserving noise reduction filter
    label                  = assign a label to an image
    lat                    = local adaptive thresholding
    layers                 = optimize, merge, or compare image layers
    level                  = adjust the level of image contrast
    level_colors           = level image with the given colors
    limit                  = pixel cache resource limit
    linear_stretch         = improve contrast by stretching with saturation
    liquid_rescale         = rescale image with seam-carving
    list                   = print a list of supported option arguments
    log                    = format of debugging information
    loop                   = add Netscape loop extension to your GIF animation
    lowlight_color         = set the lowlight color for the comparison image
    magnify                = double the size of the image with pixel art scaling
    map                    = transform image colors to match this set of colors
    mattecolor             = frame color
    median                 = apply a median filter to the image
    mean_shift             = delineate arbitrarily shaped clusters in the image
    metric                 = measure differences between images with this metric
    mode                   = make each pixel the 'predominant color' of the neighborhood
    modulate               = vary the brightness, saturation, and hue
    monitor                = monitor progress
    monochrome             = transform image to black and white
    morph                  = morph an image sequence
    morphology             = apply a morphology method to the image
    motion_blur            = simulate motion blur
    name                   = name an image
    negate                 = replace each pixel with its complementary color
    noise                  = add or reduce noise in an image
    normalize              = transform image to span the full range of colors
    opaque                 = change this color to the fill color
    ordered_dither         = add a noise pattern to the image with specific intensities
    orient                 = image orientation
    page                   = size and location of an image canvas (setting)
    paint                  = simulate an oil painting
    path                   = write images to this path on disk
    perceptible            = set each pixel whose value is less than epsilon to -epsilon or epsilon
    ping                   = efficiently determine image attributes
    pointsize              = font point size
    polaroid               = simulate a Polaroid picture
    poly                   = build a polynomial from the image sequence and the corresponding terms
    posterize              = reduce the image to a limited number of color levels
    precision              = maximum number of significant digits to print
    preview                = image preview type
    print                  = interpret string and print to console
    process                = process the image with a custom image filter
    profile                = add, delete, or apply an image profile
    quality                = JPEG/MIFF/PNG compression level
    quantize               = reduce colors in this colorspace
    quiet                  = suppress all warning messages
    radial_blur            = radial blur the image
    raise                  = lighten/darken image edges to create a 3-D effect
    random_threshold       = random threshold the image
    range_threshold        = perform either hard or soft thresholding within some range of values
    red_primary            = chromaticity red primary point
    regard_warnings        = pay attention to warning messages
    region                 = apply options to a portion of the image
    remap                  = transform image colors to match this set of colors
    render                 = render vector graphics
    repage                 = size and location of an image canvas
    resample               = change the resolution of an image
    resize                 = resize the image
    respect_parentheses    = settings remain in effect until parenthesis boundary
    reverse                = reverse image sequence
    roll                   = roll an image vertically or horizontally
    rotate                 = apply Paeth rotation to the image
    sample                 = scale image with pixel sampling
    sampling_factor        = horizontal and vertical sampling factor
    scale                  = scale the image
    scene                  = image scene number
    seed                   = seed a new sequence of pseudo-random numbers
    segment                = segment an image
    selective_blur         = selectively blur pixels within a contrast threshold
    separate               = separate an image channel into a grayscale image
    sepia_tone             = simulate a sepia-toned photo
    set                    = set an image property
    shade                  = shade the image using a distant light source
    shadow                 = simulate an image shadow
    sharpen                = sharpen the image
    shave                  = shave pixels from the image edges
    shear                  = slide one edge of the image along the X or Y axis
    sigmoidal_contrast     = increase the contrast without saturating highlights or shadows
    silent                 = operate silently
    similarity_threshold   = minimum distortion for (sub)image match
    size                   = width and height of image
    sketch                 = simulate a pencil sketch
    smush                  = smush an image sequence together
    snaps                  = number of screen snapshots
    solarize               = negate all pixels above the threshold level
    splice                 = splice the background color into the image
    spread                 = displace image pixels by a random amount
    statistic              = replace each pixel with corresponding statistic from the neighborhood
    stretch                = render text with this font stretch
    strip                  = strip image of all profiles and comments
    stroke                 = graphic primitive stroke color
    strokewidth            = graphic primitive stroke width
    style                  = render text with this font style
    subimage_search        = search for subimage
    swap                   = swap two images in the image sequence
    swirl                  = swirl image pixels about the center
    synchronize            = synchronize image to storage device
    taint                  = declare the image as modified
    texture                = name of texture to tile onto the image background
    threshold              = threshold the image
    thumbnail              = create a thumbnail of the image
    tile                   = tile image when filling a graphic primitive
    tile_offset            = tile offset
    tint                   = tint the image with the fill color
    transform              = affine transform image
    transparent            = make this color transparent within the image
    transparent_color      = transparent color
    transpose              = flip image vertically and rotate 90 degrees
    transverse             = flop image horizontally and rotate 270 degrees
    treedepth              = color tree depth
    trim                   = trim image edges
    type                   = image type
    undercolor             = annotation bounding box color
    unique_colors          = discard all but one of any pixel color
    units                  = the units of image resolution
    unsharp                = sharpen the image
    update                 = detect when image file is modified and redisplay
    verbose                = print detailed information about the image
    version                = print version information
    view                   = FlashPix viewing transforms
    vignette               = soften the edges of the image in vignette style
    virtual_pixel          = virtual pixel access method
    visual                 = visual type
    watermark              = percent brightness and saturation of a watermark
    wave                   = alter an image along a sine wave
    wavelet_denoise        = removes noise from the image using a wavelet transform
    weight                 = render text with this font weight
    white_point            = chromaticity white point
    white_threshold        = force all pixels above the threshold into white
    window                 = select window with this id or name
    window_group           = select window with this shared id
'@ }
Import-LocalizedData -BindingVariable localizedMessages -ErrorAction SilentlyContinue;
foreach ($key in $localizedMessages.Keys) { $msg[$key] = $localizedMessages[$key] }

$filenameArgument = New-ArgumentCompleter filename -Type File;
$geometryArgument = New-ArgumentCompleter geometry
$stringArgument = New-ArgumentCompleter string
$valueArgument = New-ArgumentCompleter value
$colorArgument = New-ArgumentCompleter color

Register-NativeCompleter -Name convert -Description $msg.convert -Parameters @(
    New-ParamCompleter -LongName adjoin -Description $msg.adjoin
    New-ParamCompleter -LongName affine -Description $msg.affine -Arguments @{ Name = 'matrix' }
    New-ParamCompleter -LongName alpha -Description $msg.alpha -Arguments @{
        Name = 'option';
        Candidates = "on","activate","off","deactivate","set","opaque","copy","transparent","extract","background","shape"
    }
    New-ParamCompleter -LongName annotate -Description $msg.annotate -Arguments @{ Name = 'geometry-text' }
    New-ParamCompleter -LongName antialias -Description $msg.antialias
    New-ParamCompleter -LongName append -Description $msg.append
    New-ParamCompleter -LongName attenuate -Description $msg.attenuate -Arguments $valueArgument
    New-ParamCompleter -LongName authenticate -Description $msg.authenticate -Arguments @{ Name = 'password' }
    New-ParamCompleter -LongName auto-gamma -Description $msg.auto_gamma
    New-ParamCompleter -LongName auto-level -Description $msg.auto_level
    New-ParamCompleter -LongName auto-orient -Description $msg.auto_orient
    New-ParamCompleter -LongName auto-threshold -Description $msg.auto_threshold -Arguments @{ Name = 'method' }
    New-ParamCompleter -LongName background -Description $msg.background -Arguments $colorArgument
    New-ParamCompleter -LongName bench -Description $msg.bench -Arguments @{ Name = 'iterations' }
    New-ParamCompleter -LongName bias -Description $msg.bias -Arguments $valueArgument
    New-ParamCompleter -LongName black-point-compensation -Description $msg.black_point_compensation
    New-ParamCompleter -LongName black-threshold -Description $msg.black_threshold -Arguments $valueArgument
    New-ParamCompleter -LongName blue-primary -Description $msg.blue_primary -Arguments @{ Name = 'point' }
    New-ParamCompleter -LongName blue-shift -Description $msg.blue_shift -Arguments @{ Name = 'factor'; Nargs = '?' }
    New-ParamCompleter -LongName blur -Description $msg.blur -Arguments $geometryArgument
    New-ParamCompleter -LongName border -Description $msg.border -Arguments $geometryArgument
    New-ParamCompleter -LongName bordercolor -Description $msg.bordercolor -Arguments $colorArgument
    New-ParamCompleter -LongName brightness-contrast -Description $msg.brightness_contrast -Arguments $geometryArgument
    New-ParamCompleter -LongName cache -Description $msg.cache -Arguments @{ Name = 'threshold' }
    New-ParamCompleter -LongName caption -Description $msg.caption -Arguments $stringArgument
    New-ParamCompleter -LongName cdl -Description $msg.cdl -Arguments $filenameArgument
    New-ParamCompleter -LongName channel -Description $msg.channel -Arguments @{
        Name = 'type';
        Candidates = "red","green","blue","alpha","gray","cyan","magenta","yellow","black","opacity","index","RGB","RGBA","CMYK","CMYKA"
    }
    New-ParamCompleter -LongName charcoal -Description $msg.charcoal -Arguments @{ Name = 'radius'; Nargs = '?' }
    New-ParamCompleter -LongName chop -Description $msg.chop -Arguments $geometryArgument
    New-ParamCompleter -LongName clamp -Description $msg.clamp
    New-ParamCompleter -LongName clahe -Description $msg.clahe -Arguments $geometryArgument
    New-ParamCompleter -LongName clip -Description $msg.clip
    New-ParamCompleter -LongName clip-mask -Description $msg.clip_mask -Arguments $filenameArgument
    New-ParamCompleter -LongName clip-path -Description $msg.clip_path -Arguments @{ Name = 'id' }
    New-ParamCompleter -LongName clone -Description $msg.clone -Arguments @{ Name = 'index' }
    New-ParamCompleter -LongName clut -Description $msg.clut
    New-ParamCompleter -LongName coalesce -Description $msg.coalesce
    New-ParamCompleter -LongName colorize -Description $msg.colorize -Arguments $valueArgument
    New-ParamCompleter -LongName colormap -Description $msg.colormap -Arguments @{ Name = 'type'; Candidates = "shared","private" }
    New-ParamCompleter -LongName color-matrix -Description $msg.color_matrix -Arguments @{ Name = 'matrix' }
    New-ParamCompleter -LongName colors -Description $msg.colors -Arguments $valueArgument
    New-ParamCompleter -LongName colorspace -Description $msg.colorspace -Arguments @{
        Name = 'type';
        Candidates = "RGB","sRGB","Gray","Transparent","OHTA","XYZ","YCbCr","YCC","YIQ","YPbPr","YUV","CMYK","CMY"
    }
    New-ParamCompleter -LongName combine -Description $msg.combine
    New-ParamCompleter -LongName comment -Description $msg.comment -Arguments $stringArgument
    New-ParamCompleter -LongName compare -Description $msg.compare
    New-ParamCompleter -LongName complex -Description $msg.complex -Arguments @{
        Name = 'operator';
        Candidates = "add","conjugate","divide","magnitude","multiply","real","imaginary"
    }
    New-ParamCompleter -LongName compose -Description $msg.compose -Arguments @{ Name = 'operator' }
    New-ParamCompleter -LongName composite -Description $msg.composite
    New-ParamCompleter -LongName compress -Description $msg.compress -Arguments @{
        Name = 'type';
        Candidates = "None","BZip","Fax","Group4","JPEG","JPEG2000","Lossless","LZW","RLE","Zip","LZMA","ZSTD"
    }
    New-ParamCompleter -LongName connected-components -Description $msg.connected_components -Arguments @{ Name = 'connectivity' }
    New-ParamCompleter -LongName contrast -Description $msg.contrast
    New-ParamCompleter -LongName contrast-stretch -Description $msg.contrast_stretch -Arguments $geometryArgument
    New-ParamCompleter -LongName convolve -Description $msg.convolve -Arguments @{ Name = 'coefficients' }
    New-ParamCompleter -LongName copy -Description $msg.copy -Arguments @{ Name = 'geometry-offset' }
    New-ParamCompleter -LongName crop -Description $msg.crop -Arguments $geometryArgument
    New-ParamCompleter -LongName cycle -Description $msg.cycle -Arguments @{ Name = 'amount' }
    New-ParamCompleter -LongName decipher -Description $msg.decipher -Arguments $filenameArgument
    New-ParamCompleter -LongName debug -Description $msg.debug -Arguments @{
        Name = 'events';
        Candidates = "All","Annotate","Blob","Cache","Coder","Configure","Deprecate","Draw","Exception","Locale","Module","Pixel","Resource","Trace","Transform","User","Wand","X11"
    }
    New-ParamCompleter -LongName define -Description $msg.define -Arguments @{ Name = 'format:option' }
    New-ParamCompleter -LongName deconstruct -Description $msg.deconstruct
    New-ParamCompleter -LongName delay -Description $msg.delay -Arguments $valueArgument
    New-ParamCompleter -LongName delete -Description $msg.delete -Arguments @{ Name = 'index' }
    New-ParamCompleter -LongName density -Description $msg.density -Arguments $geometryArgument
    New-ParamCompleter -LongName depth -Description $msg.depth -Arguments $valueArgument
    New-ParamCompleter -LongName despeckle -Description $msg.despeckle
    New-ParamCompleter -LongName direction -Description $msg.direction -Arguments @{ Name = 'type'; Candidates = "right-to-left","left-to-right" }
    New-ParamCompleter -LongName display -Description $msg.display -Arguments @{ Name = 'server' }
    New-ParamCompleter -LongName dispose -Description $msg.dispose -Arguments @{ Name = 'method'; Candidates = "Undefined","None","Background","Previous" }
    New-ParamCompleter -LongName distort -Description $msg.distort -Arguments @{ Name = 'method-args' }
    New-ParamCompleter -LongName distribute-cache -Description $msg.distribute_cache -Arguments @{ Name = 'port' }
    New-ParamCompleter -LongName dither -Description $msg.dither -Arguments @{ Name = 'method'; Candidates = "None","FloydSteinberg","Riemersma" }
    New-ParamCompleter -LongName draw -Description $msg.draw -Arguments $stringArgument
    New-ParamCompleter -LongName duplicate -Description $msg.duplicate -Arguments @{ Name = 'count,indexes' }
    New-ParamCompleter -LongName edge -Description $msg.edge -Arguments @{ Name = 'radius'; Nargs = '?' }
    New-ParamCompleter -LongName emboss -Description $msg.emboss -Arguments @{ Name = 'radius'; Nargs = '?' }
    New-ParamCompleter -LongName encipher -Description $msg.encipher -Arguments $filenameArgument
    New-ParamCompleter -LongName encoding -Description $msg.encoding -Arguments @{ Name = 'type' }
    New-ParamCompleter -LongName endian -Description $msg.endian -Arguments @{ Name = 'type'; Candidates = "MSB","LSB" }
    New-ParamCompleter -LongName enhance -Description $msg.enhance
    New-ParamCompleter -LongName equalize -Description $msg.equalize
    New-ParamCompleter -LongName evaluate -Description $msg.evaluate -Arguments @{ Name = 'operator-value' }
    New-ParamCompleter -LongName evaluate-sequence -Description $msg.evaluate_sequence -Arguments @{ Name = 'operator' }
    New-ParamCompleter -LongName extent -Description $msg.extent -Arguments $geometryArgument
    New-ParamCompleter -LongName extract -Description $msg.extract -Arguments $geometryArgument
    New-ParamCompleter -LongName family -Description $msg.family -Arguments @{ Name = 'name' }
    New-ParamCompleter -LongName features -Description $msg.features -Arguments @{ Name = 'distance' }
    New-ParamCompleter -LongName fft -Description $msg.fft
    New-ParamCompleter -LongName fill -Description $msg.fill -Arguments $colorArgument
    New-ParamCompleter -LongName filter -Description $msg.filter -Arguments @{
        Name = 'type';
        Candidates = "Point","Box","Triangle","Hermite","Hann","Hamming","Blackman","Gaussian","Quadratic","Cubic","Catrom","Mitchell","Jinc","Sinc","SincFast","Kaiser","Welch","Parzen","Bohman","Bartlett","Lagrange","Lanczos","LanczosSharp","Lanczos2","Lanczos2Sharp","Robidoux","RobidouxSharp","Cosine","Spline","LanczosRadius"
    }
    New-ParamCompleter -LongName flatten -Description $msg.flatten
    New-ParamCompleter -LongName flip -Description $msg.flip
    New-ParamCompleter -LongName floodfill -Description $msg.floodfill -Arguments @{ Name = 'geometry color' }
    New-ParamCompleter -LongName flop -Description $msg.flop
    New-ParamCompleter -LongName font -Description $msg.font -Arguments @{ Name = 'name' }
    New-ParamCompleter -LongName foreground -Description $msg.foreground -Arguments $colorArgument
    New-ParamCompleter -LongName format -Description $msg.format_option -Arguments $stringArgument
    New-ParamCompleter -LongName frame -Description $msg.frame -Arguments $geometryArgument
    New-ParamCompleter -LongName function -Description $msg.function -Arguments @{ Name = 'name' }
    New-ParamCompleter -LongName fuzz -Description $msg.fuzz -Arguments @{ Name = 'distance' }
    New-ParamCompleter -LongName fx -Description $msg.fx -Arguments @{ Name = 'expression' }
    New-ParamCompleter -LongName gamma -Description $msg.gamma -Arguments $valueArgument
    New-ParamCompleter -LongName gaussian-blur -Description $msg.gaussian_blur -Arguments $geometryArgument
    New-ParamCompleter -LongName geometry -Description $msg.geometry -Arguments $geometryArgument
    New-ParamCompleter -LongName gravity -Description $msg.gravity -Arguments @{
        Name = 'type';
        Candidates = "None","Center","East","Forget","NorthEast","North","NorthWest","SouthEast","South","SouthWest","West"
    }
    New-ParamCompleter -LongName grayscale -Description $msg.grayscale -Arguments @{
        Name = 'method';
        Candidates = "Rec601Luma","Rec601Luminance","Rec709Luma","Rec709Luminance","Brightness","Lightness","Average","MS"
    }
    New-ParamCompleter -LongName green-primary -Description $msg.green_primary -Arguments @{ Name = 'point' }
    New-ParamCompleter -LongName help -Description $msg.help
    New-ParamCompleter -LongName highlight-color -Description $msg.highlight_color -Arguments $colorArgument
    New-ParamCompleter -LongName hough-lines -Description $msg.hough_lines -Arguments $geometryArgument
    New-ParamCompleter -LongName iconGeometry -Description $msg.iconGeometry -Arguments $geometryArgument
    New-ParamCompleter -LongName iconic -Description $msg.iconic
    New-ParamCompleter -LongName identify -Description $msg.identify
    New-ParamCompleter -LongName ift -Description $msg.ift
    New-ParamCompleter -LongName immutable -Description $msg.immutable
    New-ParamCompleter -LongName implode -Description $msg.implode -Arguments @{ Name = 'amount' }
    New-ParamCompleter -LongName insert -Description $msg.insert -Arguments @{ Name = 'index' }
    New-ParamCompleter -LongName intensity -Description $msg.intensity -Arguments @{
        Name = 'method';
        Candidates = "Average","Brightness","Lightness","Mean","MS","Rec601Luma","Rec601Luminance","Rec709Luma","Rec709Luminance","RMS"
    }
    New-ParamCompleter -LongName intent -Description $msg.intent -Arguments @{
        Name = 'type';
        Candidates = "Absolute","Perceptual","Relative","Saturation"
    }
    New-ParamCompleter -LongName interlace -Description $msg.interlace -Arguments @{
        Name = 'type';
        Candidates = "None","Line","Plane","Partition","GIF","JPEG","PNG"
    }
    New-ParamCompleter -LongName interpolate -Description $msg.interpolate -Arguments @{
        Name = 'method';
        Candidates = "Average","Average4","Average9","Average16","Background","Bilinear","Blend","Catrom","Integer","Mesh","Nearest","Spline"
    }
    New-ParamCompleter -LongName interline-spacing -Description $msg.interline_spacing -Arguments $valueArgument
    New-ParamCompleter -LongName interword-spacing -Description $msg.interword_spacing -Arguments $valueArgument
    New-ParamCompleter -LongName kerning -Description $msg.kerning -Arguments $valueArgument
    New-ParamCompleter -LongName kmeans -Description $msg.kmeans -Arguments $geometryArgument
    New-ParamCompleter -LongName kuwahara -Description $msg.kuwahara -Arguments $geometryArgument
    New-ParamCompleter -LongName label -Description $msg.label -Arguments $stringArgument
    New-ParamCompleter -LongName lat -Description $msg.lat -Arguments $geometryArgument
    New-ParamCompleter -LongName layers -Description $msg.layers -Arguments @{
        Name = 'method';
        Candidates = "coalesce","compareAny","compareClear","compareOverlay","dispose","flatten","merge","mosaic","optimize","optimizeFrame","optimizePlus","optimizeTransparency","composite"
    }
    New-ParamCompleter -LongName level -Description $msg.level -Arguments $valueArgument
    New-ParamCompleter -LongName level-colors -Description $msg.level_colors -Arguments @{ Name = 'color,color' }
    New-ParamCompleter -LongName limit -Description $msg.limit -Arguments $valueArgument
    New-ParamCompleter -LongName linear-stretch -Description $msg.linear_stretch -Arguments $geometryArgument
    New-ParamCompleter -LongName liquid-rescale -Description $msg.liquid_rescale -Arguments $geometryArgument
    New-ParamCompleter -LongName list -Description $msg.list -Arguments @{
        Name = 'type';
        Candidates = "Align","Alpha","Boolean","Cache","Channel","Class","ClipPath","Coder","Color","Colorspace","Command","Compose","Compress","Configure","DataType","Debug","Decoration","Delegate","Direction","Dispose","Distort","Dither","Endian","Evaluate","FillRule","Filter","Font","Format","Function","Gradient","Gravity","Intensity","Intent","Interlace","Interpolate","Kernel","Layers","LineCap","LineJoin","List","Locale","LogEvent","Log","Magic","Method","Metric","Mime","Mode","Morphology","Noise","Orientation","PixelChannel","PixelIntensity","PixelMask","PixelTrait","Policy","PolicyDomain","PolicyRights","Preview","Primitive","QuantumFormat","Resource","SparseColor","Statistic","Storage","Stretch","Style","Threshold","Type","Units","Validate","VirtualPixel"
    }
    New-ParamCompleter -LongName log -Description $msg.log -Arguments @{ Name = 'format' }
    New-ParamCompleter -LongName loop -Description $msg.loop -Arguments @{ Name = 'iterations' }
    New-ParamCompleter -LongName lowlight-color -Description $msg.lowlight_color -Arguments $colorArgument
    New-ParamCompleter -LongName magnify -Description $msg.magnify
    New-ParamCompleter -LongName map -Description $msg.map -Arguments $filenameArgument
    New-ParamCompleter -LongName mattecolor -Description $msg.mattecolor -Arguments $colorArgument
    New-ParamCompleter -LongName median -Description $msg.median -Arguments $geometryArgument
    New-ParamCompleter -LongName mean-shift -Description $msg.mean_shift -Arguments $geometryArgument
    New-ParamCompleter -LongName metric -Description $msg.metric -Arguments @{
        Name = 'type';
        Candidates = "AE","DSSIM","Fuzz","MAE","MEPP","MSE","NCC","PAE","PHASH","PSNR","RMSE","SSIM"
    }
    New-ParamCompleter -LongName mode -Description $msg.mode -Arguments $geometryArgument
    New-ParamCompleter -LongName modulate -Description $msg.modulate -Arguments $valueArgument
    New-ParamCompleter -LongName monitor -Description $msg.monitor
    New-ParamCompleter -LongName monochrome -Description $msg.monochrome
    New-ParamCompleter -LongName morph -Description $msg.morph -Arguments $valueArgument
    New-ParamCompleter -LongName morphology -Description $msg.morphology -Arguments @{ Name = 'method-kernel' }
    New-ParamCompleter -LongName motion-blur -Description $msg.motion_blur -Arguments $geometryArgument
    New-ParamCompleter -LongName name -Description $msg.name
    New-ParamCompleter -LongName negate -Description $msg.negate
    New-ParamCompleter -LongName noise -Description $msg.noise -Arguments @{
        Name = 'type';
        Candidates = "Gaussian","Impulse","Laplacian","Multiplicative","Poisson","Random","Uniform"
    }
    New-ParamCompleter -LongName normalize -Description $msg.normalize
    New-ParamCompleter -LongName opaque -Description $msg.opaque -Arguments $colorArgument
    New-ParamCompleter -LongName ordered-dither -Description $msg.ordered_dither -Arguments @{ Name = 'NxN' }
    New-ParamCompleter -LongName orient -Description $msg.orient -Arguments @{
        Name = 'type';
        Candidates = "TopLeft","TopRight","BottomRight","BottomLeft","LeftTop","RightTop","RightBottom","LeftBottom"
    }
    New-ParamCompleter -LongName page -Description $msg.page -Arguments $geometryArgument
    New-ParamCompleter -LongName paint -Description $msg.paint -Arguments @{ Name = 'radius' }
    New-ParamCompleter -LongName path -Description $msg.path -Arguments @{ Name = 'path'; Type = 'Directory' }
    New-ParamCompleter -LongName perceptible -Description $msg.perceptible -Arguments @{ Name = 'epsilon' }
    New-ParamCompleter -LongName ping -Description $msg.ping
    New-ParamCompleter -LongName pointsize -Description $msg.pointsize -Arguments $valueArgument
    New-ParamCompleter -LongName polaroid -Description $msg.polaroid -Arguments @{ Name = 'angle'; Nargs = '?' }
    New-ParamCompleter -LongName poly -Description $msg.poly -Arguments @{ Name = 'terms' }
    New-ParamCompleter -LongName posterize -Description $msg.posterize -Arguments @{ Name = 'levels' }
    New-ParamCompleter -LongName precision -Description $msg.precision -Arguments $valueArgument
    New-ParamCompleter -LongName preview -Description $msg.preview -Arguments @{
        Name = 'type';
        Candidates = "Rotate","Shear","Roll","Hue","Saturation","Brightness","Gamma","Spiff","Dull","Grayscale","Quantize","Despeckle","ReduceNoise","AddNoise","Sharpen","Blur","Threshold","EdgeDetect","Spread","Solarize","Shade","Raise","Segment","Swirl","Implode","Wave","OilPaint","CharcoalDrawing","JPEG"
    }
    New-ParamCompleter -LongName print -Description $msg.print -Arguments $stringArgument
    New-ParamCompleter -LongName process -Description $msg.process -Arguments @{ Name = 'image-filter'; Type = 'File' }
    New-ParamCompleter -LongName profile -Description $msg.profile -Arguments $filenameArgument
    New-ParamCompleter -LongName quality -Description $msg.quality -Arguments $valueArgument
    New-ParamCompleter -LongName quantize -Description $msg.quantize -Arguments @{ Name = 'colorspace' }
    New-ParamCompleter -LongName quiet -Description $msg.quiet
    New-ParamCompleter -LongName radial-blur -Description $msg.radial_blur -Arguments @{ Name = 'angle' }
    New-ParamCompleter -LongName raise -Description $msg.raise -Arguments $valueArgument
    New-ParamCompleter -LongName random-threshold -Description $msg.random_threshold -Arguments @{ Name = 'low,high' }
    New-ParamCompleter -LongName range-threshold -Description $msg.range_threshold -Arguments @{ Name = 'values' }
    New-ParamCompleter -LongName red-primary -Description $msg.red_primary -Arguments @{ Name = 'point' }
    New-ParamCompleter -LongName regard-warnings -Description $msg.regard_warnings
    New-ParamCompleter -LongName region -Description $msg.region -Arguments $geometryArgument
    New-ParamCompleter -LongName remap -Description $msg.remap -Arguments $filenameArgument
    New-ParamCompleter -LongName render -Description $msg.render
    New-ParamCompleter -LongName repage -Description $msg.repage -Arguments $geometryArgument
    New-ParamCompleter -LongName resample -Description $msg.resample -Arguments $geometryArgument
    New-ParamCompleter -LongName resize -Description $msg.resize -Arguments $geometryArgument
    New-ParamCompleter -LongName respect-parentheses -Description $msg.respect_parentheses
    New-ParamCompleter -LongName reverse -Description $msg.reverse
    New-ParamCompleter -LongName roll -Description $msg.roll -Arguments $geometryArgument
    New-ParamCompleter -LongName rotate -Description $msg.rotate -Arguments @{ Name = 'degrees' }
    New-ParamCompleter -LongName sample -Description $msg.sample -Arguments $geometryArgument
    New-ParamCompleter -LongName sampling-factor -Description $msg.sampling_factor -Arguments $geometryArgument
    New-ParamCompleter -LongName scale -Description $msg.scale -Arguments $geometryArgument
    New-ParamCompleter -LongName scene -Description $msg.scene -Arguments $valueArgument
    New-ParamCompleter -LongName seed -Description $msg.seed -Arguments $valueArgument
    New-ParamCompleter -LongName segment -Description $msg.segment -Arguments @{ Name = 'values' }
    New-ParamCompleter -LongName selective-blur -Description $msg.selective_blur -Arguments $geometryArgument
    New-ParamCompleter -LongName separate -Description $msg.separate
    New-ParamCompleter -LongName sepia-tone -Description $msg.sepia_tone -Arguments @{ Name = 'threshold' }
    New-ParamCompleter -LongName set -Description $msg.set -Arguments @{ Name = 'attribute-value' }
    New-ParamCompleter -LongName shade -Description $msg.shade -Arguments @{ Name = 'degrees' }
    New-ParamCompleter -LongName shadow -Description $msg.shadow -Arguments $geometryArgument
    New-ParamCompleter -LongName sharpen -Description $msg.sharpen -Arguments $geometryArgument
    New-ParamCompleter -LongName shave -Description $msg.shave -Arguments $geometryArgument
    New-ParamCompleter -LongName shear -Description $msg.shear -Arguments $geometryArgument
    New-ParamCompleter -LongName sigmoidal-contrast -Description $msg.sigmoidal_contrast -Arguments $geometryArgument
    New-ParamCompleter -LongName silent -Description $msg.silent
    New-ParamCompleter -LongName similarity-threshold -Description $msg.similarity_threshold -Arguments $valueArgument
    New-ParamCompleter -LongName size -Description $msg.size -Arguments $geometryArgument
    New-ParamCompleter -LongName sketch -Description $msg.sketch -Arguments $geometryArgument
    New-ParamCompleter -LongName smush -Description $msg.smush -Arguments @{ Name =  'offset' }
    New-ParamCompleter -LongName snaps -Description $msg.snaps -Arguments $valueArgument
    New-ParamCompleter -LongName solarize -Description $msg.solarize -Arguments @{ Name = 'threshold' }
    New-ParamCompleter -LongName splice -Description $msg.splice -Arguments $geometryArgument
    New-ParamCompleter -LongName spread -Description $msg.spread -Arguments @{ Name = 'radius' }
    New-ParamCompleter -LongName statistic -Description $msg.statistic -Arguments $geometryArgument
    New-ParamCompleter -LongName stretch -Description $msg.stretch -Arguments @{
        Name = 'type';
        Candidates = "Any","Condensed","Expanded","ExtraCondensed","ExtraExpanded","Normal","SemiCondensed","SemiExpanded","UltraCondensed","UltraExpanded"
    }
    New-ParamCompleter -LongName strip -Description $msg.strip
    New-ParamCompleter -LongName stroke -Description $msg.stroke -Arguments $colorArgument
    New-ParamCompleter -LongName strokewidth -Description $msg.strokewidth -Arguments $valueArgument
    New-ParamCompleter -LongName style -Description $msg.style -Arguments @{
        Name = 'type';
        Candidates = "Any","Italic","Normal","Oblique"
    }
    New-ParamCompleter -LongName subimage-search -Description $msg.subimage_search
    New-ParamCompleter -LongName swap -Description $msg.swap -Arguments @{ Name = 'indexes' }
    New-ParamCompleter -LongName swirl -Description $msg.swirl -Arguments @{ Name = 'degrees' }
    New-ParamCompleter -LongName synchronize -Description $msg.synchronize
    New-ParamCompleter -LongName taint -Description $msg.taint
    New-ParamCompleter -LongName texture -Description $msg.texture -Arguments $filenameArgument
    New-ParamCompleter -LongName threshold -Description $msg.threshold -Arguments $valueArgument
    New-ParamCompleter -LongName thumbnail -Description $msg.thumbnail -Arguments $geometryArgument
    New-ParamCompleter -LongName tile -Description $msg.tile -Arguments $filenameArgument
    New-ParamCompleter -LongName tile-offset -Description $msg.tile_offset -Arguments $geometryArgument
    New-ParamCompleter -LongName tint -Description $msg.tint -Arguments $valueArgument
    New-ParamCompleter -LongName transform -Description $msg.transform
    New-ParamCompleter -LongName transparent -Description $msg.transparent -Arguments $colorArgument
    New-ParamCompleter -LongName transparent-color -Description $msg.transparent_color -Arguments $colorArgument
    New-ParamCompleter -LongName transpose -Description $msg.transpose
    New-ParamCompleter -LongName transverse -Description $msg.transverse
    New-ParamCompleter -LongName treedepth -Description $msg.treedepth -Arguments $valueArgument
    New-ParamCompleter -LongName trim -Description $msg.trim
    New-ParamCompleter -LongName type -Description $msg.type -Arguments @{
        Name = 'type';
        Candidates = "Bilevel","Grayscale","GrayscaleMatte","Palette","PaletteMatte","TrueColor","TrueColorMatte","ColorSeparation","ColorSeparationMatte","Optimize"
    }
    New-ParamCompleter -LongName undercolor -Description $msg.undercolor -Arguments $colorArgument
    New-ParamCompleter -LongName unique-colors -Description $msg.unique_colors
    New-ParamCompleter -LongName units -Description $msg.units -Arguments @{
        Name = 'type';
        Candidates = "Undefined","PixelsPerInch","PixelsPerCentimeter"
    }
    New-ParamCompleter -LongName unsharp -Description $msg.unsharp -Arguments $geometryArgument
    New-ParamCompleter -LongName update -Description $msg.update -Arguments @{ Name = 'seconds' }
    New-ParamCompleter -LongName verbose -Description $msg.verbose
    New-ParamCompleter -LongName version -Description $msg.version
    New-ParamCompleter -LongName view -Description $msg.view -Arguments $stringArgument
    New-ParamCompleter -LongName vignette -Description $msg.vignette -Arguments $geometryArgument
    New-ParamCompleter -LongName virtual-pixel -Description $msg.virtual_pixel -Arguments @{
        Name = 'method';
        Candidates = "Background","Black","Constant","Dither","Edge","Gray","HorizontalTile","HorizontalTileEdge","Mirror","Random","Tile","Transparent","VerticalTile","VerticalTileEdge","White"
    }
    New-ParamCompleter -LongName visual -Description $msg.visual -Arguments @{ Name = 'type' }
    New-ParamCompleter -LongName watermark -Description $msg.watermark -Arguments $geometryArgument
    New-ParamCompleter -LongName wave -Description $msg.wave -Arguments $geometryArgument
    New-ParamCompleter -LongName wavelet-denoise -Description $msg.wavelet_denoise -Arguments @{ Name = 'threshold' }
    New-ParamCompleter -LongName weight -Description $msg.weight -Arguments @{ Name = 'type' }
    New-ParamCompleter -LongName white-point -Description $msg.white_point -Arguments @{ Name = 'point' }
    New-ParamCompleter -LongName white-threshold -Description $msg.white_threshold -Arguments $valueArgument
    New-ParamCompleter -LongName window -Description $msg.window -Arguments @{ Name = 'id' }
    New-ParamCompleter -LongName window-group -Description $msg.window_group -Arguments @{ Name = 'id' }
)
