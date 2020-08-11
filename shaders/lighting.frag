#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float lightPosX;
    float lightPosY;
} ubuf;

layout(binding = 1) uniform sampler2D source;
layout(binding = 2) uniform sampler2D srcNmap;

void main()
{
    vec4 pix = texture(source, qt_TexCoord0);
    vec4 pix2 = texture(srcNmap, qt_TexCoord0);
    vec3 normal = normalize(pix2.rgb * 2.0 - 1.0);
    vec3 light_pos = normalize(vec3(qt_TexCoord0.x - ubuf.lightPosX, qt_TexCoord0.y - ubuf.lightPosY, 0.8));
    float diffuse = max(dot(normal, light_pos), 0.2);
    // boost a bit
    diffuse *= 2.5;
    vec3 color = diffuse * pix.rgb;
    fragColor = vec4(color, pix.a) * ubuf.qt_Opacity;
}
