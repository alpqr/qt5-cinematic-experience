cbuffer ConstantBuffer : register(b0)
{
    float4x4 qt_Matrix;
    float qt_Opacity;
};

Texture2D source : register(t0);
Texture2D source2 : register(t1);
SamplerState sourceSampler : register(s0);

float4 PS_Button(float4 position : SV_POSITION, float2 coord : TEXCOORD0) : SV_TARGET
{
    float4 pix = source.Sample(sourceSampler, coord);
    float4 pix2 = source2.Sample(sourceSampler, coord);
    return (pix + pix.a * pix2) * qt_Opacity;
}
