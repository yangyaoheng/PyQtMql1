import QtQuick
import QtQuick.Window
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 1024
    height: 768
    visible: true
    title: qsTr("Hello World")

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            clearColor: "#505020"
            backgroundMode: SceneEnvironment.Color
        }

        PerspectiveCamera {
            id:mainCamera
            position: Qt.vector3d(0, 30, 30)
        }

        // 已有的平行光
        DirectionalLight {
            color: "white"
            eulerRotation: Qt.vector3d(-45, 45, 0)
            brightness: 50
        }

        // 添加城市
        City {
            id: city1
            position: Qt.vector3d(0, 0, 0)
            rotation: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(10, 10, 10)
        }
        Chengdu_j_20_fighter_v2 {
            id:chengdu_night
            position: Qt.vector3d(0, 5, -5)
            rotation: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(1, 1, 1)
        }
    }

    WasdController {
        id: wasdController
        controlledObject:mainCamera
    }
}
