import QtQuick
import QtQuick.Window
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    View3D {
        anchors.fill: parent
        camera: PerspectiveCamera {
            position: Qt.vector3d(0, 0, 40)
            fieldOfView: 45
        }

        // Add a light directly
        Light {
            type: Light.DirectionalLight
            color: "white"
            intensity: 1.0
        }

        Model {
            source: "#Cube"
            position: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(10, 10, 10)
        }
    }
}
