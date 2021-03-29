//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/WhiteOutline" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 55647
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "HIT_ON" "DUMMY" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture2D(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture2D(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
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
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bvec3 u_xlatb5;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
    u_xlat1.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat1.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_0 = vs_TEXCOORD0.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
    u_xlat5.x = texture(_MainTex, u_xlat16_0.xy).w;
    u_xlat5.y = texture(_MainTex, u_xlat16_0.zw).w;
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.100000001, 0.100000001, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb5.x || u_xlatb1.x;
    u_xlatb1.x = u_xlatb5.y || u_xlatb1.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb5.xyz = lessThan(u_xlat16_2.xyzz, vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001)).xyz;
    u_xlatb5.x = u_xlatb5.y && u_xlatb5.x;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.899999976<u_xlat16_0.w);
#else
    u_xlatb9 = 0.899999976<u_xlat16_0.w;
#endif
    SV_Target0.w = u_xlat16_0.w;
    u_xlatb5.x = u_xlatb9 && u_xlatb5.x;
    u_xlat16_3.xyz = (u_xlatb5.x) ? vec3(1.0, 1.0, 1.0) : u_xlat16_2.xyz;
    SV_Target0.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DUMMY" "HIT_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "HIT_ON" "DUMMY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PIXELSNAP_ON" "HIT_ON" }
""
}
}
}
}
}