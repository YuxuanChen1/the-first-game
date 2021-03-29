//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Outline Out" {
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
_OutlineColor ("Outline Color", Color) = (1,1,1,1)
_SpriteRect ("Sprite Rect", Vector) = (0,0,32,32)
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 13154
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp float u_xlat10_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat10_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat10_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat10_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat10_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp float u_xlat10_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat10_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat10_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat10_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat10_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp float u_xlat10_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat10_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat10_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat10_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat10_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat16_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat16_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat16_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat16_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat16_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat16_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat16_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat16_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _OutlineColor;
uniform 	vec4 _SpriteRect;
uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_11;
mediump float u_xlat16_17;
mediump float u_xlat16_23;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat3 = _SpriteRect.xywz / _MainTex_TexelSize.zwwz;
    u_xlatb2.xy = lessThan(u_xlat3.xyxx, u_xlat2.xyxx).xy;
    if(u_xlatb2.x){
        u_xlat4.x = (-_MainTex_TexelSize.x);
        u_xlat4.y = 0.0;
        u_xlat2.xz = u_xlat4.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_5 = u_xlat16_2;
    } else {
        u_xlat16_5 = 0.0;
    //ENDIF
    }
    u_xlat2.xz = vs_TEXCOORD0.yx + _MainTex_TexelSize.yx;
    u_xlat2.xz = (-u_xlat3.yx) + u_xlat2.xz;
    u_xlatb2.xz = lessThan(u_xlat2.xxzx, u_xlat3.zzwz).xz;
    if(u_xlatb2.x){
        u_xlat3.x = 0.0;
        u_xlat3.y = _MainTex_TexelSize.y;
        u_xlat2.xw = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xw).w;
        u_xlat16_11 = u_xlat16_2;
    } else {
        u_xlat16_11 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.z){
        u_xlat3.x = _MainTex_TexelSize.x;
        u_xlat3.y = 0.0;
        u_xlat2.xz = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xz).w;
        u_xlat16_17 = u_xlat16_2;
    } else {
        u_xlat16_17 = 0.0;
    //ENDIF
    }
    if(u_xlatb2.y){
        u_xlat2.x = 0.0;
        u_xlat2.y = (-_MainTex_TexelSize.y);
        u_xlat2.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy).w;
        u_xlat16_23 = u_xlat16_2;
    } else {
        u_xlat16_23 = 0.0;
    //ENDIF
    }
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_11 = max(u_xlat16_23, u_xlat16_17);
    u_xlat16_5 = max(u_xlat16_11, u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_0.w) * vs_COLOR0.w + u_xlat16_5;
    u_xlat16_0 = (-u_xlat16_0) * vs_COLOR0 + _OutlineColor;
    SV_Target0 = vec4(u_xlat16_5) * u_xlat16_0 + u_xlat16_1;
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