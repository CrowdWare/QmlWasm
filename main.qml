import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Window {
    visible: true
    color: "#171C2C"
    title: "Dynamic QML"

    StackView {
        id: stackview
        initialItem: text
        anchors.centerIn: parent

        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 400
            }
        }
        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 400
            }
        }
    }

    Text {
        id: text
        anchors.centerIn: parent
        color: "white"
        text: "Hello world"
    }

    function loadPage(url: string)
    {
        if(url === "")
            stackview.replace(text, StackView.ReplaceTransition)
        else
            stackview.replace(url, StackView.ReplaceTransition)
    }
}
