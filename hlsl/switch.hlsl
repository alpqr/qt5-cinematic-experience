cbuffer ConstantBuffer : register(b0)
{
    float4x4 qt_Matrix;
    float qt_Opacity;
};

Texture2D source : register(t0);
Texture2D maskSource : register(t1);
SamplerState sourceSampler : register(s0);

float4 PS_Switch(float4 position : SV_POSITION, float2 coord : TEXCOORD0) : SV_TARGET
{
    return source.Sample(sourceSampler, coord) * (maskSource.Sample(sourceSampler, coord).a) * qt_Opacity;
}
