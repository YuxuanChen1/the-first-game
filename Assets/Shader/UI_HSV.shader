//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/HSV" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
_HueShift ("HueShift", Float) = 0
_Sat ("Saturation", Float) = 1
_Val ("Value", Float) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 57079
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat16_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat16_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	float _HueShift;
uniform 	float _Sat;
uniform 	float _Val;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0 = _HueShift * 0.0174532942;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat4.x = _Sat * _Val;
    u_xlat8 = u_xlat1.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat16_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat8 = u_xlat8 * u_xlat16_3.y;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
    u_xlat1.z = u_xlat8 * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat2.x;
    u_xlat8 = u_xlat16_3.y * u_xlat8;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x + u_xlat8;
    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
    u_xlat1.x = u_xlat2.x * u_xlat16_3.z + u_xlat4.x;
    u_xlat4.x = u_xlat16_3.x * u_xlat2.z;
    u_xlat4.x = u_xlat12 * u_xlat16_3.y + u_xlat4.x;
    u_xlat1.y = u_xlat0 * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.w = u_xlat16_3.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
}