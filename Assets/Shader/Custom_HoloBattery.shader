//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/HoloBattery" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_EdgeColor ("EdgeColor", Color) = (1,0,0,1)
_Thickness ("Thickness", Float) = 0.004
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 31616
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1.x = u_xlat16_0.w!=0.0;
    if(u_xlatb1.x){
        u_xlat1.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture2D(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture2D(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture2D(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
        u_xlatb3 = u_xlat5==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        u_xlatb3 = u_xlat7==0.0;
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	float _Thickness;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat0.y = in_TEXCOORD0.y + _Thickness;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.yz = in_TEXCOORD0.yx + (-vec2(_Thickness));
    vs_TEXCOORD2.xy = u_xlat0.zw;
    u_xlat0.xw = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0.z = in_TEXCOORD0.x + _Thickness;
    vs_TEXCOORD4.xy = u_xlat0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _EdgeColor;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
bool u_xlatb3;
float u_xlat5;
float u_xlat7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1.x = u_xlat16_0.w!=0.0;
#endif
    if(u_xlatb1.x){
        u_xlat1.x = texture(_MainTex, vs_TEXCOORD1.xy).w;
        u_xlat1.y = texture(_MainTex, vs_TEXCOORD2.xy).w;
        u_xlat5 = texture(_MainTex, vs_TEXCOORD3.xy).w;
        u_xlat7 = texture(_MainTex, vs_TEXCOORD4.xy).w;
        u_xlatb1.xy = equal(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat5==0.0);
#else
        u_xlatb3 = u_xlat5==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat7==0.0);
#else
        u_xlatb3 = u_xlat7==0.0;
#endif
        u_xlatb1.x = u_xlatb3 || u_xlatb1.x;
        if(u_xlatb1.x){
            SV_Target0 = _EdgeColor;
            return;
        } else {
            SV_Target0 = _Color;
            return;
        //ENDIF
        }
    //ENDIF
    }
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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