import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Dynamic QML loaded")
    color: "#171C2C"

    Text {
        anchors.centerIn: parent
        text: qsTr("This qml has been loaded dynamically from a web server.")
        color: "white"
    }
}
