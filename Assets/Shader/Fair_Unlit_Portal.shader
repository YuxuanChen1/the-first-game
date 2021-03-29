//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Fair/Unlit/Portal" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_NoiseTex ("Noise Texture", 2D) = "white" { }
_MaskSmoke ("Mask Smoke Texture", 2D) = "white" { }
_MaskFrame ("Mask Frame Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Speed ("Speed", Float) = 0.2
_Scale ("Scale", Float) = 2
_T ("T", Float) = 0.5
_S ("S", Float) = 1.2
[IntRange] _FBM ("FBM", Range(1, 10)) = 3
}
SubShader {
 Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 46716
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MaskSmoke;
uniform lowp sampler2D _MaskFrame;
varying highp vec2 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
lowp float u_xlat10_12;
lowp float u_xlat10_13;
vec2 u_xlat15;
lowp float u_xlat10_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
lowp float u_xlat10_19;
int u_xlati19;
float u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat10_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
        u_xlat15.x = float(u_xlati8);
        u_xlatb15 = u_xlat15.x>=_FBM;
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat10_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat10_13 = texture2D(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
        u_xlat20 = float(u_xlati19);
        u_xlatb20 = u_xlat20>=_FBM;
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat10_20 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat10_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat10_19 = texture2D(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_3 = 0 ; u_xlati_while_true_3 < 0x7FFF ; u_xlati_while_true_3++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat10_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat10_6 = texture2D(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_12 = texture2D(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat10_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat10_2.xyz = texture2D(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat10_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat10_1.x) + u_xlat10_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat10_1.x;
    u_xlat16_1 = (-u_xlat10_6) + u_xlat10_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1 + u_xlat10_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat10_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat10_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MaskSmoke;
uniform lowp sampler2D _MaskFrame;
varying highp vec2 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
lowp float u_xlat10_12;
lowp float u_xlat10_13;
vec2 u_xlat15;
lowp float u_xlat10_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
lowp float u_xlat10_19;
int u_xlati19;
float u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat10_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
        u_xlat15.x = float(u_xlati8);
        u_xlatb15 = u_xlat15.x>=_FBM;
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat10_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat10_13 = texture2D(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
        u_xlat20 = float(u_xlati19);
        u_xlatb20 = u_xlat20>=_FBM;
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat10_20 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat10_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat10_19 = texture2D(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_3 = 0 ; u_xlati_while_true_3 < 0x7FFF ; u_xlati_while_true_3++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat10_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat10_6 = texture2D(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_12 = texture2D(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat10_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat10_2.xyz = texture2D(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat10_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat10_1.x) + u_xlat10_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat10_1.x;
    u_xlat16_1 = (-u_xlat10_6) + u_xlat10_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1 + u_xlat10_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat10_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat10_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MaskSmoke;
uniform lowp sampler2D _MaskFrame;
varying highp vec2 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
lowp float u_xlat10_12;
lowp float u_xlat10_13;
vec2 u_xlat15;
lowp float u_xlat10_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
lowp float u_xlat10_19;
int u_xlati19;
float u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat10_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
        u_xlat15.x = float(u_xlati8);
        u_xlatb15 = u_xlat15.x>=_FBM;
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat10_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat10_13 = texture2D(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
        u_xlat20 = float(u_xlati19);
        u_xlatb20 = u_xlat20>=_FBM;
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat10_20 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat10_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat10_19 = texture2D(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    for(int u_xlati_while_true_3 = 0 ; u_xlati_while_true_3 < 0x7FFF ; u_xlati_while_true_3++){
        u_xlat21 = float(u_xlati15);
        u_xlatb21 = u_xlat21>=_FBM;
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat10_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat10_6 = texture2D(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_12 = texture2D(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat10_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat10_2.xyz = texture2D(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat10_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat10_1.x) + u_xlat10_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat10_1.x;
    u_xlat16_1 = (-u_xlat10_6) + u_xlat10_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1 + u_xlat10_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat10_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat10_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MaskSmoke;
uniform mediump sampler2D _MaskFrame;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
mediump float u_xlat16_12;
mediump float u_xlat16_13;
vec2 u_xlat15;
mediump float u_xlat16_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
int u_xlati19;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat16_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    while(true){
        u_xlat15.x = float(u_xlati8);
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat15.x>=_FBM);
#else
        u_xlatb15 = u_xlat15.x>=_FBM;
#endif
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat16_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat16_13 = texture(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    while(true){
        u_xlat20 = float(u_xlati19);
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat20>=_FBM);
#else
        u_xlatb20 = u_xlat20>=_FBM;
#endif
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat16_20 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat16_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat16_19 = texture(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat16_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat16_6 = texture(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_12 = texture(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat16_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat16_2.xyz = texture(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat16_1.x) + u_xlat16_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_6) + u_xlat16_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1.x + u_xlat16_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat16_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MaskSmoke;
uniform mediump sampler2D _MaskFrame;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
mediump float u_xlat16_12;
mediump float u_xlat16_13;
vec2 u_xlat15;
mediump float u_xlat16_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
int u_xlati19;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat16_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    while(true){
        u_xlat15.x = float(u_xlati8);
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat15.x>=_FBM);
#else
        u_xlatb15 = u_xlat15.x>=_FBM;
#endif
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat16_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat16_13 = texture(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    while(true){
        u_xlat20 = float(u_xlati19);
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat20>=_FBM);
#else
        u_xlatb20 = u_xlat20>=_FBM;
#endif
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat16_20 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat16_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat16_19 = texture(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat16_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat16_6 = texture(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_12 = texture(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat16_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat16_2.xyz = texture(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat16_1.x) + u_xlat16_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_6) + u_xlat16_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1.x + u_xlat16_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat16_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Scale;
uniform 	float _FBM;
uniform 	float _T;
uniform 	float _S;
uniform 	float _Speed;
uniform 	vec4 _Color;
uniform mediump sampler2D _NoiseTex;
uniform mediump sampler2D _MaskSmoke;
uniform mediump sampler2D _MaskFrame;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
vec2 u_xlat8;
int u_xlati8;
float u_xlat12;
mediump float u_xlat16_12;
mediump float u_xlat16_13;
vec2 u_xlat15;
mediump float u_xlat16_15;
int u_xlati15;
bool u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
int u_xlati19;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat0.y = _Time.y * _Speed;
    u_xlat0.x = (-_Time.y) * _Speed + (-vs_TEXCOORD0.y);
    u_xlat0.z = 0.0;
    u_xlat1 = (-u_xlat0.zxzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat1 / vec4(_Scale);
    u_xlat0.x = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat2.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat0.x = u_xlat16_21 * u_xlat3.y + u_xlat0.x;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat2.x = _Scale * 0.5;
    u_xlat1 = u_xlat1 / u_xlat2.xxxx;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlat7 = 0.0;
    u_xlati8 = 0;
    while(true){
        u_xlat15.x = float(u_xlati8);
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat15.x>=_FBM);
#else
        u_xlatb15 = u_xlat15.x>=_FBM;
#endif
        if(u_xlatb15){break;}
        u_xlat15.xy = u_xlat2.zw * u_xlat3.xx;
        u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).x;
        u_xlat7 = u_xlat16_15 * u_xlat3.y + u_xlat7;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati8 = u_xlati8 + 1;
    }
    u_xlat16_13 = texture(_NoiseTex, u_xlat1.zw).x;
    u_xlat0.w = (-u_xlat0.y);
    u_xlat8.xy = (-u_xlat0.wz) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat8.xy / vec2(_Scale);
    u_xlat15.x = float(1.0);
    u_xlat15.y = float(0.5);
    u_xlat18 = 0.0;
    u_xlati19 = 0;
    while(true){
        u_xlat20 = float(u_xlati19);
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat20>=_FBM);
#else
        u_xlatb20 = u_xlat20>=_FBM;
#endif
        if(u_xlatb20){break;}
        u_xlat4.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat16_20 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat18 = u_xlat16_20 * u_xlat15.y + u_xlat18;
        u_xlat15.xy = u_xlat15.xy * vec2(_S, _T);
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat8.xy = u_xlat8.xy / u_xlat2.xx;
    u_xlat16_19 = texture(_NoiseTex, u_xlat8.xy).x;
    u_xlat6.xy = (-u_xlat0.yz) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat6.xy / vec2(_Scale);
    u_xlat20 = 0.0;
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(0.5);
    u_xlati15 = int(0);
    while(true){
        u_xlat21 = float(u_xlati15);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat21>=_FBM);
#else
        u_xlatb21 = u_xlat21>=_FBM;
#endif
        if(u_xlatb21){break;}
        u_xlat4.xy = u_xlat8.xy * u_xlat3.xx;
        u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
        u_xlat20 = u_xlat16_21 * u_xlat3.y + u_xlat20;
        u_xlat3.xy = u_xlat3.xy * vec2(_S, _T);
        u_xlati15 = u_xlati15 + 1;
    }
    u_xlat6.xy = u_xlat6.xy / u_xlat2.xx;
    u_xlat16_6 = texture(_NoiseTex, u_xlat6.xy).x;
    u_xlat12 = (-u_xlat0.x) + u_xlat7;
    u_xlat0.x = vs_TEXCOORD0.x * u_xlat12 + u_xlat0.x;
    u_xlat12 = u_xlat18 + (-u_xlat20);
    u_xlat12 = vs_TEXCOORD0.y * u_xlat12 + u_xlat20;
    u_xlat0.x = u_xlat12 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_12 = texture(_MaskSmoke, vs_TEXCOORD0.xy).x;
    u_xlat0.x = u_xlat16_12 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1.5;
    u_xlat16_2.xyz = texture(_MaskFrame, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(24.0, 24.0, 24.0) + u_xlat0.xxx;
    u_xlat16_18 = (-u_xlat16_1.x) + u_xlat16_13;
    u_xlat18 = vs_TEXCOORD0.x * u_xlat16_18 + u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_6) + u_xlat16_19;
    u_xlat6.x = vs_TEXCOORD0.y * u_xlat16_1.x + u_xlat16_6;
    u_xlat6.x = u_xlat6.x + u_xlat18;
    u_xlat6.x = u_xlat6.x + -1.0;
    u_xlat6.x = u_xlat6.x * 0.0500000007;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.xz = u_xlat6.xx * vec2(8.0, 8.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_MaskFrame, u_xlat6.xz).xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat0.xyw * vec3(4.0, 4.0, 4.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyw * _Color.xyz;
    u_xlat2.w = u_xlat16_12 * u_xlat0.x;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.x = u_xlat16_5.x * 0.25;
    u_xlat0.xyz = (-u_xlat0.xyw) * _Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat1.xyz;
    SV_TARGET0 = u_xlat2;
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