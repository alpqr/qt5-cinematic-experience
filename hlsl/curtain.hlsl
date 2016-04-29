cbuffer ConstantBuffer : register(b0)
{
    float4x4 qt_Matrix;
    float qt_Opacity;

    float shade;
    float leftHeight;
    float rightHeight;
    float originalHeight;
    float originalWidth;
    float amplitude;
};

struct PSInput
{
    float4 position : SV_POSITION;
    float2 coord : TEXCOORD0;
    float shade : TEXCOORD1;
};

PSInput VS_Curtain(float4 position : POSITION, float2 coord : TEXCOORD0)
{
    PSInput result;
    result.coord = coord;
    float4 shift = 0;
    shift.y = position.y * ((originalHeight - leftHeight) + (leftHeight - rightHeight) * (position.x / originalWidth)) / originalHeight;
    result.shade = sin(21.9911486 * position.y / originalHeight);
    shift.x = amplitude * (originalHeight - leftHeight + (leftHeight - rightHeight) * (position.x / originalWidth)) * result.shade;
    result.position = mul(qt_Matrix, (position - shift));
    result.shade = 0.2 * (2.0 - result.shade ) * (1.0 - (rightHeight + (leftHeight  - rightHeight) * (1.0 - position.y / originalWidth)) / originalHeight);
    return result;
}

Texture2D source : register(t0);
SamplerState sourceSampler : register(s0);

float4 PS_Curtain(PSInput input) : SV_TARGET
{
    float4 color = source.Sample(sourceSampler, input.coord);
    color.rgb *= 1.0 - input.shade;
    return color * qt_Opacity;
}
