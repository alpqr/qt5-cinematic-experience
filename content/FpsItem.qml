import QtQuick 2.0
import Cinematic 1.0

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

    BackendGetter { id: b; srcItem: root }

    Text {
        anchors.left: spinnerImage.left
        anchors.top: fpsText.bottom
        color: "#ffffff"
        style: Text.Outline
        styleColor: "#606060"
        font.pixelSize: 28
        text: "Running on " + b.backendName
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
