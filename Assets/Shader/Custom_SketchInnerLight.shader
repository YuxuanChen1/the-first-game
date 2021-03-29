//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/SketchInnerLight" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_OuterColor ("OuterColor", Color) = (1,1,1,1)
_InnerColor ("InnerColor", Color) = (0,0,0,0)
_ClipRect ("Clip Rect", Vector) = (0,0,0,0)
_KernelSize ("Kernel Size", Float) = 3
_OuterSaturate ("Outer Saturate", Float) = 1
_OffsetFactor ("Offset Factor", Range(0, 1)) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 42462
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
lowp float u_xlat10_10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat10_10 = texture2D(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat10_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
lowp float u_xlat10_10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat10_10 = texture2D(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat10_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
lowp float u_xlat10_10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat10_10 = texture2D(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat10_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat16_10 = texture(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat16_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat16_10 = texture(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat16_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _InnerColor;
uniform 	mediump vec4 _OuterColor;
uniform 	float _KernelSize;
uniform 	float _OuterSaturate;
uniform 	float _OffsetFactor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
float u_xlat3;
int u_xlati3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
int u_xlati6;
int u_xlati7;
float u_xlat9;
float u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0.w;
    u_xlat3 = _KernelSize + -1.0;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlati3 = int(u_xlat3);
    u_xlati6 = 0 - u_xlati3;
    u_xlat9 = 0.0;
    for(int u_xlati_loop_1 = u_xlati6 ; u_xlati3>=u_xlati_loop_1 ; u_xlati_loop_1++)
    {
        u_xlat4 = float(u_xlati_loop_1);
        u_xlat4 = u_xlat4 * _MainTex_TexelSize.x;
        u_xlat2.x = u_xlat4 * _OffsetFactor;
        u_xlat4 = u_xlat9;
        for(int u_xlati_loop_2 = u_xlati6 ; u_xlati3>=u_xlati_loop_2 ; u_xlati_loop_2++)
        {
            u_xlat10 = float(u_xlati_loop_2);
            u_xlat10 = u_xlat10 * _MainTex_TexelSize.y;
            u_xlat2.y = u_xlat10 * _OffsetFactor;
            u_xlat5.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
            u_xlat16_10 = texture(_MainTex, u_xlat5.xy).w;
            u_xlat10 = (-u_xlat16_10) + u_xlat4;
            u_xlat4 = u_xlat10 + 1.0;
        }
        u_xlat9 = u_xlat4;
    }
    u_xlat3 = _KernelSize * _KernelSize;
    u_xlat3 = u_xlat9 / u_xlat3;
    u_xlat1 = vec4(u_xlat3) * _OuterColor;
    u_xlat1 = u_xlat1 * vec4(vec4(_OuterSaturate, _OuterSaturate, _OuterSaturate, _OuterSaturate)) + _InnerColor;
    u_xlat0 = vec4(u_xlat16_0) * u_xlat1;
    SV_Target0 = u_xlat0;
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