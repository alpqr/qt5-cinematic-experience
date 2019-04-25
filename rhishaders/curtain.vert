#version 440

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texcoord;

layout(location = 0) out vec2 coord;
layout(location = 1) out float shade;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float leftHeight;
    float rightHeight;
    float originalHeight;
    float originalWidth;
    float amplitude;
} ubuf;

out gl_PerVertex { vec4 gl_Position; };

void main()
{
    coord = texcoord;
    vec4 shift = vec4(0.0);
    shift.y = position.y * ((ubuf.originalHeight - ubuf.leftHeight) + (ubuf.leftHeight - ubuf.rightHeight) * (position.x / ubuf.originalWidth)) / ubuf.originalHeight;
    shade = sin(21.9911486 * position.y / ubuf.originalHeight);
    shift.x = ubuf.amplitude * (ubuf.originalHeight - ubuf.leftHeight + (ubuf.leftHeight - ubuf.rightHeight) * (position.x / ubuf.originalWidth)) * shade;
    gl_Position = ubuf.qt_Matrix * (position - shift);
    shade = 0.2 * (2.0 - shade) * (1.0 - (ubuf.rightHeight + (ubuf.leftHeight - ubuf.rightHeight) * (1.0 - position.y / ubuf.originalWidth)) / ubuf.originalHeight);
}
