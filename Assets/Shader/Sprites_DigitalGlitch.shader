//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sprites/DigitalGlitch" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_GlitchInterval ("Glitch interval time [seconds]", Float) = 0.16
_DispProbability ("Displacement Glitch Probability", Float) = 0.022
_DispIntensity ("Displacement Glitch Intensity", Float) = 0.09
_ColorProbability ("Color Glitch Probability", Float) = 0.02
_ColorIntensity ("Color Glitch Intensity", Float) = 0.07
_Saturator ("Saturator", Float) = 1
_SaturateProbability ("Color Saturate Probability", Float) = 0.02
_SaturateIntensity ("Color Saturate Intensity", Float) = 0.5
[MaterialToggle] _WrapDispCoords ("Wrap disp glitch (off = clamp)", Float) = 1
[MaterialToggle] _DispGlitchOn ("Displacement Glitch On", Float) = 1
[MaterialToggle] _ColorGlitchOn ("Color Glitch On", Float) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 36664
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec2 u_xlat10_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_1.xw = texture2D(_MainTex, u_xlat3.xz).xw;
    u_xlat10_3.xy = texture2D(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat10_1.w + u_xlat10_3.y;
    u_xlat16_12 = u_xlat10_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlatb5 = u_xlat1.y<_ColorProbability;
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat10_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat10_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat10_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform 	float _SaturateProbability;
uniform 	float _SaturateIntensity;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump float u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat16_2.x = fract(abs(u_xlat0.x));
    u_xlat16_7 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat16_2.x = (u_xlatb10) ? u_xlat16_2.x : (-u_xlat16_2.x);
    u_xlatb0.xzw = equal(vec4(_DispGlitchOn, _DispGlitchOn, _WrapDispCoords, _ColorGlitchOn), vec4(1.0, 0.0, 1.0, 1.0)).xzw;
    u_xlat16_2.x = (u_xlatb0.z) ? u_xlat16_2.x : u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x<_DispProbability);
#else
    u_xlatb10 = u_xlat1.x<_DispProbability;
#endif
    u_xlatb0.x = u_xlatb0.x && u_xlatb10;
    u_xlat16_2.x = (u_xlatb0.x) ? u_xlat16_2.x : vs_TEXCOORD0.x;
    u_xlat3.x = u_xlat5.x * _ColorIntensity + u_xlat16_2.x;
    u_xlat3.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat16_0.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat1.xw = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlat3.xy = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat16_2.xx;
    u_xlat3.zw = u_xlat1.xw * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat16_1.xw = texture(_MainTex, u_xlat3.xz).xw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.yw).yw;
    u_xlat16_12 = u_xlat16_1.w + u_xlat16_3.y;
    u_xlat16_12 = u_xlat16_0.y + u_xlat16_12;
    u_xlat16_12 = u_xlat16_12 * 0.333333343;
    u_xlat16_2.y = vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat16_2.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.y<_ColorProbability);
#else
    u_xlatb5 = u_xlat1.y<_ColorProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.z<_SaturateProbability);
#else
    u_xlatb10 = u_xlat1.z<_SaturateProbability;
#endif
    u_xlatb5 = u_xlatb0.w && u_xlatb5;
    u_xlat16_2.w = (u_xlatb5) ? u_xlat16_12 : u_xlat4.w;
    u_xlat16_2.z = (u_xlatb5) ? u_xlat16_0.x : u_xlat4.z;
    u_xlat16_2.x = (u_xlatb5) ? u_xlat16_1.x : u_xlat4.x;
    u_xlat16_2.y = (u_xlatb5) ? u_xlat16_3.x : u_xlat4.y;
    u_xlat16_1 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.x = _SaturateIntensity + _Saturator;
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : _Saturator;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
""
}
}
}
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 94288
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }

void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
    u_xlatb3 = _WrapDispCoords==1.0;
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
    u_xlatb1 = u_xlat1<_DispProbability;
    u_xlatb3 = _DispGlitchOn==1.0;
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _GlitchInterval;
uniform 	float _DispGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _Saturator;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat5;
bool u_xlatb5;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0.y * 5.0;
    u_xlat16_0.x = floor(u_xlat16_0.x);
    u_xlat1 = _Time.y / _GlitchInterval;
    u_xlat1 = floor(u_xlat1);
    u_xlat3.x = u_xlat1 * _GlitchInterval + u_xlat16_0.x;
    u_xlat5 = (-u_xlat1) * _GlitchInterval + u_xlat16_0.x;
    u_xlat3.x = u_xlat3.x * 78.2330017;
    u_xlat3.x = u_xlat5 * 12.9898005 + u_xlat3.x;
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + -0.5;
    u_xlat3.x = u_xlat3.x * _DispIntensity + vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb5 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat16_0.x = fract(abs(u_xlat3.x));
    u_xlat16_2 = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat16_0.x : (-u_xlat16_0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_WrapDispCoords==1.0);
#else
    u_xlatb3 = _WrapDispCoords==1.0;
#endif
    u_xlat16_0.x = (u_xlatb3) ? u_xlat16_0.x : u_xlat16_2;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat3.xy;
    u_xlat1 = u_xlat1 * _GlitchInterval + u_xlat3.x;
    u_xlat1 = u_xlat3.y + u_xlat1;
    u_xlat1 = u_xlat1 * -65.2432022;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * 43758.5469;
    u_xlat1 = fract(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1<_DispProbability);
#else
    u_xlatb1 = u_xlat1<_DispProbability;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_DispGlitchOn==1.0);
#else
    u_xlatb3 = _DispGlitchOn==1.0;
#endif
    u_xlatb1 = u_xlatb3 && u_xlatb1;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_0.x : vs_TEXCOORD0.x;
    u_xlat16_0.y = vs_TEXCOORD0.y;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.www;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_Saturator, _Saturator, _Saturator, _Saturator));
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" }
""
}
}
}
}
}