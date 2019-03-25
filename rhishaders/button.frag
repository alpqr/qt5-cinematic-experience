#version 440

layout(location = 0) in vec2 coord;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
} ubuf;

layout(binding = 1) uniform sampler2D source;
layout(binding = 2) uniform sampler2D source2;

void main()
{
    vec4 pix = texture(source, coord);
    vec4 pix2 = texture(source2, coord);
    fragColor = (pix + pix.a * pix2) * ubuf.qt_Opacity;
}
