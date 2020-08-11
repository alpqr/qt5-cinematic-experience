import QtQuick 2.8

ShaderEffect {
    id: root

    property variant source
    property real leftHeight: height / 2
    property real rightHeight: height / 2
    property real originalHeight: height
    property real originalWidth: width
    property real amplitude: 0.10

    mesh: Qt.size(1, 80)

    vertexShader: "../shaders/curtain.vert.qsb"
    fragmentShader: "../shaders/curtain.frag.qsb"
}
