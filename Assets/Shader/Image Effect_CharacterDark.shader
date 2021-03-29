//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Image Effect/CharacterDark" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 59698
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat10_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat10_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat10_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat10_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat10_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat10_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat10_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat10_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat10_3.w;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat10_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat10_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat10_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat10_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat10_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat10_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat10_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat10_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat10_3.w;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat10_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat10_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat10_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat10_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat10_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat10_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat10_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat10_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat10_3.w;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat16_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat16_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat16_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat16_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat16_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat16_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat16_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat16_3.w;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat16_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat16_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat16_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat16_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat16_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat16_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat16_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat16_3.w;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	float _BrightRadius;
uniform 	float _BrightSoft;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw + (-vec2(_CenterX, _CenterY));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xx + (-vec2(_Radius, _BrightRadius));
    u_xlat8.xy = vec2(1.0, 1.0) / (-vec2(_Soft, _BrightSoft));
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = u_xlat0.y * u_xlat0.x;
    u_xlat1 = u_xlat4.xxxx * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat2 = u_xlat4.xxxx * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat4.xyz = u_xlat0.xxx * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat1.yzw);
    u_xlat1.x = u_xlat0.x * 0.298999995 + u_xlat1.x;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat4.x * u_xlat16_3.y;
    u_xlat4.x = u_xlat1.x * u_xlat16_3.x + u_xlat4.x;
    SV_Target0.x = u_xlat4.y * u_xlat16_3.z + u_xlat4.x;
    u_xlat1.xy = u_xlat0.xx * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat0.xy = u_xlat0.xx * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat0.xy = u_xlat16_3.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    SV_Target0.z = u_xlat1.y * u_xlat16_3.z + u_xlat0.x;
    u_xlat0.x = u_xlat16_3.y * u_xlat1.x;
    u_xlat0.x = u_xlat4.z * u_xlat16_3.x + u_xlat0.x;
    SV_Target0.y = u_xlat4.y * u_xlat16_3.z + u_xlat0.x;
    SV_Target0.w = u_xlat16_3.w;
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