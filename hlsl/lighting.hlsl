cbuffer ConstantBuffer : register(b0)
{
    float4x4 qt_Matrix;
    float qt_Opacity;

    float lightPosX;
    float lightPosY;
};

Texture2D source : register(t0);
Texture2D srcNmap : register(t1);
SamplerState sourceSampler : register(s0);

float4 PS_Lighting(float4 position : SV_POSITION, float2 coord : TEXCOORD0) : SV_TARGET
{
    float4 pix = source.Sample(sourceSampler, coord);
    float4 pix2 = srcNmap.Sample(sourceSampler, coord);
    float3 normal = normalize(pix2.rgb * 2.0 - 1.0);
    float3 light_pos = normalize(float3(coord.x - lightPosX, coord.y - lightPosY, 0.8));
    float diffuse = max(dot(normal, light_pos), 0.2);
    // boost a bit
    diffuse *= 2.5;
    float3 color = diffuse * pix.rgb;
    return float4(color, pix.a) * qt_Opacity;
}
