//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Image Effect/CameraFreeze" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Radius ("Radius", Float) = 1
_Soft ("Soft", Float) = 1
_NoiseTex ("Noise Texture", 2D) = "white" { }
_Color ("Noise Color", Color) = (1,1,1,1)
_Saturate ("Noise Saturate", Float) = 1
_Dist ("Distortion Amount", Float) = 0.1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 14419
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_1 = texture2D(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat10_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_1 = texture2D(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat10_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_1 = texture2D(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat10_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_1 = texture(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat16_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_1 = texture(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat16_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	float _Radius;
uniform 	float _Soft;
uniform 	mediump vec4 _Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _Saturate;
uniform 	float _Dist;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_0.x = sqrt(u_xlat16_0.x);
    u_xlat0 = u_xlat16_0.x + (-_Radius);
    u_xlat4.x = float(1.0) / (-_Soft);
    u_xlat0 = u_xlat4.x * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat4.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_1 = texture(_NoiseTex, u_xlat4.xy);
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat2 = u_xlat16_1 * vec4(_Saturate);
    u_xlat4.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = u_xlat4.x * _SinTime.z;
    u_xlat3.y = u_xlat4.y * _CosTime.z;
    u_xlat4.xy = u_xlat3.xy * vec2(vec2(_Dist, _Dist)) + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = (-u_xlat16_1) * vec4(_Saturate) + u_xlat16_3;
    SV_Target0 = vec4(u_xlat0) * u_xlat1 + u_xlat2;
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