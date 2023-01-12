import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    color: "#171C2C"
    title: "Dynamic QML"

    StackView {
        id: stackview
        initialItem: "https://raw.githubusercontent.com/CrowdWare/QmlWasm/web/content/app.qml"
        anchors.centerIn: parent

    }
}
