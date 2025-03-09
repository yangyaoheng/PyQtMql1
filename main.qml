import QtQuick
import QtQuick.Window
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")

    View3D {
        anchors.fill: parent

        environment:ExtendedSceneEnvironment {
             backgroundMode: SceneEnvironment.SkyBox
             lightProbe: Texture { source: "OpenfootageNET_lowerAustria01-1024.hdr" }

             tonemapMode: SceneEnvironment.TonemapModeFilmic
             sharpnessAmount: 0.4

             glowEnabled: true
             glowStrength: 1.25
             glowBloom: 0.25
             glowBlendMode: ExtendedSceneEnvironment.GlowBlendMode.Additive
        }

        PerspectiveCamera {
            id: mainCamera
            position: Qt.vector3d(0, 120, 30)
        }

        // 已有的平行光
        DirectionalLight {
            color: "white"
            eulerRotation: Qt.vector3d(-45, 45, 0)
            brightness: 0.8
        }

        // 添加城市
        City {
            id: city1
            position: Qt.vector3d(0, 0, 0)
            rotation: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(10, 10, 10)
        }
        Chengdu_j_20_fighter_v2 {
            id: chengdu_night
            position: Qt.vector3d(0, 80, 0)
            rotation: Qt.vector3d(0, 0, 0)
            scale: Qt.vector3d(1, 1, 1)
            
            // 定义前进动画
            NumberAnimation {
                id: forwardAnimation
                target: chengdu_night
                property: "position.z"
                to: 400 // 前进到的目标 z 坐标
                duration: 2000 // 动画持续时间，单位为毫秒
                easing.type: Easing.InOutQuad // 缓动类型
                loops: 1 // 单次循环
                onStopped: {
                    backwardAnimation.start() // 前进动画结束后启动后退动画
                }
            }
            
            // 定义后退动画
            NumberAnimation {
                id: backwardAnimation
                target: chengdu_night
                property: "position.z"
                to: 0 // 后退到的目标 z 坐标
                duration: 2000 // 动画持续时间，单位为毫秒
                easing.type: Easing.InOutQuad // 缓动类型
                loops: 1 // 单次循环
                onStopped: {
                    forwardAnimation.start() // 后退动画结束后启动前进动画
                }
            }
            
            Component.onCompleted: {
                forwardAnimation.start() // 组件加载完成后开始前进动画
            }
        }
    }

    WasdController {
        id: wasdController
        controlledObject: mainCamera
    }
}
