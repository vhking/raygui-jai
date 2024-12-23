//
// This file was auto-generated using the following command:
//
// jai generate.jai
//
    va_list :: *void;



RAYGUI_VERSION_MAJOR :: 4;
RAYGUI_VERSION_MINOR :: 0;
RAYGUI_VERSION_PATCH :: 0;
RAYGUI_VERSION :: "4.0";

RAYLIB_VERSION_MAJOR :: 5;
RAYLIB_VERSION_MINOR :: 0;
RAYLIB_VERSION_PATCH :: 0;
RAYLIB_VERSION :: "5.0";

PI :: 3.14159265358979323846;

DEG2RAD :: PI/180.0;

RAD2DEG :: 180.0/PI;

SCROLLBAR_LEFT_SIDE :: 0;
SCROLLBAR_RIGHT_SIDE :: 1;

// Vector2, 2 components
Vector2 :: struct {
    x: float; // Vector x component
    y: float; // Vector y component
}

// Vector3, 3 components
Vector3 :: struct {
    x: float; // Vector x component
    y: float; // Vector y component
    z: float; // Vector z component
}

// Vector4, 4 components
Vector4 :: struct {
    x: float; // Vector x component
    y: float; // Vector y component
    z: float; // Vector z component
    w: float; // Vector w component
}

// Quaternion, 4 components (Vector4 alias)
Quaternion :: Vector4;

// Matrix, 4x4 components, column major, OpenGL style, right-handed
Matrix :: struct {
    m0:  float; // Matrix first row (4 components)
    m4:  float; // Matrix first row (4 components)
    m8:  float; // Matrix first row (4 components)
    m12: float; // Matrix first row (4 components)
    m1:  float; // Matrix second row (4 components)
    m5:  float; // Matrix second row (4 components)
    m9:  float; // Matrix second row (4 components)
    m13: float; // Matrix second row (4 components)
    m2:  float; // Matrix third row (4 components)
    m6:  float; // Matrix third row (4 components)
    m10: float; // Matrix third row (4 components)
    m14: float; // Matrix third row (4 components)
    m3:  float; // Matrix fourth row (4 components)
    m7:  float; // Matrix fourth row (4 components)
    m11: float; // Matrix fourth row (4 components)
    m15: float; // Matrix fourth row (4 components)
}

// Color, 4 components, R8G8B8A8 (32bit)
Color :: struct {
    r: u8; // Color red value
    g: u8; // Color green value
    b: u8; // Color blue value
    a: u8; // Color alpha value
}

// Rectangle, 4 components
Rectangle :: struct {
    x:      float; // Rectangle top-left corner position x
    y:      float; // Rectangle top-left corner position y
    width:  float; // Rectangle width
    height: float; // Rectangle height
}

// Image, pixel data stored in CPU memory (RAM)
Image :: struct {
    data:    *void; // Image raw data
    width:   s32; // Image base width
    height:  s32; // Image base height
    mipmaps: s32; // Mipmap levels, 1 by default
    format:  s32; // Data format (PixelFormat type)
}

// Texture, tex data stored in GPU memory (VRAM)
Texture :: struct {
    id:      u32; // OpenGL texture id
    width:   s32; // Texture base width
    height:  s32; // Texture base height
    mipmaps: s32; // Mipmap levels, 1 by default
    format:  s32; // Data format (PixelFormat type)
}

// Texture2D, same as Texture
Texture2D :: Texture;

// TextureCubemap, same as Texture
TextureCubemap :: Texture;

// RenderTexture, fbo for texture rendering
RenderTexture :: struct {
    id:      u32; // OpenGL framebuffer object id
    texture: Texture; // Color buffer attachment texture
    depth:   Texture; // Depth buffer attachment texture
}

// RenderTexture2D, same as RenderTexture
RenderTexture2D :: RenderTexture;

// NPatchInfo, n-patch layout info
NPatchInfo :: struct {
    source: Rectangle; // Texture source rectangle
    left:   s32; // Left border offset
    top:    s32; // Top border offset
    right:  s32; // Right border offset
    bottom: s32; // Bottom border offset
    layout: s32; // Layout of the n-patch: 3x3, 1x3 or 3x1
}

// GlyphInfo, font characters glyphs info
GlyphInfo :: struct {
    value:    s32; // Character value (Unicode)
    offsetX:  s32; // Character offset X when drawing
    offsetY:  s32; // Character offset Y when drawing
    advanceX: s32; // Character advance position X
    image:    Image; // Character image data
}

// Font, font texture and GlyphInfo array data
Font :: struct {
    baseSize:     s32; // Base size (default chars height)
    glyphCount:   s32; // Number of glyph characters
    glyphPadding: s32; // Padding around the glyph characters
    texture:      Texture2D; // Texture atlas containing the glyphs
    recs:         *Rectangle; // Rectangles in texture for the glyphs
    glyphs:       *GlyphInfo; // Glyphs info data
}

// Camera, defines position/orientation in 3d space
Camera3D :: struct {
    position:   Vector3; // Camera position
    target:     Vector3; // Camera target it looks-at
    up:         Vector3; // Camera up vector (rotation over its axis)
    fovy:       float; // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    projection: s32; // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
}

Camera :: Camera3D;

// Camera2D, defines position/orientation in 2d space
Camera2D :: struct {
    offset:   Vector2; // Camera offset (displacement from target)
    target:   Vector2; // Camera target (rotation and zoom origin)
    rotation: float; // Camera rotation in degrees
    zoom:     float; // Camera zoom (scaling), should be 1.0f by default
}

// Mesh, vertex data and vao/vbo
Mesh :: struct {
    vertexCount:   s32; // Number of vertices stored in arrays
    triangleCount: s32; // Number of triangles stored (indexed or not)

    vertices:      *float; // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    texcoords:     *float; // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    texcoords2:    *float; // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    normals:       *float; // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    tangents:      *float; // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    colors:        *u8; // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    indices:       *u16; // Vertex indices (in case vertex data comes indexed)

    animVertices:  *float; // Animated vertex positions (after bones transformations)
    animNormals:   *float; // Animated normals (after bones transformations)
    boneIds:       *u8; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    boneWeights:   *float; // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    vaoId:         u32; // OpenGL Vertex Array Object id
    vboId:         *u32; // OpenGL Vertex Buffer Objects id (default vertex data)
}

// Shader
Shader :: struct {
    id:   u32; // Shader program id
    locs: *s32; // Shader locations array (RL_MAX_SHADER_LOCATIONS)
}

// MaterialMap
MaterialMap :: struct {
    texture: Texture2D; // Material map texture
    color:   Color; // Material map color
    value:   float; // Material map value
}

// Material, includes shader and maps
Material :: struct {
    shader: Shader; // Material shader
    maps:   *MaterialMap; // Material maps array (MAX_MATERIAL_MAPS)
    params: [4] float; // Material generic parameters (if required)
}

// Transform, vertex transformation data
Transform :: struct {
    translation: Vector3; // Translation
    rotation:    Quaternion; // Rotation
    scale:       Vector3; // Scale
}

// Bone, skeletal animation bone
BoneInfo :: struct {
    name:   [32] u8; // Bone name
    parent: s32; // Bone parent
}

// Model, meshes, materials and animation data
Model :: struct {
    transform:     Matrix; // Local transform matrix

    meshCount:     s32; // Number of meshes
    materialCount: s32; // Number of materials
    meshes:        *Mesh; // Meshes array
    materials:     *Material; // Materials array
    meshMaterial:  *s32; // Mesh material number

    boneCount:     s32; // Number of bones
    bones:         *BoneInfo; // Bones information (skeleton)
    bindPose:      *Transform; // Bones base transformation (pose)
}

// ModelAnimation
ModelAnimation :: struct {
    boneCount:  s32; // Number of bones
    frameCount: s32; // Number of animation frames
    bones:      *BoneInfo; // Bones information (skeleton)
    framePoses: **Transform; // Poses array by frame
    name:       [32] u8; // Animation name
}

// Ray, ray for raycasting
Ray :: struct {
    position:  Vector3; // Ray position (origin)
    direction: Vector3; // Ray direction
}

// RayCollision, ray hit information
RayCollision :: struct {
    hit:      bool; // Did the ray hit something?
    distance: float; // Distance to the nearest hit
    point:    Vector3; // Point of the nearest hit
    normal:   Vector3; // Surface normal of hit
}

// BoundingBox
BoundingBox :: struct {
    min: Vector3; // Minimum vertex box-corner
    max: Vector3; // Maximum vertex box-corner
}

// Wave, audio wave data
Wave :: struct {
    frameCount: u32; // Total number of frames (considering channels)
    sampleRate: u32; // Frequency (samples per second)
    sampleSize: u32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels:   u32; // Number of channels (1-mono, 2-stereo, ...)
    data:       *void; // Buffer data pointer
}

rAudioBuffer :: struct {}
rAudioProcessor :: struct {}

// AudioStream, custom audio stream
AudioStream :: struct {
    buffer:     *rAudioBuffer; // Pointer to internal data used by the audio system
    processor:  *rAudioProcessor; // Pointer to internal data processor, useful for audio effects

    sampleRate: u32; // Frequency (samples per second)
    sampleSize: u32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels:   u32; // Number of channels (1-mono, 2-stereo, ...)
}

// Sound
Sound :: struct {
    stream:     AudioStream; // Audio stream
    frameCount: u32; // Total number of frames (considering channels)
}

// Music, audio stream, anything longer than ~10 seconds should be streamed
Music :: struct {
    stream:     AudioStream; // Audio stream
    frameCount: u32; // Total number of frames (considering channels)
    looping:    bool; // Music looping enable

    ctxType:    s32; // Type of music context (audio filetype)
    ctxData:    *void; // Audio context data, depends on type
}

// VrDeviceInfo, Head-Mounted-Display device parameters
VrDeviceInfo :: struct {
    hResolution:            s32; // Horizontal resolution in pixels
    vResolution:            s32; // Vertical resolution in pixels
    hScreenSize:            float; // Horizontal size in meters
    vScreenSize:            float; // Vertical size in meters
    vScreenCenter:          float; // Screen center in meters
    eyeToScreenDistance:    float; // Distance between eye and display in meters
    lensSeparationDistance: float; // Lens separation distance in meters
    interpupillaryDistance: float; // IPD (distance between pupils) in meters
    lensDistortionValues:   [4] float; // Lens distortion constant parameters
    chromaAbCorrection:     [4] float; // Chromatic aberration correction parameters
}

// VrStereoConfig, VR stereo rendering configuration for simulator
VrStereoConfig :: struct {
    projection:        [2] Matrix; // VR projection matrices (per eye)
    viewOffset:        [2] Matrix; // VR view offset matrices (per eye)
    leftLensCenter:    [2] float; // VR left lens center
    rightLensCenter:   [2] float; // VR right lens center
    leftScreenCenter:  [2] float; // VR left screen center
    rightScreenCenter: [2] float; // VR right screen center
    scale:             [2] float; // VR distortion scale
    scaleIn:           [2] float; // VR distortion scale in
}

// File path list
FilePathList :: struct {
    capacity: u32; // Filepaths max entries
    count:    u32; // Filepaths entries count
    paths:    **u8; // Filepaths entries
}

// Automation event
AutomationEvent :: struct {
    frame:  u32; // Event frame
    type:   u32; // Event type (AutomationEventType)
    params: [4] s32; // Event parameters (if required)
}

// Automation event list
AutomationEventList :: struct {
    capacity: u32; // Events max entries (MAX_AUTOMATION_EVENTS)
    count:    u32; // Events entries count
    events:   *AutomationEvent; // Events entries
}

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
ConfigFlags :: enum u32 {
    FLAG_VSYNC_HINT               :: 64;
    FLAG_FULLSCREEN_MODE          :: 2;
    FLAG_WINDOW_RESIZABLE         :: 4;
    FLAG_WINDOW_UNDECORATED       :: 8;
    FLAG_WINDOW_HIDDEN            :: 128;
    FLAG_WINDOW_MINIMIZED         :: 512;
    FLAG_WINDOW_MAXIMIZED         :: 1024;
    FLAG_WINDOW_UNFOCUSED         :: 2048;
    FLAG_WINDOW_TOPMOST           :: 4096;
    FLAG_WINDOW_ALWAYS_RUN        :: 256;
    FLAG_WINDOW_TRANSPARENT       :: 16;
    FLAG_WINDOW_HIGHDPI           :: 8192;
    FLAG_WINDOW_MOUSE_PASSTHROUGH :: 16384;
    FLAG_BORDERLESS_WINDOWED_MODE :: 32768;
    FLAG_MSAA_4X_HINT             :: 32;
    FLAG_INTERLACED_HINT          :: 65536;
}

// Trace log level
// NOTE: Organized by priority level
TraceLogLevel :: enum u32 {
    LOG_ALL     :: 0;
    LOG_TRACE   :: 1;
    LOG_DEBUG   :: 2;
    LOG_INFO    :: 3;
    LOG_WARNING :: 4;
    LOG_ERROR   :: 5;
    LOG_FATAL   :: 6;
    LOG_NONE    :: 7;
}

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
KeyboardKey :: enum u32 {
    KEY_NULL          :: 0;

    KEY_APOSTROPHE    :: 39;
    KEY_COMMA         :: 44;
    KEY_MINUS         :: 45;
    KEY_PERIOD        :: 46;
    KEY_SLASH         :: 47;
    KEY_ZERO          :: 48;
    KEY_ONE           :: 49;
    KEY_TWO           :: 50;
    KEY_THREE         :: 51;
    KEY_FOUR          :: 52;
    KEY_FIVE          :: 53;
    KEY_SIX           :: 54;
    KEY_SEVEN         :: 55;
    KEY_EIGHT         :: 56;
    KEY_NINE          :: 57;
    KEY_SEMICOLON     :: 59;
    KEY_EQUAL         :: 61;
    KEY_A             :: 65;
    KEY_B             :: 66;
    KEY_C             :: 67;
    KEY_D             :: 68;
    KEY_E             :: 69;
    KEY_F             :: 70;
    KEY_G             :: 71;
    KEY_H             :: 72;
    KEY_I             :: 73;
    KEY_J             :: 74;
    KEY_K             :: 75;
    KEY_L             :: 76;
    KEY_M             :: 77;
    KEY_N             :: 78;
    KEY_O             :: 79;
    KEY_P             :: 80;
    KEY_Q             :: 81;
    KEY_R             :: 82;
    KEY_S             :: 83;
    KEY_T             :: 84;
    KEY_U             :: 85;
    KEY_V             :: 86;
    KEY_W             :: 87;
    KEY_X             :: 88;
    KEY_Y             :: 89;
    KEY_Z             :: 90;
    KEY_LEFT_BRACKET  :: 91;
    KEY_BACKSLASH     :: 92;
    KEY_RIGHT_BRACKET :: 93;
    KEY_GRAVE         :: 96;

    KEY_SPACE         :: 32;
    KEY_ESCAPE        :: 256;
    KEY_ENTER         :: 257;
    KEY_TAB           :: 258;
    KEY_BACKSPACE     :: 259;
    KEY_INSERT        :: 260;
    KEY_DELETE        :: 261;
    KEY_RIGHT         :: 262;
    KEY_LEFT          :: 263;
    KEY_DOWN          :: 264;
    KEY_UP            :: 265;
    KEY_PAGE_UP       :: 266;
    KEY_PAGE_DOWN     :: 267;
    KEY_HOME          :: 268;
    KEY_END           :: 269;
    KEY_CAPS_LOCK     :: 280;
    KEY_SCROLL_LOCK   :: 281;
    KEY_NUM_LOCK      :: 282;
    KEY_PRINT_SCREEN  :: 283;
    KEY_PAUSE         :: 284;
    KEY_F1            :: 290;
    KEY_F2            :: 291;
    KEY_F3            :: 292;
    KEY_F4            :: 293;
    KEY_F5            :: 294;
    KEY_F6            :: 295;
    KEY_F7            :: 296;
    KEY_F8            :: 297;
    KEY_F9            :: 298;
    KEY_F10           :: 299;
    KEY_F11           :: 300;
    KEY_F12           :: 301;
    KEY_LEFT_SHIFT    :: 340;
    KEY_LEFT_CONTROL  :: 341;
    KEY_LEFT_ALT      :: 342;
    KEY_LEFT_SUPER    :: 343;
    KEY_RIGHT_SHIFT   :: 344;
    KEY_RIGHT_CONTROL :: 345;
    KEY_RIGHT_ALT     :: 346;
    KEY_RIGHT_SUPER   :: 347;
    KEY_KB_MENU       :: 348;

    KEY_KP_0          :: 320;
    KEY_KP_1          :: 321;
    KEY_KP_2          :: 322;
    KEY_KP_3          :: 323;
    KEY_KP_4          :: 324;
    KEY_KP_5          :: 325;
    KEY_KP_6          :: 326;
    KEY_KP_7          :: 327;
    KEY_KP_8          :: 328;
    KEY_KP_9          :: 329;
    KEY_KP_DECIMAL    :: 330;
    KEY_KP_DIVIDE     :: 331;
    KEY_KP_MULTIPLY   :: 332;
    KEY_KP_SUBTRACT   :: 333;
    KEY_KP_ADD        :: 334;
    KEY_KP_ENTER      :: 335;
    KEY_KP_EQUAL      :: 336;

    KEY_BACK          :: 4;
    KEY_MENU          :: 82;
    KEY_VOLUME_UP     :: 24;
    KEY_VOLUME_DOWN   :: 25;
}

// Mouse buttons
MouseButton :: enum u32 {
    MOUSE_BUTTON_LEFT    :: 0;
    MOUSE_BUTTON_RIGHT   :: 1;
    MOUSE_BUTTON_MIDDLE  :: 2;
    MOUSE_BUTTON_SIDE    :: 3;
    MOUSE_BUTTON_EXTRA   :: 4;
    MOUSE_BUTTON_FORWARD :: 5;
    MOUSE_BUTTON_BACK    :: 6;
}

// Mouse cursor
MouseCursor :: enum u32 {
    MOUSE_CURSOR_DEFAULT       :: 0;
    MOUSE_CURSOR_ARROW         :: 1;
    MOUSE_CURSOR_IBEAM         :: 2;
    MOUSE_CURSOR_CROSSHAIR     :: 3;
    MOUSE_CURSOR_POINTING_HAND :: 4;
    MOUSE_CURSOR_RESIZE_EW     :: 5;
    MOUSE_CURSOR_RESIZE_NS     :: 6;
    MOUSE_CURSOR_RESIZE_NWSE   :: 7;
    MOUSE_CURSOR_RESIZE_NESW   :: 8;
    MOUSE_CURSOR_RESIZE_ALL    :: 9;
    MOUSE_CURSOR_NOT_ALLOWED   :: 10;
}

// Gamepad buttons
GamepadButton :: enum u32 {
    GAMEPAD_BUTTON_UNKNOWN          :: 0;
    GAMEPAD_BUTTON_LEFT_FACE_UP     :: 1;
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT  :: 2;
    GAMEPAD_BUTTON_LEFT_FACE_DOWN   :: 3;
    GAMEPAD_BUTTON_LEFT_FACE_LEFT   :: 4;
    GAMEPAD_BUTTON_RIGHT_FACE_UP    :: 5;
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT :: 6;
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN  :: 7;
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT  :: 8;
    GAMEPAD_BUTTON_LEFT_TRIGGER_1   :: 9;
    GAMEPAD_BUTTON_LEFT_TRIGGER_2   :: 10;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1  :: 11;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2  :: 12;
    GAMEPAD_BUTTON_MIDDLE_LEFT      :: 13;
    GAMEPAD_BUTTON_MIDDLE           :: 14;
    GAMEPAD_BUTTON_MIDDLE_RIGHT     :: 15;
    GAMEPAD_BUTTON_LEFT_THUMB       :: 16;
    GAMEPAD_BUTTON_RIGHT_THUMB      :: 17;
}

// Gamepad axis
GamepadAxis :: enum u32 {
    GAMEPAD_AXIS_LEFT_X        :: 0;
    GAMEPAD_AXIS_LEFT_Y        :: 1;
    GAMEPAD_AXIS_RIGHT_X       :: 2;
    GAMEPAD_AXIS_RIGHT_Y       :: 3;
    GAMEPAD_AXIS_LEFT_TRIGGER  :: 4;
    GAMEPAD_AXIS_RIGHT_TRIGGER :: 5;
}

// Material map index
MaterialMapIndex :: enum u32 {
    MATERIAL_MAP_ALBEDO     :: 0;
    MATERIAL_MAP_METALNESS  :: 1;
    MATERIAL_MAP_NORMAL     :: 2;
    MATERIAL_MAP_ROUGHNESS  :: 3;
    MATERIAL_MAP_OCCLUSION  :: 4;
    MATERIAL_MAP_EMISSION   :: 5;
    MATERIAL_MAP_HEIGHT     :: 6;
    MATERIAL_MAP_CUBEMAP    :: 7;
    MATERIAL_MAP_IRRADIANCE :: 8;
    MATERIAL_MAP_PREFILTER  :: 9;
    MATERIAL_MAP_BRDF       :: 10;
}

// Shader location index
ShaderLocationIndex :: enum u32 {
    SHADER_LOC_VERTEX_POSITION   :: 0;
    SHADER_LOC_VERTEX_TEXCOORD01 :: 1;
    SHADER_LOC_VERTEX_TEXCOORD02 :: 2;
    SHADER_LOC_VERTEX_NORMAL     :: 3;
    SHADER_LOC_VERTEX_TANGENT    :: 4;
    SHADER_LOC_VERTEX_COLOR      :: 5;
    SHADER_LOC_MATRIX_MVP        :: 6;
    SHADER_LOC_MATRIX_VIEW       :: 7;
    SHADER_LOC_MATRIX_PROJECTION :: 8;
    SHADER_LOC_MATRIX_MODEL      :: 9;
    SHADER_LOC_MATRIX_NORMAL     :: 10;
    SHADER_LOC_VECTOR_VIEW       :: 11;
    SHADER_LOC_COLOR_DIFFUSE     :: 12;
    SHADER_LOC_COLOR_SPECULAR    :: 13;
    SHADER_LOC_COLOR_AMBIENT     :: 14;
    SHADER_LOC_MAP_ALBEDO        :: 15;
    SHADER_LOC_MAP_METALNESS     :: 16;
    SHADER_LOC_MAP_NORMAL        :: 17;
    SHADER_LOC_MAP_ROUGHNESS     :: 18;
    SHADER_LOC_MAP_OCCLUSION     :: 19;
    SHADER_LOC_MAP_EMISSION      :: 20;
    SHADER_LOC_MAP_HEIGHT        :: 21;
    SHADER_LOC_MAP_CUBEMAP       :: 22;
    SHADER_LOC_MAP_IRRADIANCE    :: 23;
    SHADER_LOC_MAP_PREFILTER     :: 24;
    SHADER_LOC_MAP_BRDF          :: 25;
}

// Shader uniform data type
ShaderUniformDataType :: enum u32 {
    SHADER_UNIFORM_FLOAT     :: 0;
    SHADER_UNIFORM_VEC2      :: 1;
    SHADER_UNIFORM_VEC3      :: 2;
    SHADER_UNIFORM_VEC4      :: 3;
    SHADER_UNIFORM_INT       :: 4;
    SHADER_UNIFORM_IVEC2     :: 5;
    SHADER_UNIFORM_IVEC3     :: 6;
    SHADER_UNIFORM_IVEC4     :: 7;
    SHADER_UNIFORM_SAMPLER2D :: 8;
}

// Shader attribute data types
ShaderAttributeDataType :: enum u32 {
    SHADER_ATTRIB_FLOAT :: 0;
    SHADER_ATTRIB_VEC2  :: 1;
    SHADER_ATTRIB_VEC3  :: 2;
    SHADER_ATTRIB_VEC4  :: 3;
}

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
PixelFormat :: enum u32 {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    :: 1;
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   :: 2;
    PIXELFORMAT_UNCOMPRESSED_R5G6B5       :: 3;
    PIXELFORMAT_UNCOMPRESSED_R8G8B8       :: 4;
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     :: 5;
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     :: 6;
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     :: 7;
    PIXELFORMAT_UNCOMPRESSED_R32          :: 8;
    PIXELFORMAT_UNCOMPRESSED_R32G32B32    :: 9;
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 :: 10;
    PIXELFORMAT_UNCOMPRESSED_R16          :: 11;
    PIXELFORMAT_UNCOMPRESSED_R16G16B16    :: 12;
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 :: 13;
    PIXELFORMAT_COMPRESSED_DXT1_RGB       :: 14;
    PIXELFORMAT_COMPRESSED_DXT1_RGBA      :: 15;
    PIXELFORMAT_COMPRESSED_DXT3_RGBA      :: 16;
    PIXELFORMAT_COMPRESSED_DXT5_RGBA      :: 17;
    PIXELFORMAT_COMPRESSED_ETC1_RGB       :: 18;
    PIXELFORMAT_COMPRESSED_ETC2_RGB       :: 19;
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  :: 20;
    PIXELFORMAT_COMPRESSED_PVRT_RGB       :: 21;
    PIXELFORMAT_COMPRESSED_PVRT_RGBA      :: 22;
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  :: 23;
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  :: 24;
}

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
TextureFilter :: enum u32 {
    TEXTURE_FILTER_POINT           :: 0;
    TEXTURE_FILTER_BILINEAR        :: 1;
    TEXTURE_FILTER_TRILINEAR       :: 2;
    TEXTURE_FILTER_ANISOTROPIC_4X  :: 3;
    TEXTURE_FILTER_ANISOTROPIC_8X  :: 4;
    TEXTURE_FILTER_ANISOTROPIC_16X :: 5;
}

// Texture parameters: wrap mode
TextureWrap :: enum u32 {
    TEXTURE_WRAP_REPEAT        :: 0;
    TEXTURE_WRAP_CLAMP         :: 1;
    TEXTURE_WRAP_MIRROR_REPEAT :: 2;
    TEXTURE_WRAP_MIRROR_CLAMP  :: 3;
}

// Cubemap layouts
CubemapLayout :: enum u32 {
    CUBEMAP_LAYOUT_AUTO_DETECT         :: 0;
    CUBEMAP_LAYOUT_LINE_VERTICAL       :: 1;
    CUBEMAP_LAYOUT_LINE_HORIZONTAL     :: 2;
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR :: 3;
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE :: 4;
    CUBEMAP_LAYOUT_PANORAMA            :: 5;
}

// Font type, defines generation method
FontType :: enum u32 {
    FONT_DEFAULT :: 0;
    FONT_BITMAP  :: 1;
    FONT_SDF     :: 2;
}

// Color blending modes (pre-defined)
BlendMode :: enum u32 {
    BLEND_ALPHA             :: 0;
    BLEND_ADDITIVE          :: 1;
    BLEND_MULTIPLIED        :: 2;
    BLEND_ADD_COLORS        :: 3;
    BLEND_SUBTRACT_COLORS   :: 4;
    BLEND_ALPHA_PREMULTIPLY :: 5;
    BLEND_CUSTOM            :: 6;
    BLEND_CUSTOM_SEPARATE   :: 7;
}

// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
Gesture :: enum u32 {
    GESTURE_NONE        :: 0;
    GESTURE_TAP         :: 1;
    GESTURE_DOUBLETAP   :: 2;
    GESTURE_HOLD        :: 4;
    GESTURE_DRAG        :: 8;
    GESTURE_SWIPE_RIGHT :: 16;
    GESTURE_SWIPE_LEFT  :: 32;
    GESTURE_SWIPE_UP    :: 64;
    GESTURE_SWIPE_DOWN  :: 128;
    GESTURE_PINCH_IN    :: 256;
    GESTURE_PINCH_OUT   :: 512;
}

// Camera system modes
CameraMode :: enum u32 {
    CAMERA_CUSTOM       :: 0;
    CAMERA_FREE         :: 1;
    CAMERA_ORBITAL      :: 2;
    CAMERA_FIRST_PERSON :: 3;
    CAMERA_THIRD_PERSON :: 4;
}

// Camera projection
CameraProjection :: enum u32 {
    CAMERA_PERSPECTIVE  :: 0;
    CAMERA_ORTHOGRAPHIC :: 1;
}

// N-patch layout
NPatchLayout :: enum u32 {
    NPATCH_NINE_PATCH             :: 0;
    NPATCH_THREE_PATCH_VERTICAL   :: 1;
    NPATCH_THREE_PATCH_HORIZONTAL :: 2;
}

// Callbacks to hook some internal functions
// WARNING: These callbacks are intended for advance users
TraceLogCallback :: *void /* function type contained C va_list argument */;
LoadFileDataCallback :: #type (fileName: *u8, dataSize: *s32) -> *u8 #c_call;
SaveFileDataCallback :: #type (fileName: *u8, data: *void, dataSize: s32) -> bool #c_call;
LoadFileTextCallback :: #type (fileName: *u8) -> *u8 #c_call;
SaveFileTextCallback :: #type (fileName: *u8, text: *u8) -> bool #c_call;

// Window-related functions
InitWindow :: (width: s32, height: s32, title: *u8) -> void #foreign raygui;
CloseWindow :: () -> void #foreign raygui;
WindowShouldClose :: () -> bool #foreign raygui;
IsWindowReady :: () -> bool #foreign raygui;
IsWindowFullscreen :: () -> bool #foreign raygui;
IsWindowHidden :: () -> bool #foreign raygui;
IsWindowMinimized :: () -> bool #foreign raygui;
IsWindowMaximized :: () -> bool #foreign raygui;
IsWindowFocused :: () -> bool #foreign raygui;
IsWindowResized :: () -> bool #foreign raygui;
IsWindowState :: (flag: u32) -> bool #foreign raygui;
SetWindowState :: (flags: u32) -> void #foreign raygui;
ClearWindowState :: (flags: u32) -> void #foreign raygui;
ToggleFullscreen :: () -> void #foreign raygui;
ToggleBorderlessWindowed :: () -> void #foreign raygui;
MaximizeWindow :: () -> void #foreign raygui;
MinimizeWindow :: () -> void #foreign raygui;
RestoreWindow :: () -> void #foreign raygui;
SetWindowIcon :: (image: Image) -> void #foreign raygui;
SetWindowIcons :: (images: *Image, count: s32) -> void #foreign raygui;
SetWindowTitle :: (title: *u8) -> void #foreign raygui;
SetWindowPosition :: (x: s32, y: s32) -> void #foreign raygui;
SetWindowMonitor :: (monitor: s32) -> void #foreign raygui;
SetWindowMinSize :: (width: s32, height: s32) -> void #foreign raygui;
SetWindowMaxSize :: (width: s32, height: s32) -> void #foreign raygui;
SetWindowSize :: (width: s32, height: s32) -> void #foreign raygui;
SetWindowOpacity :: (opacity: float) -> void #foreign raygui;
SetWindowFocused :: () -> void #foreign raygui;
GetWindowHandle :: () -> *void #foreign raygui;
GetScreenWidth :: () -> s32 #foreign raygui;
GetScreenHeight :: () -> s32 #foreign raygui;
GetRenderWidth :: () -> s32 #foreign raygui;
GetRenderHeight :: () -> s32 #foreign raygui;
GetMonitorCount :: () -> s32 #foreign raygui;
GetCurrentMonitor :: () -> s32 #foreign raygui;
GetMonitorPosition :: (monitor: s32) -> Vector2 #foreign raygui;
GetMonitorWidth :: (monitor: s32) -> s32 #foreign raygui;
GetMonitorHeight :: (monitor: s32) -> s32 #foreign raygui;
GetMonitorPhysicalWidth :: (monitor: s32) -> s32 #foreign raygui;
GetMonitorPhysicalHeight :: (monitor: s32) -> s32 #foreign raygui;
GetMonitorRefreshRate :: (monitor: s32) -> s32 #foreign raygui;
GetWindowPosition :: () -> Vector2 #foreign raygui;
GetWindowScaleDPI :: () -> Vector2 #foreign raygui;
GetMonitorName :: (monitor: s32) -> *u8 #foreign raygui;
SetClipboardText :: (text: *u8) -> void #foreign raygui;
GetClipboardText :: () -> *u8 #foreign raygui;
EnableEventWaiting :: () -> void #foreign raygui;
DisableEventWaiting :: () -> void #foreign raygui;

// Cursor-related functions
ShowCursor :: () -> void #foreign raygui;
HideCursor :: () -> void #foreign raygui;
IsCursorHidden :: () -> bool #foreign raygui;
EnableCursor :: () -> void #foreign raygui;
DisableCursor :: () -> void #foreign raygui;
IsCursorOnScreen :: () -> bool #foreign raygui;

// Drawing-related functions
ClearBackground :: (color: Color) -> void #foreign raygui;
BeginDrawing :: () -> void #foreign raygui;
EndDrawing :: () -> void #foreign raygui;
BeginMode2D :: (camera: Camera2D) -> void #foreign raygui;
EndMode2D :: () -> void #foreign raygui;
BeginMode3D :: (camera: Camera3D) -> void #foreign raygui;
EndMode3D :: () -> void #foreign raygui;
BeginTextureMode :: (target: RenderTexture2D) -> void #foreign raygui;
EndTextureMode :: () -> void #foreign raygui;
BeginShaderMode :: (shader: Shader) -> void #foreign raygui;
EndShaderMode :: () -> void #foreign raygui;
BeginBlendMode :: (mode: s32) -> void #foreign raygui;
EndBlendMode :: () -> void #foreign raygui;
BeginScissorMode :: (x: s32, y: s32, width: s32, height: s32) -> void #foreign raygui;
EndScissorMode :: () -> void #foreign raygui;
BeginVrStereoMode :: (config: VrStereoConfig) -> void #foreign raygui;
EndVrStereoMode :: () -> void #foreign raygui;

// VR stereo config functions for VR simulator
LoadVrStereoConfig :: (device: VrDeviceInfo) -> VrStereoConfig #foreign raygui;
UnloadVrStereoConfig :: (config: VrStereoConfig) -> void #foreign raygui;

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
LoadShader :: (vsFileName: *u8, fsFileName: *u8) -> Shader #foreign raygui;
LoadShaderFromMemory :: (vsCode: *u8, fsCode: *u8) -> Shader #foreign raygui;
IsShaderReady :: (shader: Shader) -> bool #foreign raygui;
GetShaderLocation :: (shader: Shader, uniformName: *u8) -> s32 #foreign raygui;
GetShaderLocationAttrib :: (shader: Shader, attribName: *u8) -> s32 #foreign raygui;
SetShaderValue :: (shader: Shader, locIndex: s32, value: *void, uniformType: s32) -> void #foreign raygui;
SetShaderValueV :: (shader: Shader, locIndex: s32, value: *void, uniformType: s32, count: s32) -> void #foreign raygui;
SetShaderValueMatrix :: (shader: Shader, locIndex: s32, mat: Matrix) -> void #foreign raygui;
SetShaderValueTexture :: (shader: Shader, locIndex: s32, texture: Texture2D) -> void #foreign raygui;
UnloadShader :: (shader: Shader) -> void #foreign raygui;

// Screen-space-related functions
GetMouseRay :: (mousePosition: Vector2, camera: Camera) -> Ray #foreign raygui;
GetCameraMatrix :: (camera: Camera) -> Matrix #foreign raygui;
GetCameraMatrix2D :: (camera: Camera2D) -> Matrix #foreign raygui;
GetWorldToScreen :: (position: Vector3, camera: Camera) -> Vector2 #foreign raygui;
GetScreenToWorld2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raygui;
GetWorldToScreenEx :: (position: Vector3, camera: Camera, width: s32, height: s32) -> Vector2 #foreign raygui;
GetWorldToScreen2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raygui;

// Timing-related functions
SetTargetFPS :: (fps: s32) -> void #foreign raygui;
GetFrameTime :: () -> float #foreign raygui;
GetTime :: () -> float64 #foreign raygui;
GetFPS :: () -> s32 #foreign raygui;

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
SwapScreenBuffer :: () -> void #foreign raygui;
PollInputEvents :: () -> void #foreign raygui;
WaitTime :: (seconds: float64) -> void #foreign raygui;

// Random values generation functions
SetRandomSeed :: (seed: u32) -> void #foreign raygui;
GetRandomValue :: (min: s32, max: s32) -> s32 #foreign raygui;
LoadRandomSequence :: (count: u32, min: s32, max: s32) -> *s32 #foreign raygui;
UnloadRandomSequence :: (sequence: *s32) -> void #foreign raygui;

// Misc. functions
TakeScreenshot :: (fileName: *u8) -> void #foreign raygui;
SetConfigFlags :: (flags: u32) -> void #foreign raygui;
OpenURL :: (url: *u8) -> void #foreign raygui;

// NOTE: Following functions implemented in module [utils]
//------------------------------------------------------------------
TraceLog_CFormat :: (logLevel: s32, text: *u8, __args: ..Any) -> void #foreign raygui "TraceLog";
TraceLog :: (logLevel: s32, text: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, text, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    TraceLog_CFormat(logLevel, "%s", formatted_text.data);
} @PrintLike
SetTraceLogLevel :: (logLevel: s32) -> void #foreign raygui;
MemAlloc :: (size: u32) -> *void #foreign raygui;
MemRealloc :: (ptr: *void, size: u32) -> *void #foreign raygui;
MemFree :: (ptr: *void) -> void #foreign raygui;

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users
SetTraceLogCallback :: (callback: TraceLogCallback) -> void #foreign raygui;
SetLoadFileDataCallback :: (callback: LoadFileDataCallback) -> void #foreign raygui;
SetSaveFileDataCallback :: (callback: SaveFileDataCallback) -> void #foreign raygui;
SetLoadFileTextCallback :: (callback: LoadFileTextCallback) -> void #foreign raygui;
SetSaveFileTextCallback :: (callback: SaveFileTextCallback) -> void #foreign raygui;

// Files management functions
LoadFileData :: (fileName: *u8, dataSize: *s32) -> *u8 #foreign raygui;
UnloadFileData :: (data: *u8) -> void #foreign raygui;
SaveFileData :: (fileName: *u8, data: *void, dataSize: s32) -> bool #foreign raygui;
ExportDataAsCode :: (data: *u8, dataSize: s32, fileName: *u8) -> bool #foreign raygui;
LoadFileText :: (fileName: *u8) -> *u8 #foreign raygui;
UnloadFileText :: (text: *u8) -> void #foreign raygui;
SaveFileText :: (fileName: *u8, text: *u8) -> bool #foreign raygui;

// File system functions
FileExists :: (fileName: *u8) -> bool #foreign raygui;
DirectoryExists :: (dirPath: *u8) -> bool #foreign raygui;
IsFileExtension :: (fileName: *u8, ext: *u8) -> bool #foreign raygui;
GetFileLength :: (fileName: *u8) -> s32 #foreign raygui;
GetFileExtension :: (fileName: *u8) -> *u8 #foreign raygui;
GetFileName :: (filePath: *u8) -> *u8 #foreign raygui;
GetFileNameWithoutExt :: (filePath: *u8) -> *u8 #foreign raygui;
GetDirectoryPath :: (filePath: *u8) -> *u8 #foreign raygui;
GetPrevDirectoryPath :: (dirPath: *u8) -> *u8 #foreign raygui;
GetWorkingDirectory :: () -> *u8 #foreign raygui;
GetApplicationDirectory :: () -> *u8 #foreign raygui;
ChangeDirectory :: (dir: *u8) -> bool #foreign raygui;
IsPathFile :: (path: *u8) -> bool #foreign raygui;
LoadDirectoryFiles :: (dirPath: *u8) -> FilePathList #foreign raygui;
LoadDirectoryFilesEx :: (basePath: *u8, filter: *u8, scanSubdirs: bool) -> FilePathList #foreign raygui;
UnloadDirectoryFiles :: (files: FilePathList) -> void #foreign raygui;
IsFileDropped :: () -> bool #foreign raygui;
LoadDroppedFiles :: () -> FilePathList #foreign raygui;
UnloadDroppedFiles :: (files: FilePathList) -> void #foreign raygui;
GetFileModTime :: (fileName: *u8) -> s64 #foreign raygui;

// Compression/Encoding functionality
CompressData :: (data: *u8, dataSize: s32, compDataSize: *s32) -> *u8 #foreign raygui;
DecompressData :: (compData: *u8, compDataSize: s32, dataSize: *s32) -> *u8 #foreign raygui;
EncodeDataBase64 :: (data: *u8, dataSize: s32, outputSize: *s32) -> *u8 #foreign raygui;
DecodeDataBase64 :: (data: *u8, outputSize: *s32) -> *u8 #foreign raygui;

// Automation events functionality
LoadAutomationEventList :: (fileName: *u8) -> AutomationEventList #foreign raygui;
UnloadAutomationEventList :: (list: *AutomationEventList) -> void #foreign raygui;
ExportAutomationEventList :: (list: AutomationEventList, fileName: *u8) -> bool #foreign raygui;
SetAutomationEventList :: (list: *AutomationEventList) -> void #foreign raygui;
SetAutomationEventBaseFrame :: (frame: s32) -> void #foreign raygui;
StartAutomationEventRecording :: () -> void #foreign raygui;
StopAutomationEventRecording :: () -> void #foreign raygui;
PlayAutomationEvent :: (event: AutomationEvent) -> void #foreign raygui;

// Input-related functions: keyboard
IsKeyPressed :: (key: s32) -> bool #foreign raygui;
IsKeyPressedRepeat :: (key: s32) -> bool #foreign raygui;
IsKeyDown :: (key: s32) -> bool #foreign raygui;
IsKeyReleased :: (key: s32) -> bool #foreign raygui;
IsKeyUp :: (key: s32) -> bool #foreign raygui;
GetKeyPressed :: () -> s32 #foreign raygui;
GetCharPressed :: () -> s32 #foreign raygui;
SetExitKey :: (key: s32) -> void #foreign raygui;

// Input-related functions: gamepads
IsGamepadAvailable :: (gamepad: s32) -> bool #foreign raygui;
GetGamepadName :: (gamepad: s32) -> *u8 #foreign raygui;
IsGamepadButtonPressed :: (gamepad: s32, button: s32) -> bool #foreign raygui;
IsGamepadButtonDown :: (gamepad: s32, button: s32) -> bool #foreign raygui;
IsGamepadButtonReleased :: (gamepad: s32, button: s32) -> bool #foreign raygui;
IsGamepadButtonUp :: (gamepad: s32, button: s32) -> bool #foreign raygui;
GetGamepadButtonPressed :: () -> s32 #foreign raygui;
GetGamepadAxisCount :: (gamepad: s32) -> s32 #foreign raygui;
GetGamepadAxisMovement :: (gamepad: s32, axis: s32) -> float #foreign raygui;
SetGamepadMappings :: (mappings: *u8) -> s32 #foreign raygui;

// Input-related functions: mouse
IsMouseButtonPressed :: (button: s32) -> bool #foreign raygui;
IsMouseButtonDown :: (button: s32) -> bool #foreign raygui;
IsMouseButtonReleased :: (button: s32) -> bool #foreign raygui;
IsMouseButtonUp :: (button: s32) -> bool #foreign raygui;
GetMouseX :: () -> s32 #foreign raygui;
GetMouseY :: () -> s32 #foreign raygui;
GetMousePosition :: () -> Vector2 #foreign raygui;
GetMouseDelta :: () -> Vector2 #foreign raygui;
SetMousePosition :: (x: s32, y: s32) -> void #foreign raygui;
SetMouseOffset :: (offsetX: s32, offsetY: s32) -> void #foreign raygui;
SetMouseScale :: (scaleX: float, scaleY: float) -> void #foreign raygui;
GetMouseWheelMove :: () -> float #foreign raygui;
GetMouseWheelMoveV :: () -> Vector2 #foreign raygui;
SetMouseCursor :: (cursor: s32) -> void #foreign raygui;

// Input-related functions: touch
GetTouchX :: () -> s32 #foreign raygui;
GetTouchY :: () -> s32 #foreign raygui;
GetTouchPosition :: (index: s32) -> Vector2 #foreign raygui;
GetTouchPointId :: (index: s32) -> s32 #foreign raygui;
GetTouchPointCount :: () -> s32 #foreign raygui;

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------
SetGesturesEnabled :: (flags: u32) -> void #foreign raygui;
IsGestureDetected :: (gesture: u32) -> bool #foreign raygui;
GetGestureDetected :: () -> s32 #foreign raygui;
GetGestureHoldDuration :: () -> float #foreign raygui;
GetGestureDragVector :: () -> Vector2 #foreign raygui;
GetGestureDragAngle :: () -> float #foreign raygui;
GetGesturePinchVector :: () -> Vector2 #foreign raygui;
GetGesturePinchAngle :: () -> float #foreign raygui;

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------
UpdateCamera :: (camera: *Camera, mode: s32) -> void #foreign raygui;
UpdateCameraPro :: (camera: *Camera, movement: Vector3, rotation: Vector3, zoom: float) -> void #foreign raygui;

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------
// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
SetShapesTexture :: (texture: Texture2D, source: Rectangle) -> void #foreign raygui;

// Basic shapes drawing functions
DrawPixel :: (posX: s32, posY: s32, color: Color) -> void #foreign raygui;
DrawPixelV :: (position: Vector2, color: Color) -> void #foreign raygui;
DrawLine :: (startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) -> void #foreign raygui;
DrawLineV :: (startPos: Vector2, endPos: Vector2, color: Color) -> void #foreign raygui;
DrawLineEx :: (startPos: Vector2, endPos: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawLineStrip :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raygui;
DrawLineBezier :: (startPos: Vector2, endPos: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawCircle :: (centerX: s32, centerY: s32, radius: float, color: Color) -> void #foreign raygui;
DrawCircleSector :: (center: Vector2, radius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raygui;
DrawCircleSectorLines :: (center: Vector2, radius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raygui;
DrawCircleGradient :: (centerX: s32, centerY: s32, radius: float, color1: Color, color2: Color) -> void #foreign raygui;
DrawCircleV :: (center: Vector2, radius: float, color: Color) -> void #foreign raygui;
DrawCircleLines :: (centerX: s32, centerY: s32, radius: float, color: Color) -> void #foreign raygui;
DrawCircleLinesV :: (center: Vector2, radius: float, color: Color) -> void #foreign raygui;
DrawEllipse :: (centerX: s32, centerY: s32, radiusH: float, radiusV: float, color: Color) -> void #foreign raygui;
DrawEllipseLines :: (centerX: s32, centerY: s32, radiusH: float, radiusV: float, color: Color) -> void #foreign raygui;
DrawRing :: (center: Vector2, innerRadius: float, outerRadius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raygui;
DrawRingLines :: (center: Vector2, innerRadius: float, outerRadius: float, startAngle: float, endAngle: float, segments: s32, color: Color) -> void #foreign raygui;
DrawRectangle :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raygui;
DrawRectangleV :: (position: Vector2, size: Vector2, color: Color) -> void #foreign raygui;
DrawRectangleRec :: (rec: Rectangle, color: Color) -> void #foreign raygui;
DrawRectanglePro :: (rec: Rectangle, origin: Vector2, rotation: float, color: Color) -> void #foreign raygui;
DrawRectangleGradientV :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) -> void #foreign raygui;
DrawRectangleGradientH :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) -> void #foreign raygui;
DrawRectangleGradientEx :: (rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) -> void #foreign raygui;
DrawRectangleLines :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raygui;
DrawRectangleLinesEx :: (rec: Rectangle, lineThick: float, color: Color) -> void #foreign raygui;
DrawRectangleRounded :: (rec: Rectangle, roundness: float, segments: s32, color: Color) -> void #foreign raygui;
DrawRectangleRoundedLines :: (rec: Rectangle, roundness: float, segments: s32, lineThick: float, color: Color) -> void #foreign raygui;
DrawTriangle :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) -> void #foreign raygui;
DrawTriangleLines :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) -> void #foreign raygui;
DrawTriangleFan :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raygui;
DrawTriangleStrip :: (points: *Vector2, pointCount: s32, color: Color) -> void #foreign raygui;
DrawPoly :: (center: Vector2, sides: s32, radius: float, rotation: float, color: Color) -> void #foreign raygui;
DrawPolyLines :: (center: Vector2, sides: s32, radius: float, rotation: float, color: Color) -> void #foreign raygui;
DrawPolyLinesEx :: (center: Vector2, sides: s32, radius: float, rotation: float, lineThick: float, color: Color) -> void #foreign raygui;

// Splines drawing functions
DrawSplineLinear :: (points: *Vector2, pointCount: s32, thick: float, color: Color) -> void #foreign raygui;
DrawSplineBasis :: (points: *Vector2, pointCount: s32, thick: float, color: Color) -> void #foreign raygui;
DrawSplineCatmullRom :: (points: *Vector2, pointCount: s32, thick: float, color: Color) -> void #foreign raygui;
DrawSplineBezierQuadratic :: (points: *Vector2, pointCount: s32, thick: float, color: Color) -> void #foreign raygui;
DrawSplineBezierCubic :: (points: *Vector2, pointCount: s32, thick: float, color: Color) -> void #foreign raygui;
DrawSplineSegmentLinear :: (p1: Vector2, p2: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawSplineSegmentBasis :: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawSplineSegmentCatmullRom :: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawSplineSegmentBezierQuadratic :: (p1: Vector2, c2: Vector2, p3: Vector2, thick: float, color: Color) -> void #foreign raygui;
DrawSplineSegmentBezierCubic :: (p1: Vector2, c2: Vector2, c3: Vector2, p4: Vector2, thick: float, color: Color) -> void #foreign raygui;

// Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]
GetSplinePointLinear :: (startPos: Vector2, endPos: Vector2, t: float) -> Vector2 #foreign raygui;
GetSplinePointBasis :: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: float) -> Vector2 #foreign raygui;
GetSplinePointCatmullRom :: (p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: float) -> Vector2 #foreign raygui;
GetSplinePointBezierQuad :: (p1: Vector2, c2: Vector2, p3: Vector2, t: float) -> Vector2 #foreign raygui;
GetSplinePointBezierCubic :: (p1: Vector2, c2: Vector2, c3: Vector2, p4: Vector2, t: float) -> Vector2 #foreign raygui;

// Basic shapes collision detection functions
CheckCollisionRecs :: (rec1: Rectangle, rec2: Rectangle) -> bool #foreign raygui;
CheckCollisionCircles :: (center1: Vector2, radius1: float, center2: Vector2, radius2: float) -> bool #foreign raygui;
CheckCollisionCircleRec :: (center: Vector2, radius: float, rec: Rectangle) -> bool #foreign raygui;
CheckCollisionPointRec :: (point: Vector2, rec: Rectangle) -> bool #foreign raygui;
CheckCollisionPointCircle :: (point: Vector2, center: Vector2, radius: float) -> bool #foreign raygui;
CheckCollisionPointTriangle :: (point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) -> bool #foreign raygui;
CheckCollisionPointPoly :: (point: Vector2, points: *Vector2, pointCount: s32) -> bool #foreign raygui;
CheckCollisionLines :: (startPos1: Vector2, endPos1: Vector2, startPos2: Vector2, endPos2: Vector2, collisionPoint: *Vector2) -> bool #foreign raygui;
CheckCollisionPointLine :: (point: Vector2, p1: Vector2, p2: Vector2, threshold: s32) -> bool #foreign raygui;
GetCollisionRec :: (rec1: Rectangle, rec2: Rectangle) -> Rectangle #foreign raygui;

// Image loading functions
// NOTE: These functions do not require GPU access
LoadImage :: (fileName: *u8) -> Image #foreign raygui;
LoadImageRaw :: (fileName: *u8, width: s32, height: s32, format: s32, headerSize: s32) -> Image #foreign raygui;
LoadImageSvg :: (fileNameOrString: *u8, width: s32, height: s32) -> Image #foreign raygui;
LoadImageAnim :: (fileName: *u8, frames: *s32) -> Image #foreign raygui;
LoadImageFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32) -> Image #foreign raygui;
LoadImageFromTexture :: (texture: Texture2D) -> Image #foreign raygui;
LoadImageFromScreen :: () -> Image #foreign raygui;
IsImageReady :: (image: Image) -> bool #foreign raygui;
UnloadImage :: (image: Image) -> void #foreign raygui;
ExportImage :: (image: Image, fileName: *u8) -> bool #foreign raygui;
ExportImageToMemory :: (image: Image, fileType: *u8, fileSize: *s32) -> *u8 #foreign raygui;
ExportImageAsCode :: (image: Image, fileName: *u8) -> bool #foreign raygui;

// Image generation functions
GenImageColor :: (width: s32, height: s32, color: Color) -> Image #foreign raygui;
GenImageGradientLinear :: (width: s32, height: s32, direction: s32, start: Color, end: Color) -> Image #foreign raygui;
GenImageGradientRadial :: (width: s32, height: s32, density: float, inner: Color, outer: Color) -> Image #foreign raygui;
GenImageGradientSquare :: (width: s32, height: s32, density: float, inner: Color, outer: Color) -> Image #foreign raygui;
GenImageChecked :: (width: s32, height: s32, checksX: s32, checksY: s32, col1: Color, col2: Color) -> Image #foreign raygui;
GenImageWhiteNoise :: (width: s32, height: s32, factor: float) -> Image #foreign raygui;
GenImagePerlinNoise :: (width: s32, height: s32, offsetX: s32, offsetY: s32, scale: float) -> Image #foreign raygui;
GenImageCellular :: (width: s32, height: s32, tileSize: s32) -> Image #foreign raygui;
GenImageText :: (width: s32, height: s32, text: *u8) -> Image #foreign raygui;

// Image manipulation functions
ImageCopy :: (image: Image) -> Image #foreign raygui;
ImageFromImage :: (image: Image, rec: Rectangle) -> Image #foreign raygui;
ImageText :: (text: *u8, fontSize: s32, color: Color) -> Image #foreign raygui;
ImageTextEx :: (font: Font, text: *u8, fontSize: float, spacing: float, tint: Color) -> Image #foreign raygui;
ImageFormat :: (image: *Image, newFormat: s32) -> void #foreign raygui;
ImageToPOT :: (image: *Image, fill: Color) -> void #foreign raygui;
ImageCrop :: (image: *Image, crop: Rectangle) -> void #foreign raygui;
ImageAlphaCrop :: (image: *Image, threshold: float) -> void #foreign raygui;
ImageAlphaClear :: (image: *Image, color: Color, threshold: float) -> void #foreign raygui;
ImageAlphaMask :: (image: *Image, alphaMask: Image) -> void #foreign raygui;
ImageAlphaPremultiply :: (image: *Image) -> void #foreign raygui;
ImageBlurGaussian :: (image: *Image, blurSize: s32) -> void #foreign raygui;
ImageResize :: (image: *Image, newWidth: s32, newHeight: s32) -> void #foreign raygui;
ImageResizeNN :: (image: *Image, newWidth: s32, newHeight: s32) -> void #foreign raygui;
ImageResizeCanvas :: (image: *Image, newWidth: s32, newHeight: s32, offsetX: s32, offsetY: s32, fill: Color) -> void #foreign raygui;
ImageMipmaps :: (image: *Image) -> void #foreign raygui;
ImageDither :: (image: *Image, rBpp: s32, gBpp: s32, bBpp: s32, aBpp: s32) -> void #foreign raygui;
ImageFlipVertical :: (image: *Image) -> void #foreign raygui;
ImageFlipHorizontal :: (image: *Image) -> void #foreign raygui;
ImageRotate :: (image: *Image, degrees: s32) -> void #foreign raygui;
ImageRotateCW :: (image: *Image) -> void #foreign raygui;
ImageRotateCCW :: (image: *Image) -> void #foreign raygui;
ImageColorTint :: (image: *Image, color: Color) -> void #foreign raygui;
ImageColorInvert :: (image: *Image) -> void #foreign raygui;
ImageColorGrayscale :: (image: *Image) -> void #foreign raygui;
ImageColorContrast :: (image: *Image, contrast: float) -> void #foreign raygui;
ImageColorBrightness :: (image: *Image, brightness: s32) -> void #foreign raygui;
ImageColorReplace :: (image: *Image, color: Color, replace: Color) -> void #foreign raygui;
LoadImageColors :: (image: Image) -> *Color #foreign raygui;
LoadImagePalette :: (image: Image, maxPaletteSize: s32, colorCount: *s32) -> *Color #foreign raygui;
UnloadImageColors :: (colors: *Color) -> void #foreign raygui;
UnloadImagePalette :: (colors: *Color) -> void #foreign raygui;
GetImageAlphaBorder :: (image: Image, threshold: float) -> Rectangle #foreign raygui;
GetImageColor :: (image: Image, x: s32, y: s32) -> Color #foreign raygui;

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
ImageClearBackground :: (dst: *Image, color: Color) -> void #foreign raygui;
ImageDrawPixel :: (dst: *Image, posX: s32, posY: s32, color: Color) -> void #foreign raygui;
ImageDrawPixelV :: (dst: *Image, position: Vector2, color: Color) -> void #foreign raygui;
ImageDrawLine :: (dst: *Image, startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) -> void #foreign raygui;
ImageDrawLineV :: (dst: *Image, start: Vector2, end: Vector2, color: Color) -> void #foreign raygui;
ImageDrawCircle :: (dst: *Image, centerX: s32, centerY: s32, radius: s32, color: Color) -> void #foreign raygui;
ImageDrawCircleV :: (dst: *Image, center: Vector2, radius: s32, color: Color) -> void #foreign raygui;
ImageDrawCircleLines :: (dst: *Image, centerX: s32, centerY: s32, radius: s32, color: Color) -> void #foreign raygui;
ImageDrawCircleLinesV :: (dst: *Image, center: Vector2, radius: s32, color: Color) -> void #foreign raygui;
ImageDrawRectangle :: (dst: *Image, posX: s32, posY: s32, width: s32, height: s32, color: Color) -> void #foreign raygui;
ImageDrawRectangleV :: (dst: *Image, position: Vector2, size: Vector2, color: Color) -> void #foreign raygui;
ImageDrawRectangleRec :: (dst: *Image, rec: Rectangle, color: Color) -> void #foreign raygui;
ImageDrawRectangleLines :: (dst: *Image, rec: Rectangle, thick: s32, color: Color) -> void #foreign raygui;
ImageDraw :: (dst: *Image, src: Image, srcRec: Rectangle, dstRec: Rectangle, tint: Color) -> void #foreign raygui;
ImageDrawText :: (dst: *Image, text: *u8, posX: s32, posY: s32, fontSize: s32, color: Color) -> void #foreign raygui;
ImageDrawTextEx :: (dst: *Image, font: Font, text: *u8, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raygui;

// Texture loading functions
// NOTE: These functions require GPU access
LoadTexture :: (fileName: *u8) -> Texture2D #foreign raygui;
LoadTextureFromImage :: (image: Image) -> Texture2D #foreign raygui;
LoadTextureCubemap :: (image: Image, layout: s32) -> TextureCubemap #foreign raygui;
LoadRenderTexture :: (width: s32, height: s32) -> RenderTexture2D #foreign raygui;
IsTextureReady :: (texture: Texture2D) -> bool #foreign raygui;
UnloadTexture :: (texture: Texture2D) -> void #foreign raygui;
IsRenderTextureReady :: (target: RenderTexture2D) -> bool #foreign raygui;
UnloadRenderTexture :: (target: RenderTexture2D) -> void #foreign raygui;
UpdateTexture :: (texture: Texture2D, pixels: *void) -> void #foreign raygui;
UpdateTextureRec :: (texture: Texture2D, rec: Rectangle, pixels: *void) -> void #foreign raygui;

// Texture configuration functions
GenTextureMipmaps :: (texture: *Texture2D) -> void #foreign raygui;
SetTextureFilter :: (texture: Texture2D, filter: s32) -> void #foreign raygui;
SetTextureWrap :: (texture: Texture2D, wrap: s32) -> void #foreign raygui;

// Texture drawing functions
DrawTexture :: (texture: Texture2D, posX: s32, posY: s32, tint: Color) -> void #foreign raygui;
DrawTextureV :: (texture: Texture2D, position: Vector2, tint: Color) -> void #foreign raygui;
DrawTextureEx :: (texture: Texture2D, position: Vector2, rotation: float, scale: float, tint: Color) -> void #foreign raygui;
DrawTextureRec :: (texture: Texture2D, source: Rectangle, position: Vector2, tint: Color) -> void #foreign raygui;
DrawTexturePro :: (texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: float, tint: Color) -> void #foreign raygui;
DrawTextureNPatch :: (texture: Texture2D, nPatchInfo: NPatchInfo, dest: Rectangle, origin: Vector2, rotation: float, tint: Color) -> void #foreign raygui;

// Color/pixel related functions
Fade :: (color: Color, alpha: float) -> Color #foreign raygui;
ColorToInt :: (color: Color) -> s32 #foreign raygui;
ColorNormalize :: (color: Color) -> Vector4 #foreign raygui;
ColorFromNormalized :: (normalized: Vector4) -> Color #foreign raygui;
ColorToHSV :: (color: Color) -> Vector3 #foreign raygui;
ColorFromHSV :: (hue: float, saturation: float, value: float) -> Color #foreign raygui;
ColorTint :: (color: Color, tint: Color) -> Color #foreign raygui;
ColorBrightness :: (color: Color, factor: float) -> Color #foreign raygui;
ColorContrast :: (color: Color, contrast: float) -> Color #foreign raygui;
ColorAlpha :: (color: Color, alpha: float) -> Color #foreign raygui;
ColorAlphaBlend :: (dst: Color, src: Color, tint: Color) -> Color #foreign raygui;
GetColor :: (hexValue: u32) -> Color #foreign raygui;
GetPixelColor :: (srcPtr: *void, format: s32) -> Color #foreign raygui;
SetPixelColor :: (dstPtr: *void, color: Color, format: s32) -> void #foreign raygui;
GetPixelDataSize :: (width: s32, height: s32, format: s32) -> s32 #foreign raygui;

// Font loading/unloading functions
GetFontDefault :: () -> Font #foreign raygui;
LoadFont :: (fileName: *u8) -> Font #foreign raygui;
LoadFontEx :: (fileName: *u8, fontSize: s32, codepoints: *s32, codepointCount: s32) -> Font #foreign raygui;
LoadFontFromImage :: (image: Image, key: Color, firstChar: s32) -> Font #foreign raygui;
LoadFontFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32, fontSize: s32, codepoints: *s32, codepointCount: s32) -> Font #foreign raygui;
IsFontReady :: (font: Font) -> bool #foreign raygui;
LoadFontData :: (fileData: *u8, dataSize: s32, fontSize: s32, codepoints: *s32, codepointCount: s32, type: s32) -> *GlyphInfo #foreign raygui;
GenImageFontAtlas :: (glyphs: *GlyphInfo, glyphRecs: **Rectangle, glyphCount: s32, fontSize: s32, padding: s32, packMethod: s32) -> Image #foreign raygui;
UnloadFontData :: (glyphs: *GlyphInfo, glyphCount: s32) -> void #foreign raygui;
UnloadFont :: (font: Font) -> void #foreign raygui;
ExportFontAsCode :: (font: Font, fileName: *u8) -> bool #foreign raygui;

// Text drawing functions
DrawFPS :: (posX: s32, posY: s32) -> void #foreign raygui;
DrawText :: (text: *u8, posX: s32, posY: s32, fontSize: s32, color: Color) -> void #foreign raygui;
DrawTextEx :: (font: Font, text: *u8, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raygui;
DrawTextPro :: (font: Font, text: *u8, position: Vector2, origin: Vector2, rotation: float, fontSize: float, spacing: float, tint: Color) -> void #foreign raygui;
DrawTextCodepoint :: (font: Font, codepoint: s32, position: Vector2, fontSize: float, tint: Color) -> void #foreign raygui;
DrawTextCodepoints :: (font: Font, codepoints: *s32, codepointCount: s32, position: Vector2, fontSize: float, spacing: float, tint: Color) -> void #foreign raygui;

// Text font info functions
SetTextLineSpacing :: (spacing: s32) -> void #foreign raygui;
MeasureText :: (text: *u8, fontSize: s32) -> s32 #foreign raygui;
MeasureTextEx :: (font: Font, text: *u8, fontSize: float, spacing: float) -> Vector2 #foreign raygui;
GetGlyphIndex :: (font: Font, codepoint: s32) -> s32 #foreign raygui;
GetGlyphInfo :: (font: Font, codepoint: s32) -> GlyphInfo #foreign raygui;
GetGlyphAtlasRec :: (font: Font, codepoint: s32) -> Rectangle #foreign raygui;

// Text codepoints management functions (unicode characters)
LoadUTF8 :: (codepoints: *s32, length: s32) -> *u8 #foreign raygui;
UnloadUTF8 :: (text: *u8) -> void #foreign raygui;
LoadCodepoints :: (text: *u8, count: *s32) -> *s32 #foreign raygui;
UnloadCodepoints :: (codepoints: *s32) -> void #foreign raygui;
GetCodepointCount :: (text: *u8) -> s32 #foreign raygui;
GetCodepoint :: (text: *u8, codepointSize: *s32) -> s32 #foreign raygui;
GetCodepointNext :: (text: *u8, codepointSize: *s32) -> s32 #foreign raygui;
GetCodepointPrevious :: (text: *u8, codepointSize: *s32) -> s32 #foreign raygui;
CodepointToUTF8 :: (codepoint: s32, utf8Size: *s32) -> *u8 #foreign raygui;

// Text strings management functions (no UTF-8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
TextCopy :: (dst: *u8, src: *u8) -> s32 #foreign raygui;
TextIsEqual :: (text1: *u8, text2: *u8) -> bool #foreign raygui;
TextLength :: (text: *u8) -> u32 #foreign raygui;
TextFormat_CFormat :: (text: *u8, __args: ..Any) -> *u8 #foreign raygui "TextFormat";
TextFormat :: (text: string, __args: ..Any) -> *u8 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, text, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return TextFormat_CFormat("%s", formatted_text.data);
} @PrintLike
TextSubtext :: (text: *u8, position: s32, length: s32) -> *u8 #foreign raygui;
TextReplace :: (text: *u8, replace: *u8, by: *u8) -> *u8 #foreign raygui;
TextInsert :: (text: *u8, insert: *u8, position: s32) -> *u8 #foreign raygui;
TextJoin :: (textList: **u8, count: s32, delimiter: *u8) -> *u8 #foreign raygui;
TextSplit :: (text: *u8, delimiter: u8, count: *s32) -> **u8 #foreign raygui;
TextAppend :: (text: *u8, append: *u8, position: *s32) -> void #foreign raygui;
TextFindIndex :: (text: *u8, find: *u8) -> s32 #foreign raygui;
TextToUpper :: (text: *u8) -> *u8 #foreign raygui;
TextToLower :: (text: *u8) -> *u8 #foreign raygui;
TextToPascal :: (text: *u8) -> *u8 #foreign raygui;
TextToInteger :: (text: *u8) -> s32 #foreign raygui;

// Basic geometric 3D shapes drawing functions
DrawLine3D :: (startPos: Vector3, endPos: Vector3, color: Color) -> void #foreign raygui;
DrawPoint3D :: (position: Vector3, color: Color) -> void #foreign raygui;
DrawCircle3D :: (center: Vector3, radius: float, rotationAxis: Vector3, rotationAngle: float, color: Color) -> void #foreign raygui;
DrawTriangle3D :: (v1: Vector3, v2: Vector3, v3: Vector3, color: Color) -> void #foreign raygui;
DrawTriangleStrip3D :: (points: *Vector3, pointCount: s32, color: Color) -> void #foreign raygui;
DrawCube :: (position: Vector3, width: float, height: float, length: float, color: Color) -> void #foreign raygui;
DrawCubeV :: (position: Vector3, size: Vector3, color: Color) -> void #foreign raygui;
DrawCubeWires :: (position: Vector3, width: float, height: float, length: float, color: Color) -> void #foreign raygui;
DrawCubeWiresV :: (position: Vector3, size: Vector3, color: Color) -> void #foreign raygui;
DrawSphere :: (centerPos: Vector3, radius: float, color: Color) -> void #foreign raygui;
DrawSphereEx :: (centerPos: Vector3, radius: float, rings: s32, slices: s32, color: Color) -> void #foreign raygui;
DrawSphereWires :: (centerPos: Vector3, radius: float, rings: s32, slices: s32, color: Color) -> void #foreign raygui;
DrawCylinder :: (position: Vector3, radiusTop: float, radiusBottom: float, height: float, slices: s32, color: Color) -> void #foreign raygui;
DrawCylinderEx :: (startPos: Vector3, endPos: Vector3, startRadius: float, endRadius: float, sides: s32, color: Color) -> void #foreign raygui;
DrawCylinderWires :: (position: Vector3, radiusTop: float, radiusBottom: float, height: float, slices: s32, color: Color) -> void #foreign raygui;
DrawCylinderWiresEx :: (startPos: Vector3, endPos: Vector3, startRadius: float, endRadius: float, sides: s32, color: Color) -> void #foreign raygui;
DrawCapsule :: (startPos: Vector3, endPos: Vector3, radius: float, slices: s32, rings: s32, color: Color) -> void #foreign raygui;
DrawCapsuleWires :: (startPos: Vector3, endPos: Vector3, radius: float, slices: s32, rings: s32, color: Color) -> void #foreign raygui;
DrawPlane :: (centerPos: Vector3, size: Vector2, color: Color) -> void #foreign raygui;
DrawRay :: (ray: Ray, color: Color) -> void #foreign raygui;
DrawGrid :: (slices: s32, spacing: float) -> void #foreign raygui;

// Model management functions
LoadModel :: (fileName: *u8) -> Model #foreign raygui;
LoadModelFromMesh :: (mesh: Mesh) -> Model #foreign raygui;
IsModelReady :: (model: Model) -> bool #foreign raygui;
UnloadModel :: (model: Model) -> void #foreign raygui;
GetModelBoundingBox :: (model: Model) -> BoundingBox #foreign raygui;

// Model drawing functions
DrawModel :: (model: Model, position: Vector3, scale: float, tint: Color) -> void #foreign raygui;
DrawModelEx :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float, scale: Vector3, tint: Color) -> void #foreign raygui;
DrawModelWires :: (model: Model, position: Vector3, scale: float, tint: Color) -> void #foreign raygui;
DrawModelWiresEx :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float, scale: Vector3, tint: Color) -> void #foreign raygui;
DrawBoundingBox :: (box: BoundingBox, color: Color) -> void #foreign raygui;
DrawBillboard :: (camera: Camera, texture: Texture2D, position: Vector3, size: float, tint: Color) -> void #foreign raygui;
DrawBillboardRec :: (camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, size: Vector2, tint: Color) -> void #foreign raygui;
DrawBillboardPro :: (camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, up: Vector3, size: Vector2, origin: Vector2, rotation: float, tint: Color) -> void #foreign raygui;

// Mesh management functions
UploadMesh :: (mesh: *Mesh, dynamic: bool) -> void #foreign raygui;
UpdateMeshBuffer :: (mesh: Mesh, index: s32, data: *void, dataSize: s32, offset: s32) -> void #foreign raygui;
UnloadMesh :: (mesh: Mesh) -> void #foreign raygui;
DrawMesh :: (mesh: Mesh, material: Material, transform: Matrix) -> void #foreign raygui;
DrawMeshInstanced :: (mesh: Mesh, material: Material, transforms: *Matrix, instances: s32) -> void #foreign raygui;
ExportMesh :: (mesh: Mesh, fileName: *u8) -> bool #foreign raygui;
GetMeshBoundingBox :: (mesh: Mesh) -> BoundingBox #foreign raygui;
GenMeshTangents :: (mesh: *Mesh) -> void #foreign raygui;

// Mesh generation functions
GenMeshPoly :: (sides: s32, radius: float) -> Mesh #foreign raygui;
GenMeshPlane :: (width: float, length: float, resX: s32, resZ: s32) -> Mesh #foreign raygui;
GenMeshCube :: (width: float, height: float, length: float) -> Mesh #foreign raygui;
GenMeshSphere :: (radius: float, rings: s32, slices: s32) -> Mesh #foreign raygui;
GenMeshHemiSphere :: (radius: float, rings: s32, slices: s32) -> Mesh #foreign raygui;
GenMeshCylinder :: (radius: float, height: float, slices: s32) -> Mesh #foreign raygui;
GenMeshCone :: (radius: float, height: float, slices: s32) -> Mesh #foreign raygui;
GenMeshTorus :: (radius: float, size: float, radSeg: s32, sides: s32) -> Mesh #foreign raygui;
GenMeshKnot :: (radius: float, size: float, radSeg: s32, sides: s32) -> Mesh #foreign raygui;
GenMeshHeightmap :: (heightmap: Image, size: Vector3) -> Mesh #foreign raygui;
GenMeshCubicmap :: (cubicmap: Image, cubeSize: Vector3) -> Mesh #foreign raygui;

// Material loading/unloading functions
LoadMaterials :: (fileName: *u8, materialCount: *s32) -> *Material #foreign raygui;
LoadMaterialDefault :: () -> Material #foreign raygui;
IsMaterialReady :: (material: Material) -> bool #foreign raygui;
UnloadMaterial :: (material: Material) -> void #foreign raygui;
SetMaterialTexture :: (material: *Material, mapType: s32, texture: Texture2D) -> void #foreign raygui;
SetModelMeshMaterial :: (model: *Model, meshId: s32, materialId: s32) -> void #foreign raygui;

// Model animations loading/unloading functions
LoadModelAnimations :: (fileName: *u8, animCount: *s32) -> *ModelAnimation #foreign raygui;
UpdateModelAnimation :: (model: Model, anim: ModelAnimation, frame: s32) -> void #foreign raygui;
UnloadModelAnimation :: (anim: ModelAnimation) -> void #foreign raygui;
UnloadModelAnimations :: (animations: *ModelAnimation, animCount: s32) -> void #foreign raygui;
IsModelAnimationValid :: (model: Model, anim: ModelAnimation) -> bool #foreign raygui;

// Collision detection functions
CheckCollisionSpheres :: (center1: Vector3, radius1: float, center2: Vector3, radius2: float) -> bool #foreign raygui;
CheckCollisionBoxes :: (box1: BoundingBox, box2: BoundingBox) -> bool #foreign raygui;
CheckCollisionBoxSphere :: (box: BoundingBox, center: Vector3, radius: float) -> bool #foreign raygui;
GetRayCollisionSphere :: (ray: Ray, center: Vector3, radius: float) -> RayCollision #foreign raygui;
GetRayCollisionBox :: (ray: Ray, box: BoundingBox) -> RayCollision #foreign raygui;
GetRayCollisionMesh :: (ray: Ray, mesh: Mesh, transform: Matrix) -> RayCollision #foreign raygui;
GetRayCollisionTriangle :: (ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) -> RayCollision #foreign raygui;
GetRayCollisionQuad :: (ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3, p4: Vector3) -> RayCollision #foreign raygui;

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
AudioCallback :: #type (bufferData: *void, frames: u32) -> void #c_call;

// Audio device management functions
InitAudioDevice :: () -> void #foreign raygui;
CloseAudioDevice :: () -> void #foreign raygui;
IsAudioDeviceReady :: () -> bool #foreign raygui;
SetMasterVolume :: (volume: float) -> void #foreign raygui;
GetMasterVolume :: () -> float #foreign raygui;

// Wave/Sound loading/unloading functions
LoadWave :: (fileName: *u8) -> Wave #foreign raygui;
LoadWaveFromMemory :: (fileType: *u8, fileData: *u8, dataSize: s32) -> Wave #foreign raygui;
IsWaveReady :: (wave: Wave) -> bool #foreign raygui;
LoadSound :: (fileName: *u8) -> Sound #foreign raygui;
LoadSoundFromWave :: (wave: Wave) -> Sound #foreign raygui;
LoadSoundAlias :: (source: Sound) -> Sound #foreign raygui;
IsSoundReady :: (sound: Sound) -> bool #foreign raygui;
UpdateSound :: (sound: Sound, data: *void, sampleCount: s32) -> void #foreign raygui;
UnloadWave :: (wave: Wave) -> void #foreign raygui;
UnloadSound :: (sound: Sound) -> void #foreign raygui;
UnloadSoundAlias :: (alias: Sound) -> void #foreign raygui;
ExportWave :: (wave: Wave, fileName: *u8) -> bool #foreign raygui;
ExportWaveAsCode :: (wave: Wave, fileName: *u8) -> bool #foreign raygui;

// Wave/Sound management functions
PlaySound :: (sound: Sound) -> void #foreign raygui;
StopSound :: (sound: Sound) -> void #foreign raygui;
PauseSound :: (sound: Sound) -> void #foreign raygui;
ResumeSound :: (sound: Sound) -> void #foreign raygui;
IsSoundPlaying :: (sound: Sound) -> bool #foreign raygui;
SetSoundVolume :: (sound: Sound, volume: float) -> void #foreign raygui;
SetSoundPitch :: (sound: Sound, pitch: float) -> void #foreign raygui;
SetSoundPan :: (sound: Sound, pan: float) -> void #foreign raygui;
WaveCopy :: (wave: Wave) -> Wave #foreign raygui;
WaveCrop :: (wave: *Wave, initSample: s32, finalSample: s32) -> void #foreign raygui;
WaveFormat :: (wave: *Wave, sampleRate: s32, sampleSize: s32, channels: s32) -> void #foreign raygui;
LoadWaveSamples :: (wave: Wave) -> *float #foreign raygui;
UnloadWaveSamples :: (samples: *float) -> void #foreign raygui;

// Music management functions
LoadMusicStream :: (fileName: *u8) -> Music #foreign raygui;
LoadMusicStreamFromMemory :: (fileType: *u8, data: *u8, dataSize: s32) -> Music #foreign raygui;
IsMusicReady :: (music: Music) -> bool #foreign raygui;
UnloadMusicStream :: (music: Music) -> void #foreign raygui;
PlayMusicStream :: (music: Music) -> void #foreign raygui;
IsMusicStreamPlaying :: (music: Music) -> bool #foreign raygui;
UpdateMusicStream :: (music: Music) -> void #foreign raygui;
StopMusicStream :: (music: Music) -> void #foreign raygui;
PauseMusicStream :: (music: Music) -> void #foreign raygui;
ResumeMusicStream :: (music: Music) -> void #foreign raygui;
SeekMusicStream :: (music: Music, position: float) -> void #foreign raygui;
SetMusicVolume :: (music: Music, volume: float) -> void #foreign raygui;
SetMusicPitch :: (music: Music, pitch: float) -> void #foreign raygui;
SetMusicPan :: (music: Music, pan: float) -> void #foreign raygui;
GetMusicTimeLength :: (music: Music) -> float #foreign raygui;
GetMusicTimePlayed :: (music: Music) -> float #foreign raygui;

// AudioStream management functions
LoadAudioStream :: (sampleRate: u32, sampleSize: u32, channels: u32) -> AudioStream #foreign raygui;
IsAudioStreamReady :: (stream: AudioStream) -> bool #foreign raygui;
UnloadAudioStream :: (stream: AudioStream) -> void #foreign raygui;
UpdateAudioStream :: (stream: AudioStream, data: *void, frameCount: s32) -> void #foreign raygui;
IsAudioStreamProcessed :: (stream: AudioStream) -> bool #foreign raygui;
PlayAudioStream :: (stream: AudioStream) -> void #foreign raygui;
PauseAudioStream :: (stream: AudioStream) -> void #foreign raygui;
ResumeAudioStream :: (stream: AudioStream) -> void #foreign raygui;
IsAudioStreamPlaying :: (stream: AudioStream) -> bool #foreign raygui;
StopAudioStream :: (stream: AudioStream) -> void #foreign raygui;
SetAudioStreamVolume :: (stream: AudioStream, volume: float) -> void #foreign raygui;
SetAudioStreamPitch :: (stream: AudioStream, pitch: float) -> void #foreign raygui;
SetAudioStreamPan :: (stream: AudioStream, pan: float) -> void #foreign raygui;
SetAudioStreamBufferSizeDefault :: (size: s32) -> void #foreign raygui;
SetAudioStreamCallback :: (stream: AudioStream, callback: AudioCallback) -> void #foreign raygui;

AttachAudioStreamProcessor :: (stream: AudioStream, processor: AudioCallback) -> void #foreign raygui;
DetachAudioStreamProcessor :: (stream: AudioStream, processor: AudioCallback) -> void #foreign raygui;

AttachAudioMixedProcessor :: (processor: AudioCallback) -> void #foreign raygui;
DetachAudioMixedProcessor :: (processor: AudioCallback) -> void #foreign raygui;

// Style property
// NOTE: Used when exporting style as code for convenience
GuiStyleProp :: struct {
    controlId:     u16; // Control identifier
    propertyId:    u16; // Property identifier
    propertyValue: s32; // Property value
}

// Gui control state
GuiState :: enum u32 {
    STATE_NORMAL   :: 0;
    STATE_FOCUSED  :: 1;
    STATE_PRESSED  :: 2;
    STATE_DISABLED :: 3;
}

// Gui control text alignment
GuiTextAlignment :: enum u32 {
    TEXT_ALIGN_LEFT   :: 0;
    TEXT_ALIGN_CENTER :: 1;
    TEXT_ALIGN_RIGHT  :: 2;
}

// Gui control text alignment vertical
// NOTE: Text vertical position inside the text bounds
GuiTextAlignmentVertical :: enum u32 {
    TEXT_ALIGN_TOP    :: 0;
    TEXT_ALIGN_MIDDLE :: 1;
    TEXT_ALIGN_BOTTOM :: 2;
}

// Gui control text wrap mode
// NOTE: Useful for multiline text
GuiTextWrapMode :: enum u32 {
    TEXT_WRAP_NONE :: 0;
    TEXT_WRAP_CHAR :: 1;
    TEXT_WRAP_WORD :: 2;
}

// Gui controls
GuiControl :: enum u32 {
    DEFAULT     :: 0;

    LABEL       :: 1;
    BUTTON      :: 2;
    TOGGLE      :: 3;
    SLIDER      :: 4;
    PROGRESSBAR :: 5;
    CHECKBOX    :: 6;
    COMBOBOX    :: 7;
    DROPDOWNBOX :: 8;
    TEXTBOX     :: 9;
    VALUEBOX    :: 10;
    SPINNER     :: 11;
    LISTVIEW    :: 12;
    COLORPICKER :: 13;
    SCROLLBAR   :: 14;
    STATUSBAR   :: 15;
}

// Gui base properties for every control
// NOTE: RAYGUI_MAX_PROPS_BASE properties (by default 16 properties)
GuiControlProperty :: enum u32 {
    BORDER_COLOR_NORMAL   :: 0;
    BASE_COLOR_NORMAL     :: 1;
    TEXT_COLOR_NORMAL     :: 2;
    BORDER_COLOR_FOCUSED  :: 3;
    BASE_COLOR_FOCUSED    :: 4;
    TEXT_COLOR_FOCUSED    :: 5;
    BORDER_COLOR_PRESSED  :: 6;
    BASE_COLOR_PRESSED    :: 7;
    TEXT_COLOR_PRESSED    :: 8;
    BORDER_COLOR_DISABLED :: 9;
    BASE_COLOR_DISABLED   :: 10;
    TEXT_COLOR_DISABLED   :: 11;
    BORDER_WIDTH          :: 12;

    TEXT_PADDING          :: 13;
    TEXT_ALIGNMENT        :: 14;
}

// Gui extended properties depend on control
// NOTE: RAYGUI_MAX_PROPS_EXTENDED properties (by default, max 8 properties)
//----------------------------------------------------------------------------------
// DEFAULT extended properties
// NOTE: Those properties are common to all controls or global
// WARNING: We only have 8 slots for those properties by default!!! -> New global control: TEXT?
GuiDefaultProperty :: enum u32 {
    TEXT_SIZE               :: 16;
    TEXT_SPACING            :: 17;
    LINE_COLOR              :: 18;
    BACKGROUND_COLOR        :: 19;
    TEXT_LINE_SPACING       :: 20;
    TEXT_ALIGNMENT_VERTICAL :: 21;
    TEXT_WRAP_MODE          :: 22;
}

// Toggle/ToggleGroup
GuiToggleProperty :: enum u32 {
    GROUP_PADDING :: 16;
}

// Slider/SliderBar
GuiSliderProperty :: enum u32 {
    SLIDER_WIDTH   :: 16;
    SLIDER_PADDING :: 17;
}

// ProgressBar
GuiProgressBarProperty :: enum u32 {
    PROGRESS_PADDING :: 16;
}

// ScrollBar
GuiScrollBarProperty :: enum u32 {
    ARROWS_SIZE           :: 16;
    ARROWS_VISIBLE        :: 17;
    SCROLL_SLIDER_PADDING :: 18;
    SCROLL_SLIDER_SIZE    :: 19;
    SCROLL_PADDING        :: 20;
    SCROLL_SPEED          :: 21;
}

// CheckBox
GuiCheckBoxProperty :: enum u32 {
    CHECK_PADDING :: 16;
}

// ComboBox
GuiComboBoxProperty :: enum u32 {
    COMBO_BUTTON_WIDTH   :: 16;
    COMBO_BUTTON_SPACING :: 17;
}

// DropdownBox
GuiDropdownBoxProperty :: enum u32 {
    ARROW_PADDING          :: 16;
    DROPDOWN_ITEMS_SPACING :: 17;
}

// TextBox/TextBoxMulti/ValueBox/Spinner
GuiTextBoxProperty :: enum u32 {
    TEXT_READONLY :: 16;
}

// Spinner
GuiSpinnerProperty :: enum u32 {
    SPIN_BUTTON_WIDTH   :: 16;
    SPIN_BUTTON_SPACING :: 17;
}

// ListView
GuiListViewProperty :: enum u32 {
    LIST_ITEMS_HEIGHT  :: 16;
    LIST_ITEMS_SPACING :: 17;
    SCROLLBAR_WIDTH    :: 18;
    SCROLLBAR_SIDE     :: 19;
}

// ColorPicker
GuiColorPickerProperty :: enum u32 {
    COLOR_SELECTOR_SIZE      :: 16;
    HUEBAR_WIDTH             :: 17;
    HUEBAR_PADDING           :: 18;
    HUEBAR_SELECTOR_HEIGHT   :: 19;
    HUEBAR_SELECTOR_OVERFLOW :: 20;
}

// Global gui state control functions
GuiEnable :: () -> void #foreign raygui;
GuiDisable :: () -> void #foreign raygui;
GuiLock :: () -> void #foreign raygui;
GuiUnlock :: () -> void #foreign raygui;
GuiIsLocked :: () -> bool #foreign raygui;
GuiSetAlpha :: (alpha: float) -> void #foreign raygui;
GuiSetState :: (state: s32) -> void #foreign raygui;
GuiGetState :: () -> s32 #foreign raygui;

// Font set/get functions
GuiSetFont :: (font: Font) -> void #foreign raygui;
GuiGetFont :: () -> Font #foreign raygui;

// Style set/get functions
GuiSetStyle :: (control: s32, property: s32, value: s32) -> void #foreign raygui;
GuiGetStyle :: (control: s32, property: s32) -> s32 #foreign raygui;

// Styles loading functions
GuiLoadStyle :: (fileName: *u8) -> void #foreign raygui;
GuiLoadStyleDefault :: () -> void #foreign raygui;

// Tooltips management functions
GuiEnableTooltip :: () -> void #foreign raygui;
GuiDisableTooltip :: () -> void #foreign raygui;
GuiSetTooltip :: (tooltip: *u8) -> void #foreign raygui;

// Icons functionality
GuiIconText :: (iconId: s32, text: *u8) -> *u8 #foreign raygui;

GuiSetIconScale :: (scale: s32) -> void #foreign raygui;
GuiGetIcons :: () -> *u32 #foreign raygui;
GuiLoadIcons :: (fileName: *u8, loadIconsName: bool) -> **u8 #foreign raygui;
GuiDrawIcon :: (iconId: s32, posX: s32, posY: s32, pixelSize: s32, color: Color) -> void #foreign raygui;

// Controls
//----------------------------------------------------------------------------------------------------------
// Container/separator controls, useful for controls organization
GuiWindowBox :: (bounds: Rectangle, title: *u8) -> s32 #foreign raygui;
GuiGroupBox :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiLine :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiPanel :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiTabBar :: (bounds: Rectangle, text: **u8, count: s32, active: *s32) -> s32 #foreign raygui;
GuiScrollPanel :: (bounds: Rectangle, text: *u8, content: Rectangle, scroll: *Vector2, view: *Rectangle) -> s32 #foreign raygui;

// Basic controls set
GuiLabel :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiButton :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiLabelButton :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiToggle :: (bounds: Rectangle, text: *u8, active: *bool) -> s32 #foreign raygui;
GuiToggleGroup :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign raygui;
GuiToggleSlider :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign raygui;
GuiCheckBox :: (bounds: Rectangle, text: *u8, checked: *bool) -> s32 #foreign raygui;
GuiComboBox :: (bounds: Rectangle, text: *u8, active: *s32) -> s32 #foreign raygui;

GuiDropdownBox :: (bounds: Rectangle, text: *u8, active: *s32, editMode: bool) -> s32 #foreign raygui;
GuiSpinner :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign raygui;
GuiValueBox :: (bounds: Rectangle, text: *u8, value: *s32, minValue: s32, maxValue: s32, editMode: bool) -> s32 #foreign raygui;
GuiTextBox :: (bounds: Rectangle, text: *u8, textSize: s32, editMode: bool) -> s32 #foreign raygui;

GuiSlider :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui;
GuiSliderBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui;
GuiProgressBar :: (bounds: Rectangle, textLeft: *u8, textRight: *u8, value: *float, minValue: float, maxValue: float) -> s32 #foreign raygui;
GuiStatusBar :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiDummyRec :: (bounds: Rectangle, text: *u8) -> s32 #foreign raygui;
GuiGrid :: (bounds: Rectangle, text: *u8, spacing: float, subdivs: s32, mouseCell: *Vector2) -> s32 #foreign raygui;

// Advance controls set
GuiListView :: (bounds: Rectangle, text: *u8, scrollIndex: *s32, active: *s32) -> s32 #foreign raygui;
GuiListViewEx :: (bounds: Rectangle, text: **u8, count: s32, scrollIndex: *s32, active: *s32, focus: *s32) -> s32 #foreign raygui;
GuiMessageBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8) -> s32 #foreign raygui;
GuiTextInputBox :: (bounds: Rectangle, title: *u8, message: *u8, buttons: *u8, text: *u8, textMaxSize: s32, secretViewActive: *bool) -> s32 #foreign raygui;
GuiColorPicker :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign raygui;
GuiColorPanel :: (bounds: Rectangle, text: *u8, color: *Color) -> s32 #foreign raygui;
GuiColorBarAlpha :: (bounds: Rectangle, text: *u8, alpha: *float) -> s32 #foreign raygui;
GuiColorBarHue :: (bounds: Rectangle, text: *u8, value: *float) -> s32 #foreign raygui;
GuiColorPickerHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign raygui;
GuiColorPanelHSV :: (bounds: Rectangle, text: *u8, colorHsv: *Vector3) -> s32 #foreign raygui;

//----------------------------------------------------------------------------------
// Icons enumeration
//----------------------------------------------------------------------------------
GuiIconName :: enum u32 {
    ICON_NONE                    :: 0;
    ICON_FOLDER_FILE_OPEN        :: 1;
    ICON_FILE_SAVE_CLASSIC       :: 2;
    ICON_FOLDER_OPEN             :: 3;
    ICON_FOLDER_SAVE             :: 4;
    ICON_FILE_OPEN               :: 5;
    ICON_FILE_SAVE               :: 6;
    ICON_FILE_EXPORT             :: 7;
    ICON_FILE_ADD                :: 8;
    ICON_FILE_DELETE             :: 9;
    ICON_FILETYPE_TEXT           :: 10;
    ICON_FILETYPE_AUDIO          :: 11;
    ICON_FILETYPE_IMAGE          :: 12;
    ICON_FILETYPE_PLAY           :: 13;
    ICON_FILETYPE_VIDEO          :: 14;
    ICON_FILETYPE_INFO           :: 15;
    ICON_FILE_COPY               :: 16;
    ICON_FILE_CUT                :: 17;
    ICON_FILE_PASTE              :: 18;
    ICON_CURSOR_HAND             :: 19;
    ICON_CURSOR_POINTER          :: 20;
    ICON_CURSOR_CLASSIC          :: 21;
    ICON_PENCIL                  :: 22;
    ICON_PENCIL_BIG              :: 23;
    ICON_BRUSH_CLASSIC           :: 24;
    ICON_BRUSH_PAINTER           :: 25;
    ICON_WATER_DROP              :: 26;
    ICON_COLOR_PICKER            :: 27;
    ICON_RUBBER                  :: 28;
    ICON_COLOR_BUCKET            :: 29;
    ICON_TEXT_T                  :: 30;
    ICON_TEXT_A                  :: 31;
    ICON_SCALE                   :: 32;
    ICON_RESIZE                  :: 33;
    ICON_FILTER_POINT            :: 34;
    ICON_FILTER_BILINEAR         :: 35;
    ICON_CROP                    :: 36;
    ICON_CROP_ALPHA              :: 37;
    ICON_SQUARE_TOGGLE           :: 38;
    ICON_SYMMETRY                :: 39;
    ICON_SYMMETRY_HORIZONTAL     :: 40;
    ICON_SYMMETRY_VERTICAL       :: 41;
    ICON_LENS                    :: 42;
    ICON_LENS_BIG                :: 43;
    ICON_EYE_ON                  :: 44;
    ICON_EYE_OFF                 :: 45;
    ICON_FILTER_TOP              :: 46;
    ICON_FILTER                  :: 47;
    ICON_TARGET_POINT            :: 48;
    ICON_TARGET_SMALL            :: 49;
    ICON_TARGET_BIG              :: 50;
    ICON_TARGET_MOVE             :: 51;
    ICON_CURSOR_MOVE             :: 52;
    ICON_CURSOR_SCALE            :: 53;
    ICON_CURSOR_SCALE_RIGHT      :: 54;
    ICON_CURSOR_SCALE_LEFT       :: 55;
    ICON_UNDO                    :: 56;
    ICON_REDO                    :: 57;
    ICON_REREDO                  :: 58;
    ICON_MUTATE                  :: 59;
    ICON_ROTATE                  :: 60;
    ICON_REPEAT                  :: 61;
    ICON_SHUFFLE                 :: 62;
    ICON_EMPTYBOX                :: 63;
    ICON_TARGET                  :: 64;
    ICON_TARGET_SMALL_FILL       :: 65;
    ICON_TARGET_BIG_FILL         :: 66;
    ICON_TARGET_MOVE_FILL        :: 67;
    ICON_CURSOR_MOVE_FILL        :: 68;
    ICON_CURSOR_SCALE_FILL       :: 69;
    ICON_CURSOR_SCALE_RIGHT_FILL :: 70;
    ICON_CURSOR_SCALE_LEFT_FILL  :: 71;
    ICON_UNDO_FILL               :: 72;
    ICON_REDO_FILL               :: 73;
    ICON_REREDO_FILL             :: 74;
    ICON_MUTATE_FILL             :: 75;
    ICON_ROTATE_FILL             :: 76;
    ICON_REPEAT_FILL             :: 77;
    ICON_SHUFFLE_FILL            :: 78;
    ICON_EMPTYBOX_SMALL          :: 79;
    ICON_BOX                     :: 80;
    ICON_BOX_TOP                 :: 81;
    ICON_BOX_TOP_RIGHT           :: 82;
    ICON_BOX_RIGHT               :: 83;
    ICON_BOX_BOTTOM_RIGHT        :: 84;
    ICON_BOX_BOTTOM              :: 85;
    ICON_BOX_BOTTOM_LEFT         :: 86;
    ICON_BOX_LEFT                :: 87;
    ICON_BOX_TOP_LEFT            :: 88;
    ICON_BOX_CENTER              :: 89;
    ICON_BOX_CIRCLE_MASK         :: 90;
    ICON_POT                     :: 91;
    ICON_ALPHA_MULTIPLY          :: 92;
    ICON_ALPHA_CLEAR             :: 93;
    ICON_DITHERING               :: 94;
    ICON_MIPMAPS                 :: 95;
    ICON_BOX_GRID                :: 96;
    ICON_GRID                    :: 97;
    ICON_BOX_CORNERS_SMALL       :: 98;
    ICON_BOX_CORNERS_BIG         :: 99;
    ICON_FOUR_BOXES              :: 100;
    ICON_GRID_FILL               :: 101;
    ICON_BOX_MULTISIZE           :: 102;
    ICON_ZOOM_SMALL              :: 103;
    ICON_ZOOM_MEDIUM             :: 104;
    ICON_ZOOM_BIG                :: 105;
    ICON_ZOOM_ALL                :: 106;
    ICON_ZOOM_CENTER             :: 107;
    ICON_BOX_DOTS_SMALL          :: 108;
    ICON_BOX_DOTS_BIG            :: 109;
    ICON_BOX_CONCENTRIC          :: 110;
    ICON_BOX_GRID_BIG            :: 111;
    ICON_OK_TICK                 :: 112;
    ICON_CROSS                   :: 113;
    ICON_ARROW_LEFT              :: 114;
    ICON_ARROW_RIGHT             :: 115;
    ICON_ARROW_DOWN              :: 116;
    ICON_ARROW_UP                :: 117;
    ICON_ARROW_LEFT_FILL         :: 118;
    ICON_ARROW_RIGHT_FILL        :: 119;
    ICON_ARROW_DOWN_FILL         :: 120;
    ICON_ARROW_UP_FILL           :: 121;
    ICON_AUDIO                   :: 122;
    ICON_FX                      :: 123;
    ICON_WAVE                    :: 124;
    ICON_WAVE_SINUS              :: 125;
    ICON_WAVE_SQUARE             :: 126;
    ICON_WAVE_TRIANGULAR         :: 127;
    ICON_CROSS_SMALL             :: 128;
    ICON_PLAYER_PREVIOUS         :: 129;
    ICON_PLAYER_PLAY_BACK        :: 130;
    ICON_PLAYER_PLAY             :: 131;
    ICON_PLAYER_PAUSE            :: 132;
    ICON_PLAYER_STOP             :: 133;
    ICON_PLAYER_NEXT             :: 134;
    ICON_PLAYER_RECORD           :: 135;
    ICON_MAGNET                  :: 136;
    ICON_LOCK_CLOSE              :: 137;
    ICON_LOCK_OPEN               :: 138;
    ICON_CLOCK                   :: 139;
    ICON_TOOLS                   :: 140;
    ICON_GEAR                    :: 141;
    ICON_GEAR_BIG                :: 142;
    ICON_BIN                     :: 143;
    ICON_HAND_POINTER            :: 144;
    ICON_LASER                   :: 145;
    ICON_COIN                    :: 146;
    ICON_EXPLOSION               :: 147;
    ICON_1UP                     :: 148;
    ICON_PLAYER                  :: 149;
    ICON_PLAYER_JUMP             :: 150;
    ICON_KEY                     :: 151;
    ICON_DEMON                   :: 152;
    ICON_TEXT_POPUP              :: 153;
    ICON_GEAR_EX                 :: 154;
    ICON_CRACK                   :: 155;
    ICON_CRACK_POINTS            :: 156;
    ICON_STAR                    :: 157;
    ICON_DOOR                    :: 158;
    ICON_EXIT                    :: 159;
    ICON_MODE_2D                 :: 160;
    ICON_MODE_3D                 :: 161;
    ICON_CUBE                    :: 162;
    ICON_CUBE_FACE_TOP           :: 163;
    ICON_CUBE_FACE_LEFT          :: 164;
    ICON_CUBE_FACE_FRONT         :: 165;
    ICON_CUBE_FACE_BOTTOM        :: 166;
    ICON_CUBE_FACE_RIGHT         :: 167;
    ICON_CUBE_FACE_BACK          :: 168;
    ICON_CAMERA                  :: 169;
    ICON_SPECIAL                 :: 170;
    ICON_LINK_NET                :: 171;
    ICON_LINK_BOXES              :: 172;
    ICON_LINK_MULTI              :: 173;
    ICON_LINK                    :: 174;
    ICON_LINK_BROKE              :: 175;
    ICON_TEXT_NOTES              :: 176;
    ICON_NOTEBOOK                :: 177;
    ICON_SUITCASE                :: 178;
    ICON_SUITCASE_ZIP            :: 179;
    ICON_MAILBOX                 :: 180;
    ICON_MONITOR                 :: 181;
    ICON_PRINTER                 :: 182;
    ICON_PHOTO_CAMERA            :: 183;
    ICON_PHOTO_CAMERA_FLASH      :: 184;
    ICON_HOUSE                   :: 185;
    ICON_HEART                   :: 186;
    ICON_CORNER                  :: 187;
    ICON_VERTICAL_BARS           :: 188;
    ICON_VERTICAL_BARS_FILL      :: 189;
    ICON_LIFE_BARS               :: 190;
    ICON_INFO                    :: 191;
    ICON_CROSSLINE               :: 192;
    ICON_HELP                    :: 193;
    ICON_FILETYPE_ALPHA          :: 194;
    ICON_FILETYPE_HOME           :: 195;
    ICON_LAYERS_VISIBLE          :: 196;
    ICON_LAYERS                  :: 197;
    ICON_WINDOW                  :: 198;
    ICON_HIDPI                   :: 199;
    ICON_FILETYPE_BINARY         :: 200;
    ICON_HEX                     :: 201;
    ICON_SHIELD                  :: 202;
    ICON_FILE_NEW                :: 203;
    ICON_FOLDER_ADD              :: 204;
    ICON_ALARM                   :: 205;
    ICON_CPU                     :: 206;
    ICON_ROM                     :: 207;
    ICON_STEP_OVER               :: 208;
    ICON_STEP_INTO               :: 209;
    ICON_STEP_OUT                :: 210;
    ICON_RESTART                 :: 211;
    ICON_BREAKPOINT_ON           :: 212;
    ICON_BREAKPOINT_OFF          :: 213;
    ICON_BURGER_MENU             :: 214;
    ICON_CASE_SENSITIVE          :: 215;
    ICON_REG_EXP                 :: 216;
    ICON_FOLDER                  :: 217;
    ICON_FILE                    :: 218;
    ICON_SAND_TIMER              :: 219;
    ICON_220                     :: 220;
    ICON_221                     :: 221;
    ICON_222                     :: 222;
    ICON_223                     :: 223;
    ICON_224                     :: 224;
    ICON_225                     :: 225;
    ICON_226                     :: 226;
    ICON_227                     :: 227;
    ICON_228                     :: 228;
    ICON_229                     :: 229;
    ICON_230                     :: 230;
    ICON_231                     :: 231;
    ICON_232                     :: 232;
    ICON_233                     :: 233;
    ICON_234                     :: 234;
    ICON_235                     :: 235;
    ICON_236                     :: 236;
    ICON_237                     :: 237;
    ICON_238                     :: 238;
    ICON_239                     :: 239;
    ICON_240                     :: 240;
    ICON_241                     :: 241;
    ICON_242                     :: 242;
    ICON_243                     :: 243;
    ICON_244                     :: 244;
    ICON_245                     :: 245;
    ICON_246                     :: 246;
    ICON_247                     :: 247;
    ICON_248                     :: 248;
    ICON_249                     :: 249;
    ICON_250                     :: 250;
    ICON_251                     :: 251;
    ICON_252                     :: 252;
    ICON_253                     :: 253;
    ICON_254                     :: 254;
    ICON_255                     :: 255;
}

#scope_file

#import "Basic"; // For assert, push_context


#run {
    {
        instance: Vector2;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector2.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector2.x)) == 4, "Vector2.x has unexpected size % instead of 4", size_of(type_of(Vector2.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector2.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector2.y)) == 4, "Vector2.y has unexpected size % instead of 4", size_of(type_of(Vector2.y)));
        assert(size_of(Vector2) == 8, "Vector2 has size % instead of 8", size_of(Vector2));
    }

    {
        instance: Vector3;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector3.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector3.x)) == 4, "Vector3.x has unexpected size % instead of 4", size_of(type_of(Vector3.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector3.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector3.y)) == 4, "Vector3.y has unexpected size % instead of 4", size_of(type_of(Vector3.y)));
        assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Vector3.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector3.z)) == 4, "Vector3.z has unexpected size % instead of 4", size_of(type_of(Vector3.z)));
        assert(size_of(Vector3) == 12, "Vector3 has size % instead of 12", size_of(Vector3));
    }

    {
        instance: Vector4;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector4.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector4.x)) == 4, "Vector4.x has unexpected size % instead of 4", size_of(type_of(Vector4.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector4.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector4.y)) == 4, "Vector4.y has unexpected size % instead of 4", size_of(type_of(Vector4.y)));
        assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Vector4.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector4.z)) == 4, "Vector4.z has unexpected size % instead of 4", size_of(type_of(Vector4.z)));
        assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 12, "Vector4.w has unexpected offset % instead of 12", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
        assert(size_of(type_of(Vector4.w)) == 4, "Vector4.w has unexpected size % instead of 4", size_of(type_of(Vector4.w)));
        assert(size_of(Vector4) == 16, "Vector4 has size % instead of 16", size_of(Vector4));
    }

    {
        instance: Matrix;
        assert(((cast(*void)(*instance.m0)) - cast(*void)(*instance)) == 0, "Matrix.m0 has unexpected offset % instead of 0", ((cast(*void)(*instance.m0)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m0)) == 4, "Matrix.m0 has unexpected size % instead of 4", size_of(type_of(Matrix.m0)));
        assert(((cast(*void)(*instance.m4)) - cast(*void)(*instance)) == 4, "Matrix.m4 has unexpected offset % instead of 4", ((cast(*void)(*instance.m4)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m4)) == 4, "Matrix.m4 has unexpected size % instead of 4", size_of(type_of(Matrix.m4)));
        assert(((cast(*void)(*instance.m8)) - cast(*void)(*instance)) == 8, "Matrix.m8 has unexpected offset % instead of 8", ((cast(*void)(*instance.m8)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m8)) == 4, "Matrix.m8 has unexpected size % instead of 4", size_of(type_of(Matrix.m8)));
        assert(((cast(*void)(*instance.m12)) - cast(*void)(*instance)) == 12, "Matrix.m12 has unexpected offset % instead of 12", ((cast(*void)(*instance.m12)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m12)) == 4, "Matrix.m12 has unexpected size % instead of 4", size_of(type_of(Matrix.m12)));
        assert(((cast(*void)(*instance.m1)) - cast(*void)(*instance)) == 16, "Matrix.m1 has unexpected offset % instead of 16", ((cast(*void)(*instance.m1)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m1)) == 4, "Matrix.m1 has unexpected size % instead of 4", size_of(type_of(Matrix.m1)));
        assert(((cast(*void)(*instance.m5)) - cast(*void)(*instance)) == 20, "Matrix.m5 has unexpected offset % instead of 20", ((cast(*void)(*instance.m5)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m5)) == 4, "Matrix.m5 has unexpected size % instead of 4", size_of(type_of(Matrix.m5)));
        assert(((cast(*void)(*instance.m9)) - cast(*void)(*instance)) == 24, "Matrix.m9 has unexpected offset % instead of 24", ((cast(*void)(*instance.m9)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m9)) == 4, "Matrix.m9 has unexpected size % instead of 4", size_of(type_of(Matrix.m9)));
        assert(((cast(*void)(*instance.m13)) - cast(*void)(*instance)) == 28, "Matrix.m13 has unexpected offset % instead of 28", ((cast(*void)(*instance.m13)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m13)) == 4, "Matrix.m13 has unexpected size % instead of 4", size_of(type_of(Matrix.m13)));
        assert(((cast(*void)(*instance.m2)) - cast(*void)(*instance)) == 32, "Matrix.m2 has unexpected offset % instead of 32", ((cast(*void)(*instance.m2)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m2)) == 4, "Matrix.m2 has unexpected size % instead of 4", size_of(type_of(Matrix.m2)));
        assert(((cast(*void)(*instance.m6)) - cast(*void)(*instance)) == 36, "Matrix.m6 has unexpected offset % instead of 36", ((cast(*void)(*instance.m6)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m6)) == 4, "Matrix.m6 has unexpected size % instead of 4", size_of(type_of(Matrix.m6)));
        assert(((cast(*void)(*instance.m10)) - cast(*void)(*instance)) == 40, "Matrix.m10 has unexpected offset % instead of 40", ((cast(*void)(*instance.m10)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m10)) == 4, "Matrix.m10 has unexpected size % instead of 4", size_of(type_of(Matrix.m10)));
        assert(((cast(*void)(*instance.m14)) - cast(*void)(*instance)) == 44, "Matrix.m14 has unexpected offset % instead of 44", ((cast(*void)(*instance.m14)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m14)) == 4, "Matrix.m14 has unexpected size % instead of 4", size_of(type_of(Matrix.m14)));
        assert(((cast(*void)(*instance.m3)) - cast(*void)(*instance)) == 48, "Matrix.m3 has unexpected offset % instead of 48", ((cast(*void)(*instance.m3)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m3)) == 4, "Matrix.m3 has unexpected size % instead of 4", size_of(type_of(Matrix.m3)));
        assert(((cast(*void)(*instance.m7)) - cast(*void)(*instance)) == 52, "Matrix.m7 has unexpected offset % instead of 52", ((cast(*void)(*instance.m7)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m7)) == 4, "Matrix.m7 has unexpected size % instead of 4", size_of(type_of(Matrix.m7)));
        assert(((cast(*void)(*instance.m11)) - cast(*void)(*instance)) == 56, "Matrix.m11 has unexpected offset % instead of 56", ((cast(*void)(*instance.m11)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m11)) == 4, "Matrix.m11 has unexpected size % instead of 4", size_of(type_of(Matrix.m11)));
        assert(((cast(*void)(*instance.m15)) - cast(*void)(*instance)) == 60, "Matrix.m15 has unexpected offset % instead of 60", ((cast(*void)(*instance.m15)) - cast(*void)(*instance)));
        assert(size_of(type_of(Matrix.m15)) == 4, "Matrix.m15 has unexpected size % instead of 4", size_of(type_of(Matrix.m15)));
        assert(size_of(Matrix) == 64, "Matrix has size % instead of 64", size_of(Matrix));
    }

    {
        instance: Color;
        assert(((cast(*void)(*instance.r)) - cast(*void)(*instance)) == 0, "Color.r has unexpected offset % instead of 0", ((cast(*void)(*instance.r)) - cast(*void)(*instance)));
        assert(size_of(type_of(Color.r)) == 1, "Color.r has unexpected size % instead of 1", size_of(type_of(Color.r)));
        assert(((cast(*void)(*instance.g)) - cast(*void)(*instance)) == 1, "Color.g has unexpected offset % instead of 1", ((cast(*void)(*instance.g)) - cast(*void)(*instance)));
        assert(size_of(type_of(Color.g)) == 1, "Color.g has unexpected size % instead of 1", size_of(type_of(Color.g)));
        assert(((cast(*void)(*instance.b)) - cast(*void)(*instance)) == 2, "Color.b has unexpected offset % instead of 2", ((cast(*void)(*instance.b)) - cast(*void)(*instance)));
        assert(size_of(type_of(Color.b)) == 1, "Color.b has unexpected size % instead of 1", size_of(type_of(Color.b)));
        assert(((cast(*void)(*instance.a)) - cast(*void)(*instance)) == 3, "Color.a has unexpected offset % instead of 3", ((cast(*void)(*instance.a)) - cast(*void)(*instance)));
        assert(size_of(type_of(Color.a)) == 1, "Color.a has unexpected size % instead of 1", size_of(type_of(Color.a)));
        assert(size_of(Color) == 4, "Color has size % instead of 4", size_of(Color));
    }

    {
        instance: Rectangle;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Rectangle.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(Rectangle.x)) == 4, "Rectangle.x has unexpected size % instead of 4", size_of(type_of(Rectangle.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Rectangle.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(Rectangle.y)) == 4, "Rectangle.y has unexpected size % instead of 4", size_of(type_of(Rectangle.y)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 8, "Rectangle.width has unexpected offset % instead of 8", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(Rectangle.width)) == 4, "Rectangle.width has unexpected size % instead of 4", size_of(type_of(Rectangle.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 12, "Rectangle.height has unexpected offset % instead of 12", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(Rectangle.height)) == 4, "Rectangle.height has unexpected size % instead of 4", size_of(type_of(Rectangle.height)));
        assert(size_of(Rectangle) == 16, "Rectangle has size % instead of 16", size_of(Rectangle));
    }

    {
        instance: Image;
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 0, "Image.data has unexpected offset % instead of 0", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(Image.data)) == 8, "Image.data has unexpected size % instead of 8", size_of(type_of(Image.data)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 8, "Image.width has unexpected offset % instead of 8", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(Image.width)) == 4, "Image.width has unexpected size % instead of 4", size_of(type_of(Image.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 12, "Image.height has unexpected offset % instead of 12", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(Image.height)) == 4, "Image.height has unexpected size % instead of 4", size_of(type_of(Image.height)));
        assert(((cast(*void)(*instance.mipmaps)) - cast(*void)(*instance)) == 16, "Image.mipmaps has unexpected offset % instead of 16", ((cast(*void)(*instance.mipmaps)) - cast(*void)(*instance)));
        assert(size_of(type_of(Image.mipmaps)) == 4, "Image.mipmaps has unexpected size % instead of 4", size_of(type_of(Image.mipmaps)));
        assert(((cast(*void)(*instance.format)) - cast(*void)(*instance)) == 20, "Image.format has unexpected offset % instead of 20", ((cast(*void)(*instance.format)) - cast(*void)(*instance)));
        assert(size_of(type_of(Image.format)) == 4, "Image.format has unexpected size % instead of 4", size_of(type_of(Image.format)));
        assert(size_of(Image) == 24, "Image has size % instead of 24", size_of(Image));
    }

    {
        instance: Texture;
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 0, "Texture.id has unexpected offset % instead of 0", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(Texture.id)) == 4, "Texture.id has unexpected size % instead of 4", size_of(type_of(Texture.id)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 4, "Texture.width has unexpected offset % instead of 4", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(Texture.width)) == 4, "Texture.width has unexpected size % instead of 4", size_of(type_of(Texture.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 8, "Texture.height has unexpected offset % instead of 8", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(Texture.height)) == 4, "Texture.height has unexpected size % instead of 4", size_of(type_of(Texture.height)));
        assert(((cast(*void)(*instance.mipmaps)) - cast(*void)(*instance)) == 12, "Texture.mipmaps has unexpected offset % instead of 12", ((cast(*void)(*instance.mipmaps)) - cast(*void)(*instance)));
        assert(size_of(type_of(Texture.mipmaps)) == 4, "Texture.mipmaps has unexpected size % instead of 4", size_of(type_of(Texture.mipmaps)));
        assert(((cast(*void)(*instance.format)) - cast(*void)(*instance)) == 16, "Texture.format has unexpected offset % instead of 16", ((cast(*void)(*instance.format)) - cast(*void)(*instance)));
        assert(size_of(type_of(Texture.format)) == 4, "Texture.format has unexpected size % instead of 4", size_of(type_of(Texture.format)));
        assert(size_of(Texture) == 20, "Texture has size % instead of 20", size_of(Texture));
    }

    {
        instance: RenderTexture;
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 0, "RenderTexture.id has unexpected offset % instead of 0", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(RenderTexture.id)) == 4, "RenderTexture.id has unexpected size % instead of 4", size_of(type_of(RenderTexture.id)));
        assert(((cast(*void)(*instance.texture)) - cast(*void)(*instance)) == 4, "RenderTexture.texture has unexpected offset % instead of 4", ((cast(*void)(*instance.texture)) - cast(*void)(*instance)));
        assert(size_of(type_of(RenderTexture.texture)) == 20, "RenderTexture.texture has unexpected size % instead of 20", size_of(type_of(RenderTexture.texture)));
        assert(((cast(*void)(*instance.depth)) - cast(*void)(*instance)) == 24, "RenderTexture.depth has unexpected offset % instead of 24", ((cast(*void)(*instance.depth)) - cast(*void)(*instance)));
        assert(size_of(type_of(RenderTexture.depth)) == 20, "RenderTexture.depth has unexpected size % instead of 20", size_of(type_of(RenderTexture.depth)));
        assert(size_of(RenderTexture) == 44, "RenderTexture has size % instead of 44", size_of(RenderTexture));
    }

    {
        instance: NPatchInfo;
        assert(((cast(*void)(*instance.source)) - cast(*void)(*instance)) == 0, "NPatchInfo.source has unexpected offset % instead of 0", ((cast(*void)(*instance.source)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.source)) == 16, "NPatchInfo.source has unexpected size % instead of 16", size_of(type_of(NPatchInfo.source)));
        assert(((cast(*void)(*instance.left)) - cast(*void)(*instance)) == 16, "NPatchInfo.left has unexpected offset % instead of 16", ((cast(*void)(*instance.left)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.left)) == 4, "NPatchInfo.left has unexpected size % instead of 4", size_of(type_of(NPatchInfo.left)));
        assert(((cast(*void)(*instance.top)) - cast(*void)(*instance)) == 20, "NPatchInfo.top has unexpected offset % instead of 20", ((cast(*void)(*instance.top)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.top)) == 4, "NPatchInfo.top has unexpected size % instead of 4", size_of(type_of(NPatchInfo.top)));
        assert(((cast(*void)(*instance.right)) - cast(*void)(*instance)) == 24, "NPatchInfo.right has unexpected offset % instead of 24", ((cast(*void)(*instance.right)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.right)) == 4, "NPatchInfo.right has unexpected size % instead of 4", size_of(type_of(NPatchInfo.right)));
        assert(((cast(*void)(*instance.bottom)) - cast(*void)(*instance)) == 28, "NPatchInfo.bottom has unexpected offset % instead of 28", ((cast(*void)(*instance.bottom)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.bottom)) == 4, "NPatchInfo.bottom has unexpected size % instead of 4", size_of(type_of(NPatchInfo.bottom)));
        assert(((cast(*void)(*instance.layout)) - cast(*void)(*instance)) == 32, "NPatchInfo.layout has unexpected offset % instead of 32", ((cast(*void)(*instance.layout)) - cast(*void)(*instance)));
        assert(size_of(type_of(NPatchInfo.layout)) == 4, "NPatchInfo.layout has unexpected size % instead of 4", size_of(type_of(NPatchInfo.layout)));
        assert(size_of(NPatchInfo) == 36, "NPatchInfo has size % instead of 36", size_of(NPatchInfo));
    }

    {
        instance: GlyphInfo;
        assert(((cast(*void)(*instance.value)) - cast(*void)(*instance)) == 0, "GlyphInfo.value has unexpected offset % instead of 0", ((cast(*void)(*instance.value)) - cast(*void)(*instance)));
        assert(size_of(type_of(GlyphInfo.value)) == 4, "GlyphInfo.value has unexpected size % instead of 4", size_of(type_of(GlyphInfo.value)));
        assert(((cast(*void)(*instance.offsetX)) - cast(*void)(*instance)) == 4, "GlyphInfo.offsetX has unexpected offset % instead of 4", ((cast(*void)(*instance.offsetX)) - cast(*void)(*instance)));
        assert(size_of(type_of(GlyphInfo.offsetX)) == 4, "GlyphInfo.offsetX has unexpected size % instead of 4", size_of(type_of(GlyphInfo.offsetX)));
        assert(((cast(*void)(*instance.offsetY)) - cast(*void)(*instance)) == 8, "GlyphInfo.offsetY has unexpected offset % instead of 8", ((cast(*void)(*instance.offsetY)) - cast(*void)(*instance)));
        assert(size_of(type_of(GlyphInfo.offsetY)) == 4, "GlyphInfo.offsetY has unexpected size % instead of 4", size_of(type_of(GlyphInfo.offsetY)));
        assert(((cast(*void)(*instance.advanceX)) - cast(*void)(*instance)) == 12, "GlyphInfo.advanceX has unexpected offset % instead of 12", ((cast(*void)(*instance.advanceX)) - cast(*void)(*instance)));
        assert(size_of(type_of(GlyphInfo.advanceX)) == 4, "GlyphInfo.advanceX has unexpected size % instead of 4", size_of(type_of(GlyphInfo.advanceX)));
        assert(((cast(*void)(*instance.image)) - cast(*void)(*instance)) == 16, "GlyphInfo.image has unexpected offset % instead of 16", ((cast(*void)(*instance.image)) - cast(*void)(*instance)));
        assert(size_of(type_of(GlyphInfo.image)) == 24, "GlyphInfo.image has unexpected size % instead of 24", size_of(type_of(GlyphInfo.image)));
        assert(size_of(GlyphInfo) == 40, "GlyphInfo has size % instead of 40", size_of(GlyphInfo));
    }

    {
        instance: Font;
        assert(((cast(*void)(*instance.baseSize)) - cast(*void)(*instance)) == 0, "Font.baseSize has unexpected offset % instead of 0", ((cast(*void)(*instance.baseSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.baseSize)) == 4, "Font.baseSize has unexpected size % instead of 4", size_of(type_of(Font.baseSize)));
        assert(((cast(*void)(*instance.glyphCount)) - cast(*void)(*instance)) == 4, "Font.glyphCount has unexpected offset % instead of 4", ((cast(*void)(*instance.glyphCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.glyphCount)) == 4, "Font.glyphCount has unexpected size % instead of 4", size_of(type_of(Font.glyphCount)));
        assert(((cast(*void)(*instance.glyphPadding)) - cast(*void)(*instance)) == 8, "Font.glyphPadding has unexpected offset % instead of 8", ((cast(*void)(*instance.glyphPadding)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.glyphPadding)) == 4, "Font.glyphPadding has unexpected size % instead of 4", size_of(type_of(Font.glyphPadding)));
        assert(((cast(*void)(*instance.texture)) - cast(*void)(*instance)) == 12, "Font.texture has unexpected offset % instead of 12", ((cast(*void)(*instance.texture)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.texture)) == 20, "Font.texture has unexpected size % instead of 20", size_of(type_of(Font.texture)));
        assert(((cast(*void)(*instance.recs)) - cast(*void)(*instance)) == 32, "Font.recs has unexpected offset % instead of 32", ((cast(*void)(*instance.recs)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.recs)) == 8, "Font.recs has unexpected size % instead of 8", size_of(type_of(Font.recs)));
        assert(((cast(*void)(*instance.glyphs)) - cast(*void)(*instance)) == 40, "Font.glyphs has unexpected offset % instead of 40", ((cast(*void)(*instance.glyphs)) - cast(*void)(*instance)));
        assert(size_of(type_of(Font.glyphs)) == 8, "Font.glyphs has unexpected size % instead of 8", size_of(type_of(Font.glyphs)));
        assert(size_of(Font) == 48, "Font has size % instead of 48", size_of(Font));
    }

    {
        instance: Camera3D;
        assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 0, "Camera3D.position has unexpected offset % instead of 0", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera3D.position)) == 12, "Camera3D.position has unexpected size % instead of 12", size_of(type_of(Camera3D.position)));
        assert(((cast(*void)(*instance.target)) - cast(*void)(*instance)) == 12, "Camera3D.target has unexpected offset % instead of 12", ((cast(*void)(*instance.target)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera3D.target)) == 12, "Camera3D.target has unexpected size % instead of 12", size_of(type_of(Camera3D.target)));
        assert(((cast(*void)(*instance.up)) - cast(*void)(*instance)) == 24, "Camera3D.up has unexpected offset % instead of 24", ((cast(*void)(*instance.up)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera3D.up)) == 12, "Camera3D.up has unexpected size % instead of 12", size_of(type_of(Camera3D.up)));
        assert(((cast(*void)(*instance.fovy)) - cast(*void)(*instance)) == 36, "Camera3D.fovy has unexpected offset % instead of 36", ((cast(*void)(*instance.fovy)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera3D.fovy)) == 4, "Camera3D.fovy has unexpected size % instead of 4", size_of(type_of(Camera3D.fovy)));
        assert(((cast(*void)(*instance.projection)) - cast(*void)(*instance)) == 40, "Camera3D.projection has unexpected offset % instead of 40", ((cast(*void)(*instance.projection)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera3D.projection)) == 4, "Camera3D.projection has unexpected size % instead of 4", size_of(type_of(Camera3D.projection)));
        assert(size_of(Camera3D) == 44, "Camera3D has size % instead of 44", size_of(Camera3D));
    }

    {
        instance: Camera2D;
        assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "Camera2D.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera2D.offset)) == 8, "Camera2D.offset has unexpected size % instead of 8", size_of(type_of(Camera2D.offset)));
        assert(((cast(*void)(*instance.target)) - cast(*void)(*instance)) == 8, "Camera2D.target has unexpected offset % instead of 8", ((cast(*void)(*instance.target)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera2D.target)) == 8, "Camera2D.target has unexpected size % instead of 8", size_of(type_of(Camera2D.target)));
        assert(((cast(*void)(*instance.rotation)) - cast(*void)(*instance)) == 16, "Camera2D.rotation has unexpected offset % instead of 16", ((cast(*void)(*instance.rotation)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera2D.rotation)) == 4, "Camera2D.rotation has unexpected size % instead of 4", size_of(type_of(Camera2D.rotation)));
        assert(((cast(*void)(*instance.zoom)) - cast(*void)(*instance)) == 20, "Camera2D.zoom has unexpected offset % instead of 20", ((cast(*void)(*instance.zoom)) - cast(*void)(*instance)));
        assert(size_of(type_of(Camera2D.zoom)) == 4, "Camera2D.zoom has unexpected size % instead of 4", size_of(type_of(Camera2D.zoom)));
        assert(size_of(Camera2D) == 24, "Camera2D has size % instead of 24", size_of(Camera2D));
    }

    {
        instance: Mesh;
        assert(((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)) == 0, "Mesh.vertexCount has unexpected offset % instead of 0", ((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.vertexCount)) == 4, "Mesh.vertexCount has unexpected size % instead of 4", size_of(type_of(Mesh.vertexCount)));
        assert(((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)) == 4, "Mesh.triangleCount has unexpected offset % instead of 4", ((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.triangleCount)) == 4, "Mesh.triangleCount has unexpected size % instead of 4", size_of(type_of(Mesh.triangleCount)));
        assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 8, "Mesh.vertices has unexpected offset % instead of 8", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.vertices)) == 8, "Mesh.vertices has unexpected size % instead of 8", size_of(type_of(Mesh.vertices)));
        assert(((cast(*void)(*instance.texcoords)) - cast(*void)(*instance)) == 16, "Mesh.texcoords has unexpected offset % instead of 16", ((cast(*void)(*instance.texcoords)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.texcoords)) == 8, "Mesh.texcoords has unexpected size % instead of 8", size_of(type_of(Mesh.texcoords)));
        assert(((cast(*void)(*instance.texcoords2)) - cast(*void)(*instance)) == 24, "Mesh.texcoords2 has unexpected offset % instead of 24", ((cast(*void)(*instance.texcoords2)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.texcoords2)) == 8, "Mesh.texcoords2 has unexpected size % instead of 8", size_of(type_of(Mesh.texcoords2)));
        assert(((cast(*void)(*instance.normals)) - cast(*void)(*instance)) == 32, "Mesh.normals has unexpected offset % instead of 32", ((cast(*void)(*instance.normals)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.normals)) == 8, "Mesh.normals has unexpected size % instead of 8", size_of(type_of(Mesh.normals)));
        assert(((cast(*void)(*instance.tangents)) - cast(*void)(*instance)) == 40, "Mesh.tangents has unexpected offset % instead of 40", ((cast(*void)(*instance.tangents)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.tangents)) == 8, "Mesh.tangents has unexpected size % instead of 8", size_of(type_of(Mesh.tangents)));
        assert(((cast(*void)(*instance.colors)) - cast(*void)(*instance)) == 48, "Mesh.colors has unexpected offset % instead of 48", ((cast(*void)(*instance.colors)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.colors)) == 8, "Mesh.colors has unexpected size % instead of 8", size_of(type_of(Mesh.colors)));
        assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 56, "Mesh.indices has unexpected offset % instead of 56", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.indices)) == 8, "Mesh.indices has unexpected size % instead of 8", size_of(type_of(Mesh.indices)));
        assert(((cast(*void)(*instance.animVertices)) - cast(*void)(*instance)) == 64, "Mesh.animVertices has unexpected offset % instead of 64", ((cast(*void)(*instance.animVertices)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.animVertices)) == 8, "Mesh.animVertices has unexpected size % instead of 8", size_of(type_of(Mesh.animVertices)));
        assert(((cast(*void)(*instance.animNormals)) - cast(*void)(*instance)) == 72, "Mesh.animNormals has unexpected offset % instead of 72", ((cast(*void)(*instance.animNormals)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.animNormals)) == 8, "Mesh.animNormals has unexpected size % instead of 8", size_of(type_of(Mesh.animNormals)));
        assert(((cast(*void)(*instance.boneIds)) - cast(*void)(*instance)) == 80, "Mesh.boneIds has unexpected offset % instead of 80", ((cast(*void)(*instance.boneIds)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.boneIds)) == 8, "Mesh.boneIds has unexpected size % instead of 8", size_of(type_of(Mesh.boneIds)));
        assert(((cast(*void)(*instance.boneWeights)) - cast(*void)(*instance)) == 88, "Mesh.boneWeights has unexpected offset % instead of 88", ((cast(*void)(*instance.boneWeights)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.boneWeights)) == 8, "Mesh.boneWeights has unexpected size % instead of 8", size_of(type_of(Mesh.boneWeights)));
        assert(((cast(*void)(*instance.vaoId)) - cast(*void)(*instance)) == 96, "Mesh.vaoId has unexpected offset % instead of 96", ((cast(*void)(*instance.vaoId)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.vaoId)) == 4, "Mesh.vaoId has unexpected size % instead of 4", size_of(type_of(Mesh.vaoId)));
        assert(((cast(*void)(*instance.vboId)) - cast(*void)(*instance)) == 104, "Mesh.vboId has unexpected offset % instead of 104", ((cast(*void)(*instance.vboId)) - cast(*void)(*instance)));
        assert(size_of(type_of(Mesh.vboId)) == 8, "Mesh.vboId has unexpected size % instead of 8", size_of(type_of(Mesh.vboId)));
        assert(size_of(Mesh) == 112, "Mesh has size % instead of 112", size_of(Mesh));
    }

    {
        instance: Shader;
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 0, "Shader.id has unexpected offset % instead of 0", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(Shader.id)) == 4, "Shader.id has unexpected size % instead of 4", size_of(type_of(Shader.id)));
        assert(((cast(*void)(*instance.locs)) - cast(*void)(*instance)) == 8, "Shader.locs has unexpected offset % instead of 8", ((cast(*void)(*instance.locs)) - cast(*void)(*instance)));
        assert(size_of(type_of(Shader.locs)) == 8, "Shader.locs has unexpected size % instead of 8", size_of(type_of(Shader.locs)));
        assert(size_of(Shader) == 16, "Shader has size % instead of 16", size_of(Shader));
    }

    {
        instance: MaterialMap;
        assert(((cast(*void)(*instance.texture)) - cast(*void)(*instance)) == 0, "MaterialMap.texture has unexpected offset % instead of 0", ((cast(*void)(*instance.texture)) - cast(*void)(*instance)));
        assert(size_of(type_of(MaterialMap.texture)) == 20, "MaterialMap.texture has unexpected size % instead of 20", size_of(type_of(MaterialMap.texture)));
        assert(((cast(*void)(*instance.color)) - cast(*void)(*instance)) == 20, "MaterialMap.color has unexpected offset % instead of 20", ((cast(*void)(*instance.color)) - cast(*void)(*instance)));
        assert(size_of(type_of(MaterialMap.color)) == 4, "MaterialMap.color has unexpected size % instead of 4", size_of(type_of(MaterialMap.color)));
        assert(((cast(*void)(*instance.value)) - cast(*void)(*instance)) == 24, "MaterialMap.value has unexpected offset % instead of 24", ((cast(*void)(*instance.value)) - cast(*void)(*instance)));
        assert(size_of(type_of(MaterialMap.value)) == 4, "MaterialMap.value has unexpected size % instead of 4", size_of(type_of(MaterialMap.value)));
        assert(size_of(MaterialMap) == 28, "MaterialMap has size % instead of 28", size_of(MaterialMap));
    }

    {
        instance: Material;
        assert(((cast(*void)(*instance.shader)) - cast(*void)(*instance)) == 0, "Material.shader has unexpected offset % instead of 0", ((cast(*void)(*instance.shader)) - cast(*void)(*instance)));
        assert(size_of(type_of(Material.shader)) == 16, "Material.shader has unexpected size % instead of 16", size_of(type_of(Material.shader)));
        assert(((cast(*void)(*instance.maps)) - cast(*void)(*instance)) == 16, "Material.maps has unexpected offset % instead of 16", ((cast(*void)(*instance.maps)) - cast(*void)(*instance)));
        assert(size_of(type_of(Material.maps)) == 8, "Material.maps has unexpected size % instead of 8", size_of(type_of(Material.maps)));
        assert(((cast(*void)(*instance.params)) - cast(*void)(*instance)) == 24, "Material.params has unexpected offset % instead of 24", ((cast(*void)(*instance.params)) - cast(*void)(*instance)));
        assert(size_of(type_of(Material.params)) == 16, "Material.params has unexpected size % instead of 16", size_of(type_of(Material.params)));
        assert(size_of(Material) == 40, "Material has size % instead of 40", size_of(Material));
    }

    {
        instance: Transform;
        assert(((cast(*void)(*instance.translation)) - cast(*void)(*instance)) == 0, "Transform.translation has unexpected offset % instead of 0", ((cast(*void)(*instance.translation)) - cast(*void)(*instance)));
        assert(size_of(type_of(Transform.translation)) == 12, "Transform.translation has unexpected size % instead of 12", size_of(type_of(Transform.translation)));
        assert(((cast(*void)(*instance.rotation)) - cast(*void)(*instance)) == 12, "Transform.rotation has unexpected offset % instead of 12", ((cast(*void)(*instance.rotation)) - cast(*void)(*instance)));
        assert(size_of(type_of(Transform.rotation)) == 16, "Transform.rotation has unexpected size % instead of 16", size_of(type_of(Transform.rotation)));
        assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 28, "Transform.scale has unexpected offset % instead of 28", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
        assert(size_of(type_of(Transform.scale)) == 12, "Transform.scale has unexpected size % instead of 12", size_of(type_of(Transform.scale)));
        assert(size_of(Transform) == 40, "Transform has size % instead of 40", size_of(Transform));
    }

    {
        instance: BoneInfo;
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "BoneInfo.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(BoneInfo.name)) == 32, "BoneInfo.name has unexpected size % instead of 32", size_of(type_of(BoneInfo.name)));
        assert(((cast(*void)(*instance.parent)) - cast(*void)(*instance)) == 32, "BoneInfo.parent has unexpected offset % instead of 32", ((cast(*void)(*instance.parent)) - cast(*void)(*instance)));
        assert(size_of(type_of(BoneInfo.parent)) == 4, "BoneInfo.parent has unexpected size % instead of 4", size_of(type_of(BoneInfo.parent)));
        assert(size_of(BoneInfo) == 36, "BoneInfo has size % instead of 36", size_of(BoneInfo));
    }

    {
        instance: Model;
        assert(((cast(*void)(*instance.transform)) - cast(*void)(*instance)) == 0, "Model.transform has unexpected offset % instead of 0", ((cast(*void)(*instance.transform)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.transform)) == 64, "Model.transform has unexpected size % instead of 64", size_of(type_of(Model.transform)));
        assert(((cast(*void)(*instance.meshCount)) - cast(*void)(*instance)) == 64, "Model.meshCount has unexpected offset % instead of 64", ((cast(*void)(*instance.meshCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.meshCount)) == 4, "Model.meshCount has unexpected size % instead of 4", size_of(type_of(Model.meshCount)));
        assert(((cast(*void)(*instance.materialCount)) - cast(*void)(*instance)) == 68, "Model.materialCount has unexpected offset % instead of 68", ((cast(*void)(*instance.materialCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.materialCount)) == 4, "Model.materialCount has unexpected size % instead of 4", size_of(type_of(Model.materialCount)));
        assert(((cast(*void)(*instance.meshes)) - cast(*void)(*instance)) == 72, "Model.meshes has unexpected offset % instead of 72", ((cast(*void)(*instance.meshes)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.meshes)) == 8, "Model.meshes has unexpected size % instead of 8", size_of(type_of(Model.meshes)));
        assert(((cast(*void)(*instance.materials)) - cast(*void)(*instance)) == 80, "Model.materials has unexpected offset % instead of 80", ((cast(*void)(*instance.materials)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.materials)) == 8, "Model.materials has unexpected size % instead of 8", size_of(type_of(Model.materials)));
        assert(((cast(*void)(*instance.meshMaterial)) - cast(*void)(*instance)) == 88, "Model.meshMaterial has unexpected offset % instead of 88", ((cast(*void)(*instance.meshMaterial)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.meshMaterial)) == 8, "Model.meshMaterial has unexpected size % instead of 8", size_of(type_of(Model.meshMaterial)));
        assert(((cast(*void)(*instance.boneCount)) - cast(*void)(*instance)) == 96, "Model.boneCount has unexpected offset % instead of 96", ((cast(*void)(*instance.boneCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.boneCount)) == 4, "Model.boneCount has unexpected size % instead of 4", size_of(type_of(Model.boneCount)));
        assert(((cast(*void)(*instance.bones)) - cast(*void)(*instance)) == 104, "Model.bones has unexpected offset % instead of 104", ((cast(*void)(*instance.bones)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.bones)) == 8, "Model.bones has unexpected size % instead of 8", size_of(type_of(Model.bones)));
        assert(((cast(*void)(*instance.bindPose)) - cast(*void)(*instance)) == 112, "Model.bindPose has unexpected offset % instead of 112", ((cast(*void)(*instance.bindPose)) - cast(*void)(*instance)));
        assert(size_of(type_of(Model.bindPose)) == 8, "Model.bindPose has unexpected size % instead of 8", size_of(type_of(Model.bindPose)));
        assert(size_of(Model) == 120, "Model has size % instead of 120", size_of(Model));
    }

    {
        instance: ModelAnimation;
        assert(((cast(*void)(*instance.boneCount)) - cast(*void)(*instance)) == 0, "ModelAnimation.boneCount has unexpected offset % instead of 0", ((cast(*void)(*instance.boneCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(ModelAnimation.boneCount)) == 4, "ModelAnimation.boneCount has unexpected size % instead of 4", size_of(type_of(ModelAnimation.boneCount)));
        assert(((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)) == 4, "ModelAnimation.frameCount has unexpected offset % instead of 4", ((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(ModelAnimation.frameCount)) == 4, "ModelAnimation.frameCount has unexpected size % instead of 4", size_of(type_of(ModelAnimation.frameCount)));
        assert(((cast(*void)(*instance.bones)) - cast(*void)(*instance)) == 8, "ModelAnimation.bones has unexpected offset % instead of 8", ((cast(*void)(*instance.bones)) - cast(*void)(*instance)));
        assert(size_of(type_of(ModelAnimation.bones)) == 8, "ModelAnimation.bones has unexpected size % instead of 8", size_of(type_of(ModelAnimation.bones)));
        assert(((cast(*void)(*instance.framePoses)) - cast(*void)(*instance)) == 16, "ModelAnimation.framePoses has unexpected offset % instead of 16", ((cast(*void)(*instance.framePoses)) - cast(*void)(*instance)));
        assert(size_of(type_of(ModelAnimation.framePoses)) == 8, "ModelAnimation.framePoses has unexpected size % instead of 8", size_of(type_of(ModelAnimation.framePoses)));
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 24, "ModelAnimation.name has unexpected offset % instead of 24", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(ModelAnimation.name)) == 32, "ModelAnimation.name has unexpected size % instead of 32", size_of(type_of(ModelAnimation.name)));
        assert(size_of(ModelAnimation) == 56, "ModelAnimation has size % instead of 56", size_of(ModelAnimation));
    }

    {
        instance: Ray;
        assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 0, "Ray.position has unexpected offset % instead of 0", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
        assert(size_of(type_of(Ray.position)) == 12, "Ray.position has unexpected size % instead of 12", size_of(type_of(Ray.position)));
        assert(((cast(*void)(*instance.direction)) - cast(*void)(*instance)) == 12, "Ray.direction has unexpected offset % instead of 12", ((cast(*void)(*instance.direction)) - cast(*void)(*instance)));
        assert(size_of(type_of(Ray.direction)) == 12, "Ray.direction has unexpected size % instead of 12", size_of(type_of(Ray.direction)));
        assert(size_of(Ray) == 24, "Ray has size % instead of 24", size_of(Ray));
    }

    {
        instance: RayCollision;
        assert(((cast(*void)(*instance.hit)) - cast(*void)(*instance)) == 0, "RayCollision.hit has unexpected offset % instead of 0", ((cast(*void)(*instance.hit)) - cast(*void)(*instance)));
        assert(size_of(type_of(RayCollision.hit)) == 1, "RayCollision.hit has unexpected size % instead of 1", size_of(type_of(RayCollision.hit)));
        assert(((cast(*void)(*instance.distance)) - cast(*void)(*instance)) == 4, "RayCollision.distance has unexpected offset % instead of 4", ((cast(*void)(*instance.distance)) - cast(*void)(*instance)));
        assert(size_of(type_of(RayCollision.distance)) == 4, "RayCollision.distance has unexpected size % instead of 4", size_of(type_of(RayCollision.distance)));
        assert(((cast(*void)(*instance.point)) - cast(*void)(*instance)) == 8, "RayCollision.point has unexpected offset % instead of 8", ((cast(*void)(*instance.point)) - cast(*void)(*instance)));
        assert(size_of(type_of(RayCollision.point)) == 12, "RayCollision.point has unexpected size % instead of 12", size_of(type_of(RayCollision.point)));
        assert(((cast(*void)(*instance.normal)) - cast(*void)(*instance)) == 20, "RayCollision.normal has unexpected offset % instead of 20", ((cast(*void)(*instance.normal)) - cast(*void)(*instance)));
        assert(size_of(type_of(RayCollision.normal)) == 12, "RayCollision.normal has unexpected size % instead of 12", size_of(type_of(RayCollision.normal)));
        assert(size_of(RayCollision) == 32, "RayCollision has size % instead of 32", size_of(RayCollision));
    }

    {
        instance: BoundingBox;
        assert(((cast(*void)(*instance.min)) - cast(*void)(*instance)) == 0, "BoundingBox.min has unexpected offset % instead of 0", ((cast(*void)(*instance.min)) - cast(*void)(*instance)));
        assert(size_of(type_of(BoundingBox.min)) == 12, "BoundingBox.min has unexpected size % instead of 12", size_of(type_of(BoundingBox.min)));
        assert(((cast(*void)(*instance.max)) - cast(*void)(*instance)) == 12, "BoundingBox.max has unexpected offset % instead of 12", ((cast(*void)(*instance.max)) - cast(*void)(*instance)));
        assert(size_of(type_of(BoundingBox.max)) == 12, "BoundingBox.max has unexpected size % instead of 12", size_of(type_of(BoundingBox.max)));
        assert(size_of(BoundingBox) == 24, "BoundingBox has size % instead of 24", size_of(BoundingBox));
    }

    {
        instance: Wave;
        assert(((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)) == 0, "Wave.frameCount has unexpected offset % instead of 0", ((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Wave.frameCount)) == 4, "Wave.frameCount has unexpected size % instead of 4", size_of(type_of(Wave.frameCount)));
        assert(((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)) == 4, "Wave.sampleRate has unexpected offset % instead of 4", ((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)));
        assert(size_of(type_of(Wave.sampleRate)) == 4, "Wave.sampleRate has unexpected size % instead of 4", size_of(type_of(Wave.sampleRate)));
        assert(((cast(*void)(*instance.sampleSize)) - cast(*void)(*instance)) == 8, "Wave.sampleSize has unexpected offset % instead of 8", ((cast(*void)(*instance.sampleSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(Wave.sampleSize)) == 4, "Wave.sampleSize has unexpected size % instead of 4", size_of(type_of(Wave.sampleSize)));
        assert(((cast(*void)(*instance.channels)) - cast(*void)(*instance)) == 12, "Wave.channels has unexpected offset % instead of 12", ((cast(*void)(*instance.channels)) - cast(*void)(*instance)));
        assert(size_of(type_of(Wave.channels)) == 4, "Wave.channels has unexpected size % instead of 4", size_of(type_of(Wave.channels)));
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 16, "Wave.data has unexpected offset % instead of 16", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(Wave.data)) == 8, "Wave.data has unexpected size % instead of 8", size_of(type_of(Wave.data)));
        assert(size_of(Wave) == 24, "Wave has size % instead of 24", size_of(Wave));
    }

    {
        instance: AudioStream;
        assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 0, "AudioStream.buffer has unexpected offset % instead of 0", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
        assert(size_of(type_of(AudioStream.buffer)) == 8, "AudioStream.buffer has unexpected size % instead of 8", size_of(type_of(AudioStream.buffer)));
        assert(((cast(*void)(*instance.processor)) - cast(*void)(*instance)) == 8, "AudioStream.processor has unexpected offset % instead of 8", ((cast(*void)(*instance.processor)) - cast(*void)(*instance)));
        assert(size_of(type_of(AudioStream.processor)) == 8, "AudioStream.processor has unexpected size % instead of 8", size_of(type_of(AudioStream.processor)));
        assert(((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)) == 16, "AudioStream.sampleRate has unexpected offset % instead of 16", ((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)));
        assert(size_of(type_of(AudioStream.sampleRate)) == 4, "AudioStream.sampleRate has unexpected size % instead of 4", size_of(type_of(AudioStream.sampleRate)));
        assert(((cast(*void)(*instance.sampleSize)) - cast(*void)(*instance)) == 20, "AudioStream.sampleSize has unexpected offset % instead of 20", ((cast(*void)(*instance.sampleSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(AudioStream.sampleSize)) == 4, "AudioStream.sampleSize has unexpected size % instead of 4", size_of(type_of(AudioStream.sampleSize)));
        assert(((cast(*void)(*instance.channels)) - cast(*void)(*instance)) == 24, "AudioStream.channels has unexpected offset % instead of 24", ((cast(*void)(*instance.channels)) - cast(*void)(*instance)));
        assert(size_of(type_of(AudioStream.channels)) == 4, "AudioStream.channels has unexpected size % instead of 4", size_of(type_of(AudioStream.channels)));
        assert(size_of(AudioStream) == 32, "AudioStream has size % instead of 32", size_of(AudioStream));
    }

    {
        instance: Sound;
        assert(((cast(*void)(*instance.stream)) - cast(*void)(*instance)) == 0, "Sound.stream has unexpected offset % instead of 0", ((cast(*void)(*instance.stream)) - cast(*void)(*instance)));
        assert(size_of(type_of(Sound.stream)) == 32, "Sound.stream has unexpected size % instead of 32", size_of(type_of(Sound.stream)));
        assert(((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)) == 32, "Sound.frameCount has unexpected offset % instead of 32", ((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Sound.frameCount)) == 4, "Sound.frameCount has unexpected size % instead of 4", size_of(type_of(Sound.frameCount)));
        assert(size_of(Sound) == 40, "Sound has size % instead of 40", size_of(Sound));
    }

    {
        instance: Music;
        assert(((cast(*void)(*instance.stream)) - cast(*void)(*instance)) == 0, "Music.stream has unexpected offset % instead of 0", ((cast(*void)(*instance.stream)) - cast(*void)(*instance)));
        assert(size_of(type_of(Music.stream)) == 32, "Music.stream has unexpected size % instead of 32", size_of(type_of(Music.stream)));
        assert(((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)) == 32, "Music.frameCount has unexpected offset % instead of 32", ((cast(*void)(*instance.frameCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(Music.frameCount)) == 4, "Music.frameCount has unexpected size % instead of 4", size_of(type_of(Music.frameCount)));
        assert(((cast(*void)(*instance.looping)) - cast(*void)(*instance)) == 36, "Music.looping has unexpected offset % instead of 36", ((cast(*void)(*instance.looping)) - cast(*void)(*instance)));
        assert(size_of(type_of(Music.looping)) == 1, "Music.looping has unexpected size % instead of 1", size_of(type_of(Music.looping)));
        assert(((cast(*void)(*instance.ctxType)) - cast(*void)(*instance)) == 40, "Music.ctxType has unexpected offset % instead of 40", ((cast(*void)(*instance.ctxType)) - cast(*void)(*instance)));
        assert(size_of(type_of(Music.ctxType)) == 4, "Music.ctxType has unexpected size % instead of 4", size_of(type_of(Music.ctxType)));
        assert(((cast(*void)(*instance.ctxData)) - cast(*void)(*instance)) == 48, "Music.ctxData has unexpected offset % instead of 48", ((cast(*void)(*instance.ctxData)) - cast(*void)(*instance)));
        assert(size_of(type_of(Music.ctxData)) == 8, "Music.ctxData has unexpected size % instead of 8", size_of(type_of(Music.ctxData)));
        assert(size_of(Music) == 56, "Music has size % instead of 56", size_of(Music));
    }

    {
        instance: VrDeviceInfo;
        assert(((cast(*void)(*instance.hResolution)) - cast(*void)(*instance)) == 0, "VrDeviceInfo.hResolution has unexpected offset % instead of 0", ((cast(*void)(*instance.hResolution)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.hResolution)) == 4, "VrDeviceInfo.hResolution has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.hResolution)));
        assert(((cast(*void)(*instance.vResolution)) - cast(*void)(*instance)) == 4, "VrDeviceInfo.vResolution has unexpected offset % instead of 4", ((cast(*void)(*instance.vResolution)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.vResolution)) == 4, "VrDeviceInfo.vResolution has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.vResolution)));
        assert(((cast(*void)(*instance.hScreenSize)) - cast(*void)(*instance)) == 8, "VrDeviceInfo.hScreenSize has unexpected offset % instead of 8", ((cast(*void)(*instance.hScreenSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.hScreenSize)) == 4, "VrDeviceInfo.hScreenSize has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.hScreenSize)));
        assert(((cast(*void)(*instance.vScreenSize)) - cast(*void)(*instance)) == 12, "VrDeviceInfo.vScreenSize has unexpected offset % instead of 12", ((cast(*void)(*instance.vScreenSize)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.vScreenSize)) == 4, "VrDeviceInfo.vScreenSize has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.vScreenSize)));
        assert(((cast(*void)(*instance.vScreenCenter)) - cast(*void)(*instance)) == 16, "VrDeviceInfo.vScreenCenter has unexpected offset % instead of 16", ((cast(*void)(*instance.vScreenCenter)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.vScreenCenter)) == 4, "VrDeviceInfo.vScreenCenter has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.vScreenCenter)));
        assert(((cast(*void)(*instance.eyeToScreenDistance)) - cast(*void)(*instance)) == 20, "VrDeviceInfo.eyeToScreenDistance has unexpected offset % instead of 20", ((cast(*void)(*instance.eyeToScreenDistance)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.eyeToScreenDistance)) == 4, "VrDeviceInfo.eyeToScreenDistance has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.eyeToScreenDistance)));
        assert(((cast(*void)(*instance.lensSeparationDistance)) - cast(*void)(*instance)) == 24, "VrDeviceInfo.lensSeparationDistance has unexpected offset % instead of 24", ((cast(*void)(*instance.lensSeparationDistance)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.lensSeparationDistance)) == 4, "VrDeviceInfo.lensSeparationDistance has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.lensSeparationDistance)));
        assert(((cast(*void)(*instance.interpupillaryDistance)) - cast(*void)(*instance)) == 28, "VrDeviceInfo.interpupillaryDistance has unexpected offset % instead of 28", ((cast(*void)(*instance.interpupillaryDistance)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.interpupillaryDistance)) == 4, "VrDeviceInfo.interpupillaryDistance has unexpected size % instead of 4", size_of(type_of(VrDeviceInfo.interpupillaryDistance)));
        assert(((cast(*void)(*instance.lensDistortionValues)) - cast(*void)(*instance)) == 32, "VrDeviceInfo.lensDistortionValues has unexpected offset % instead of 32", ((cast(*void)(*instance.lensDistortionValues)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.lensDistortionValues)) == 16, "VrDeviceInfo.lensDistortionValues has unexpected size % instead of 16", size_of(type_of(VrDeviceInfo.lensDistortionValues)));
        assert(((cast(*void)(*instance.chromaAbCorrection)) - cast(*void)(*instance)) == 48, "VrDeviceInfo.chromaAbCorrection has unexpected offset % instead of 48", ((cast(*void)(*instance.chromaAbCorrection)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrDeviceInfo.chromaAbCorrection)) == 16, "VrDeviceInfo.chromaAbCorrection has unexpected size % instead of 16", size_of(type_of(VrDeviceInfo.chromaAbCorrection)));
        assert(size_of(VrDeviceInfo) == 64, "VrDeviceInfo has size % instead of 64", size_of(VrDeviceInfo));
    }

    {
        instance: VrStereoConfig;
        assert(((cast(*void)(*instance.projection)) - cast(*void)(*instance)) == 0, "VrStereoConfig.projection has unexpected offset % instead of 0", ((cast(*void)(*instance.projection)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.projection)) == 128, "VrStereoConfig.projection has unexpected size % instead of 128", size_of(type_of(VrStereoConfig.projection)));
        assert(((cast(*void)(*instance.viewOffset)) - cast(*void)(*instance)) == 128, "VrStereoConfig.viewOffset has unexpected offset % instead of 128", ((cast(*void)(*instance.viewOffset)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.viewOffset)) == 128, "VrStereoConfig.viewOffset has unexpected size % instead of 128", size_of(type_of(VrStereoConfig.viewOffset)));
        assert(((cast(*void)(*instance.leftLensCenter)) - cast(*void)(*instance)) == 256, "VrStereoConfig.leftLensCenter has unexpected offset % instead of 256", ((cast(*void)(*instance.leftLensCenter)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.leftLensCenter)) == 8, "VrStereoConfig.leftLensCenter has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.leftLensCenter)));
        assert(((cast(*void)(*instance.rightLensCenter)) - cast(*void)(*instance)) == 264, "VrStereoConfig.rightLensCenter has unexpected offset % instead of 264", ((cast(*void)(*instance.rightLensCenter)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.rightLensCenter)) == 8, "VrStereoConfig.rightLensCenter has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.rightLensCenter)));
        assert(((cast(*void)(*instance.leftScreenCenter)) - cast(*void)(*instance)) == 272, "VrStereoConfig.leftScreenCenter has unexpected offset % instead of 272", ((cast(*void)(*instance.leftScreenCenter)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.leftScreenCenter)) == 8, "VrStereoConfig.leftScreenCenter has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.leftScreenCenter)));
        assert(((cast(*void)(*instance.rightScreenCenter)) - cast(*void)(*instance)) == 280, "VrStereoConfig.rightScreenCenter has unexpected offset % instead of 280", ((cast(*void)(*instance.rightScreenCenter)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.rightScreenCenter)) == 8, "VrStereoConfig.rightScreenCenter has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.rightScreenCenter)));
        assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 288, "VrStereoConfig.scale has unexpected offset % instead of 288", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.scale)) == 8, "VrStereoConfig.scale has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.scale)));
        assert(((cast(*void)(*instance.scaleIn)) - cast(*void)(*instance)) == 296, "VrStereoConfig.scaleIn has unexpected offset % instead of 296", ((cast(*void)(*instance.scaleIn)) - cast(*void)(*instance)));
        assert(size_of(type_of(VrStereoConfig.scaleIn)) == 8, "VrStereoConfig.scaleIn has unexpected size % instead of 8", size_of(type_of(VrStereoConfig.scaleIn)));
        assert(size_of(VrStereoConfig) == 304, "VrStereoConfig has size % instead of 304", size_of(VrStereoConfig));
    }

    {
        instance: FilePathList;
        assert(((cast(*void)(*instance.capacity)) - cast(*void)(*instance)) == 0, "FilePathList.capacity has unexpected offset % instead of 0", ((cast(*void)(*instance.capacity)) - cast(*void)(*instance)));
        assert(size_of(type_of(FilePathList.capacity)) == 4, "FilePathList.capacity has unexpected size % instead of 4", size_of(type_of(FilePathList.capacity)));
        assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 4, "FilePathList.count has unexpected offset % instead of 4", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
        assert(size_of(type_of(FilePathList.count)) == 4, "FilePathList.count has unexpected size % instead of 4", size_of(type_of(FilePathList.count)));
        assert(((cast(*void)(*instance.paths)) - cast(*void)(*instance)) == 8, "FilePathList.paths has unexpected offset % instead of 8", ((cast(*void)(*instance.paths)) - cast(*void)(*instance)));
        assert(size_of(type_of(FilePathList.paths)) == 8, "FilePathList.paths has unexpected size % instead of 8", size_of(type_of(FilePathList.paths)));
        assert(size_of(FilePathList) == 16, "FilePathList has size % instead of 16", size_of(FilePathList));
    }

    {
        instance: AutomationEvent;
        assert(((cast(*void)(*instance.frame)) - cast(*void)(*instance)) == 0, "AutomationEvent.frame has unexpected offset % instead of 0", ((cast(*void)(*instance.frame)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEvent.frame)) == 4, "AutomationEvent.frame has unexpected size % instead of 4", size_of(type_of(AutomationEvent.frame)));
        assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 4, "AutomationEvent.type has unexpected offset % instead of 4", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEvent.type)) == 4, "AutomationEvent.type has unexpected size % instead of 4", size_of(type_of(AutomationEvent.type)));
        assert(((cast(*void)(*instance.params)) - cast(*void)(*instance)) == 8, "AutomationEvent.params has unexpected offset % instead of 8", ((cast(*void)(*instance.params)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEvent.params)) == 16, "AutomationEvent.params has unexpected size % instead of 16", size_of(type_of(AutomationEvent.params)));
        assert(size_of(AutomationEvent) == 24, "AutomationEvent has size % instead of 24", size_of(AutomationEvent));
    }

    {
        instance: AutomationEventList;
        assert(((cast(*void)(*instance.capacity)) - cast(*void)(*instance)) == 0, "AutomationEventList.capacity has unexpected offset % instead of 0", ((cast(*void)(*instance.capacity)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEventList.capacity)) == 4, "AutomationEventList.capacity has unexpected size % instead of 4", size_of(type_of(AutomationEventList.capacity)));
        assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 4, "AutomationEventList.count has unexpected offset % instead of 4", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEventList.count)) == 4, "AutomationEventList.count has unexpected size % instead of 4", size_of(type_of(AutomationEventList.count)));
        assert(((cast(*void)(*instance.events)) - cast(*void)(*instance)) == 8, "AutomationEventList.events has unexpected offset % instead of 8", ((cast(*void)(*instance.events)) - cast(*void)(*instance)));
        assert(size_of(type_of(AutomationEventList.events)) == 8, "AutomationEventList.events has unexpected size % instead of 8", size_of(type_of(AutomationEventList.events)));
        assert(size_of(AutomationEventList) == 16, "AutomationEventList has size % instead of 16", size_of(AutomationEventList));
    }

    {
        instance: GuiStyleProp;
        assert(((cast(*void)(*instance.controlId)) - cast(*void)(*instance)) == 0, "GuiStyleProp.controlId has unexpected offset % instead of 0", ((cast(*void)(*instance.controlId)) - cast(*void)(*instance)));
        assert(size_of(type_of(GuiStyleProp.controlId)) == 2, "GuiStyleProp.controlId has unexpected size % instead of 2", size_of(type_of(GuiStyleProp.controlId)));
        assert(((cast(*void)(*instance.propertyId)) - cast(*void)(*instance)) == 2, "GuiStyleProp.propertyId has unexpected offset % instead of 2", ((cast(*void)(*instance.propertyId)) - cast(*void)(*instance)));
        assert(size_of(type_of(GuiStyleProp.propertyId)) == 2, "GuiStyleProp.propertyId has unexpected size % instead of 2", size_of(type_of(GuiStyleProp.propertyId)));
        assert(((cast(*void)(*instance.propertyValue)) - cast(*void)(*instance)) == 4, "GuiStyleProp.propertyValue has unexpected offset % instead of 4", ((cast(*void)(*instance.propertyValue)) - cast(*void)(*instance)));
        assert(size_of(type_of(GuiStyleProp.propertyValue)) == 4, "GuiStyleProp.propertyValue has unexpected size % instead of 4", size_of(type_of(GuiStyleProp.propertyValue)));
        assert(size_of(GuiStyleProp) == 8, "GuiStyleProp has size % instead of 8", size_of(GuiStyleProp));
    }
}

#if OS == .WINDOWS {
    raygui ::      #library "windows/raygui";
} else #if OS == .LINUX {
    raygui :: #library "linux/raygui";
} else {
    #assert false;
}
