#version 440

layout(location = 0) in vec2 coord;
layout(location = 1) in float shade;

layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float leftHeight;
    float rightHeight;
    float originalHeight;
    float originalWidth;
    float amplitude;
} ubuf;

layout(binding = 1) uniform sampler2D source;

void main()
{
    vec4 color = texture(source, coord);
    color.rgb *= 1.0 - shade;
    fragColor = color * ubuf.qt_Opacity;
}
