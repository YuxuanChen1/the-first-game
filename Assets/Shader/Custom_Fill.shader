//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Fill" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_Filter ("Filter", Color) = (1,1,1,1)
_FillMethod ("FillMethod", Float) = 1
_FillOrigin ("FillOrigin", Float) = 1
_FillAmount ("FillAmount", Range(0, 1)) = 1
_AngleOffset ("AngleOffest", Range(0, 360)) = 0
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 52867
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
    u_xlatb9 = _FillAmount<0.5;
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
        u_xlatb2 = u_xlat2<(-u_xlat2);
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
        u_xlatb9 = u_xlat9<u_xlat13;
        if(((int(u_xlatb9) * -1))!=0){discard;}
        u_xlatb9 = 0.0<u_xlat1.x;
        if(((int(u_xlatb9) * -1))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
        u_xlatb13 = u_xlat13<(-u_xlat13);
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
        u_xlatb1 = 0.0<u_xlat1.x;
        u_xlatb5 = u_xlat9<u_xlat5;
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * -1))!=0){discard;}
    //ENDIF
    }
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlatb1 = u_xlat16_0.w!=0.0;
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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
uniform 	mediump vec4 _Filter;
uniform 	mediump float _AngleOffset;
uniform 	mediump float _FillAmount;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
float u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
float u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat16_8 = _AngleOffset * 0.0174532942;
    u_xlat1.x = sin(u_xlat16_8);
    u_xlat2 = cos(u_xlat16_8);
    u_xlat1.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat1.x = u_xlat16_0.y * u_xlat2 + (-u_xlat1.x);
    u_xlat5 = u_xlat16_0.x * u_xlat2 + u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_FillAmount<0.5);
#else
    u_xlatb9 = _FillAmount<0.5;
#endif
    if(u_xlatb9){
        u_xlat16_9 = _FillAmount * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_13 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_2 = float(1.0) / u_xlat16_2;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_13;
        u_xlat16_6 = u_xlat16_2 * 0.0208350997 + -0.0851330012;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + 0.180141002;
        u_xlat16_6 = u_xlat16_2 * u_xlat16_6 + -0.330299497;
        u_xlat16_2 = u_xlat16_2 * u_xlat16_6 + 0.999866009;
        u_xlat16_6 = u_xlat16_13 * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb10 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat6 = u_xlat16_6 * -2.0 + 1.57079637;
        u_xlat6 = u_xlatb10 ? u_xlat6 : float(0.0);
        u_xlat13 = u_xlat16_13 * u_xlat16_2 + u_xlat6;
        u_xlat2 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<(-u_xlat2));
#else
        u_xlatb2 = u_xlat2<(-u_xlat2);
#endif
        u_xlat13 = (u_xlatb2) ? (-u_xlat13) : u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat9<u_xlat13);
#else
        u_xlatb9 = u_xlat9<u_xlat13;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(0.0<u_xlat1.x);
#else
        u_xlatb9 = 0.0<u_xlat1.x;
#endif
        if(((int(u_xlatb9) * int(0xffffffffu)))!=0){discard;}
    } else {
        u_xlat16_9 = _FillAmount + -0.5;
        u_xlat16_9 = u_xlat16_9 * 2.0 + -0.5;
        u_xlat9 = u_xlat16_9 * 3.14159274;
        u_xlat16_0.x = (-u_xlat5) / u_xlat1.x;
        u_xlat16_5 = min(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = max(abs(u_xlat16_0.x), 1.0);
        u_xlat16_13 = float(1.0) / u_xlat16_13;
        u_xlat16_5 = u_xlat16_13 * u_xlat16_5;
        u_xlat16_13 = u_xlat16_5 * u_xlat16_5;
        u_xlat16_2 = u_xlat16_13 * 0.0208350997 + -0.0851330012;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + 0.180141002;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_2 + -0.330299497;
        u_xlat16_13 = u_xlat16_13 * u_xlat16_2 + 0.999866009;
        u_xlat16_2 = u_xlat16_13 * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(1.0<abs(u_xlat16_0.x));
#else
        u_xlatb6 = 1.0<abs(u_xlat16_0.x);
#endif
        u_xlat2 = u_xlat16_2 * -2.0 + 1.57079637;
        u_xlat2 = u_xlatb6 ? u_xlat2 : float(0.0);
        u_xlat5 = u_xlat16_5 * u_xlat16_13 + u_xlat2;
        u_xlat13 = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
        u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
        u_xlat5 = (u_xlatb13) ? (-u_xlat5) : u_xlat5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(0.0<u_xlat1.x);
#else
        u_xlatb1 = 0.0<u_xlat1.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<u_xlat5);
#else
        u_xlatb5 = u_xlat9<u_xlat5;
#endif
        u_xlatb1 = u_xlatb5 && u_xlatb1;
        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    //ENDIF
    }
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0.w!=0.0);
#else
    u_xlatb1 = u_xlat16_0.w!=0.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? _Filter.xyz : u_xlat16_3.xyz;
    SV_Target0.w = (u_xlatb1) ? _Filter.w : u_xlat16_0.w;
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