//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/TvShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_TimeScale ("花屏速度", Range(0.0001, 2)) = 1
_TimeOffset ("时间偏移", Range(0.0001, 2)) = 1
_EffectScale ("效果缩放", Range(0, 500)) = 1
_LightScale ("亮度缩放", Range(0.01, 5)) = 1
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 46201
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
    u_xlatb12 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
    u_xlatb1 = u_xlat18<1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
    u_xlatb7 = 0.5<u_xlat7;
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat4 = texture2D(_MainTex, u_xlat1.xy);
        u_xlatb18 = 5.0>=u_xlat12.x;
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
    u_xlatb12 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
    u_xlatb1 = u_xlat18<1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
    u_xlatb7 = 0.5<u_xlat7;
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat4 = texture2D(_MainTex, u_xlat1.xy);
        u_xlatb18 = 5.0>=u_xlat12.x;
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
    u_xlatb12 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
    u_xlatb1 = u_xlat18<1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
    u_xlatb7 = 0.5<u_xlat7;
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat4 = texture2D(_MainTex, u_xlat1.xy);
        u_xlatb18 = 5.0>=u_xlat12.x;
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb12 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat18<1.0);
#else
    u_xlatb1 = u_xlat18<1.0;
#endif
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<u_xlat7);
#else
    u_xlatb7 = 0.5<u_xlat7;
#endif
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat4 = texture(_MainTex, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(5.0>=u_xlat12.x);
#else
        u_xlatb18 = 5.0>=u_xlat12.x;
#endif
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
#ifdef UNITY_ADRENO_ES3
        u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb12 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat18<1.0);
#else
    u_xlatb1 = u_xlat18<1.0;
#endif
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<u_xlat7);
#else
    u_xlatb7 = 0.5<u_xlat7;
#endif
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat4 = texture(_MainTex, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(5.0>=u_xlat12.x);
#else
        u_xlatb18 = 5.0>=u_xlat12.x;
#endif
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
#ifdef UNITY_ADRENO_ES3
        u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _TimeScale;
uniform 	float _TimeOffset;
uniform 	float _EffectScale;
uniform 	float _LightScale;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = _Time.y * 0.03125;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb12 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb12) ? u_xlat6 : (-u_xlat6);
    u_xlat12.x = _EffectScale * 0.100000001;
    u_xlat18 = u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xy = vec2(u_xlat6) * vec2(32.0, 192.0);
    u_xlat7 = floor(u_xlat1.y);
    u_xlat7 = u_xlat7 * _TimeScale;
    u_xlat7 = u_xlat7 * 0.166666672 + _TimeOffset;
    u_xlat7 = dot(vec2(u_xlat7), vec2(12.9898005, 78.2330017));
    u_xlat7 = sin(u_xlat7);
    u_xlat13.x = (-u_xlat18) + 1.0;
    u_xlat13.x = u_xlat13.x * 0.699999988 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x * 10.0;
    u_xlat19 = u_xlat13.x * vs_TEXCOORD0.x;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = u_xlat19 / u_xlat13.x;
    u_xlat2.z = u_xlat19 * _TimeScale + _TimeOffset;
    u_xlat2.w = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat1.x;
    u_xlat18 = u_xlat18 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat18<1.0);
#else
    u_xlatb1 = u_xlat18<1.0;
#endif
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = u_xlat18 * 40.0;
    u_xlat18 = (u_xlatb1) ? u_xlat18 : 4.76837158e-06;
    u_xlat1.x = u_xlat18 * u_xlat0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat18 = u_xlat1.x / u_xlat18;
    u_xlat2.y = u_xlat18 * _TimeScale + _TimeOffset;
    u_xlat18 = dot(u_xlat2.yw, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat1.x = u_xlat0.x * u_xlat13.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat13.x;
    u_xlat2.x = u_xlat1.x * _TimeScale + _TimeOffset;
    u_xlat1.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + 0.800000012;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 0.899999976;
    u_xlat13.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat13.xy = vec2(u_xlat6) * vec2(32.0, 32.0) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * vec2(_TimeScale) + vec2(vec2(_TimeOffset, _TimeOffset));
    u_xlat6 = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat18 = u_xlat18 * u_xlat12.x;
    u_xlat12.y = u_xlat18 * 0.0500000007;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<u_xlat7);
#else
    u_xlatb7 = 0.5<u_xlat7;
#endif
    u_xlat1.y = (u_xlatb7) ? 1.0 : -1.0;
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat6 = u_xlat6 * u_xlat12.y;
    u_xlat6 = u_xlat6 * 0.5 + u_xlat12.y;
    u_xlat1.y = u_xlat12.x * 0.100000001 + u_xlat0.x;
    u_xlat2.y = 1.0;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
    {
        u_xlat12.x = float(u_xlati_loop_1);
        u_xlat18 = u_xlat12.x * 0.100000001;
        u_xlat1.x = u_xlat6 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat4 = texture(_MainTex, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(5.0>=u_xlat12.x);
#else
        u_xlatb18 = 5.0>=u_xlat12.x;
#endif
        u_xlat2.x = u_xlatb18 ? 1.0 : float(0.0);
        u_xlat2.z = (u_xlatb18) ? 0.0 : 1.0;
        u_xlat12.x = u_xlat12.x * 0.100000001 + -0.166666672;
        u_xlat12.x = u_xlat12.x * 1.50000012;
#ifdef UNITY_ADRENO_ES3
        u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
        u_xlat5.y = -abs(u_xlat12.x) + 1.0;
        u_xlat5.xz = (-u_xlat5.yy) + vec2(1.0, 1.0);
        u_xlat2.xzw = u_xlat2.xyz * u_xlat5.xyz;
        u_xlat2.xzw = log2(u_xlat2.xzw);
        u_xlat2.xzw = u_xlat2.xzw * vec3(0.454545468, 0.454545468, 0.454545468);
        u_xlat2.xzw = exp2(u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw * u_xlat4.xyz;
        u_xlat3 = u_xlat3 + u_xlat4;
    }
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_LightScale, _LightScale, _LightScale));
    u_xlat1.w = u_xlat3.w * 0.100000001;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.231237233, 0.211791947, 0.300791413);
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