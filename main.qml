import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Window {
    visible: true
    color: "#171C2C"
    title: "Dynamic QML"

    StackView {
        id: stackview
        initialItem: text
        anchors.centerIn: parent
    }

    Text {
        id: text
        anchors.centerIn: parent
        color: "white"
        text: "Hello world"
    }

    function loadPage(url: string)
    {
        stackview.replace(url)
    }
}
