import QtQuick 2.8 // for RendererInfo

Item {
    id: root
    property int frameCounter: 0
    property int fps: 0;

    width: 160
    height: 48

    Image {
        id: spinnerImage
        source: "images/spinner.png"
        NumberAnimation on rotation {
            from:0
            to: 360
            duration: 800
            loops: Animation.Infinite
        }
        onRotationChanged: frameCounter++;
    }

    Text {
        id: fpsText
        anchors.right: parent.right
        anchors.verticalCenter: spinnerImage.verticalCenter
        color: "#ffffff"
        style: Text.Outline
        styleColor: "#606060"
        font.pixelSize: 28
        text: root.fps + " fps"
    }

    Text {
        anchors.left: spinnerImage.left
        anchors.top: fpsText.bottom
        color: "#ffffff"
        style: Text.Outline
        styleColor: "#606060"
        font.pixelSize: 28
        property int api: RendererInfo.api
        text: "Running on " + (api === RendererInfo.OpenGL ? "OpenGL" : (api === RendererInfo.Direct3D12 ? "Direct3D 12" : ""))
    }

    Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            fps = frameCounter/2;
            frameCounter = 0;
        }
    }
}
