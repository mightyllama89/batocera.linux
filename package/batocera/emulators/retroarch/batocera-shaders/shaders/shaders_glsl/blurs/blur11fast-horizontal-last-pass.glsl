// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _blur_dxdy;
COMPAT_VARYING     vec2 _tex_uv1;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _tex_uv1;
    vec2 _blur_dxdy;
};
out_vertex _ret_0;
input_dummy _IN1;
vec4 _r0006;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _dxdy_scale;
    vec2 _dxdy;
    _r0006 = VertexCoord.x*MVPMatrix[0];
    _r0006 = _r0006 + VertexCoord.y*MVPMatrix[1];
    _r0006 = _r0006 + VertexCoord.z*MVPMatrix[2];
    _r0006 = _r0006 + VertexCoord.w*MVPMatrix[3];
    _dxdy_scale = InputSize/OutputSize;
    _dxdy = _dxdy_scale/TextureSize;
    _OUT._blur_dxdy = vec2(_dxdy.x, 0.00000000E+00);
    _ret_0._position1 = _r0006;
    _ret_0._tex_uv1 = TexCoord.xy;
    _ret_0._blur_dxdy = _OUT._blur_dxdy;
    gl_Position = _r0006;
    TEX0.xy = TexCoord.xy;
    TEX1.xy = _OUT._blur_dxdy;
    return;
    TEX0.xy = _ret_0._tex_uv1;
    TEX1.xy = _ret_0._blur_dxdy;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _blur_dxdy;
COMPAT_VARYING     vec2 _tex_uv1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _tex_uv1;
    vec2 _blur_dxdy;
};
vec4 _ret_0;
vec3 _TMP1;
float _TMP10;
float _TMP9;
float _TMP8;
vec4 _TMP11;
uniform sampler2D Texture;
vec3 _TMP17;
float _weight_sum_inv0020;
float _w010020;
float _w230020;
float _w450020;
float _w01_ratio0020;
float _w23_ratio0020;
float _w45_ratio0020;
vec3 _sum0020;
float _TMP21;
float _TMP25;
float _TMP29;
float _TMP33;
float _TMP37;
vec2 _tex_coords0042;
vec2 _tex_coords0048;
vec2 _tex_coords0054;
vec2 _tex_coords0060;
vec2 _tex_coords0066;
vec2 _tex_coords0072;
vec4 _color0078;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _TMP21 = pow(2.71828198E+00, -1.07180931E-01);
    _TMP25 = pow(2.71828198E+00, -4.28723723E-01);
    _TMP29 = pow(2.71828198E+00, -9.64628398E-01);
    _TMP33 = pow(2.71828198E+00, -1.71489489E+00);
    _TMP37 = pow(2.71828198E+00, -2.67952323E+00);
    _weight_sum_inv0020 = 1.00000000E+00/(1.00000000E+00 + 2.00000000E+00*(_TMP21 + _TMP25 + _TMP29 + _TMP33 + _TMP37));
    _w010020 = 5.00000000E-01 + _TMP21;
    _w230020 = _TMP25 + _TMP29;
    _w450020 = _TMP33 + _TMP37;
    _w01_ratio0020 = _TMP21/_w010020;
    _w23_ratio0020 = _TMP29/_w230020;
    _w45_ratio0020 = _TMP37/_w450020;
    _tex_coords0042 = TEX0.xy - (4.00000000E+00 + _w45_ratio0020)*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0042);
    _sum0020 = _w450020*_TMP11.xyz;
    _tex_coords0048 = TEX0.xy - (2.00000000E+00 + _w23_ratio0020)*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0048);
    _sum0020 = _sum0020 + _w230020*_TMP11.xyz;
    _tex_coords0054 = TEX0.xy - _w01_ratio0020*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0054);
    _sum0020 = _sum0020 + _w010020*_TMP11.xyz;
    _tex_coords0060 = TEX0.xy + _w01_ratio0020*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0060);
    _sum0020 = _sum0020 + _w010020*_TMP11.xyz;
    _tex_coords0066 = TEX0.xy + (2.00000000E+00 + _w23_ratio0020)*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0066);
    _sum0020 = _sum0020 + _w230020*_TMP11.xyz;
    _tex_coords0072 = TEX0.xy + (4.00000000E+00 + _w45_ratio0020)*TEX1.xy;
    _TMP11 = COMPAT_TEXTURE(Texture, _tex_coords0072);
    _sum0020 = _sum0020 + _w450020*_TMP11.xyz;
    _TMP17 = _sum0020*_weight_sum_inv0020;
    _color0078 = vec4(_TMP17.x, _TMP17.y, _TMP17.z, 1.00000000E+00);
    _TMP8 = pow(_color0078.x, 4.54545438E-01);
    _TMP9 = pow(_color0078.y, 4.54545438E-01);
    _TMP10 = pow(_color0078.z, 4.54545438E-01);
    _TMP1 = vec3(_TMP8, _TMP9, _TMP10);
    _ret_0 = vec4(_TMP1.x, _TMP1.y, _TMP1.z, _color0078.w);
    FragColor = _ret_0;
    return;
} 
#endif
