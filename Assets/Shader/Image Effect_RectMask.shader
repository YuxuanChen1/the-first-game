//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Image Effect/RectMask" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Softness ("Softness", Float) = 0
_SoftPower ("Soft Power", Float) = 2
_BackgroundColor ("Background Color", Color) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 29402
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 _MaskRectsDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _MaskRects[i];
#else
#define d_ar _MaskRects
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRectsDynamicIndex(u_xlati_loop_1).xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRectsDynamicIndex(u_xlati_loop_1).xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRectsDynamicIndex(u_xlati_loop_1).zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRectsDynamicIndex(u_xlati_loop_1).zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 _MaskRectsDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _MaskRects[i];
#else
#define d_ar _MaskRects
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRectsDynamicIndex(u_xlati_loop_1).xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRectsDynamicIndex(u_xlati_loop_1).xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRectsDynamicIndex(u_xlati_loop_1).zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRectsDynamicIndex(u_xlati_loop_1).zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 _MaskRectsDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _MaskRects[i];
#else
#define d_ar _MaskRects
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRectsDynamicIndex(u_xlati_loop_1).xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRectsDynamicIndex(u_xlati_loop_1).xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRectsDynamicIndex(u_xlati_loop_1).zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRectsDynamicIndex(u_xlati_loop_1).zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRects[u_xlati_loop_1].xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRects[u_xlati_loop_1].xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRects[u_xlati_loop_1].zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRects[u_xlati_loop_1].zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRects[u_xlati_loop_1].xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRects[u_xlati_loop_1].xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRects[u_xlati_loop_1].zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRects[u_xlati_loop_1].zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _BackgroundColor;
uniform 	vec4 _MaskRects[16];
uniform 	int _RectCount;
uniform 	float _Softness;
uniform 	int _SoftPower;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
int u_xlati1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12 = float(_SoftPower);
    u_xlat13 = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_RectCount ; u_xlati_loop_1++)
    {
        u_xlat5.xy = vs_TEXCOORD1.xy + (-_MaskRects[u_xlati_loop_1].xy);
        u_xlat5.xy = u_xlat5.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _MaskRects[u_xlati_loop_1].xyxx).xy;
        u_xlat2.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb2.xy));
        u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
        u_xlat2.xy = (-vs_TEXCOORD1.xy) + _MaskRects[u_xlati_loop_1].zw;
        u_xlat2.xy = u_xlat2.xy / vec2(vec2(_Softness, _Softness));
        u_xlatb10.xy = greaterThanEqual(_MaskRects[u_xlati_loop_1].zwzw, vs_TEXCOORD1.xyxy).xy;
        u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb10.xy));
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xy;
        u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
        u_xlat5.xy = min(u_xlat5.xy, u_xlat2.xy);
        u_xlat5.x = min(u_xlat5.y, u_xlat5.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
        u_xlat5.x = log2(u_xlat5.x);
        u_xlat5.x = u_xlat12 * u_xlat5.x;
        u_xlat5.x = exp2(u_xlat5.x);
        u_xlat13 = max(u_xlat5.x, u_xlat13);
    }
    u_xlat16_3.x = (-u_xlat13) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _BackgroundColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat13) + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat13;
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