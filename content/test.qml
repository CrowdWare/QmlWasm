import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {

    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        text: "This qml has been loaded dynamically from a web server."
        color: "white"
    }

    Component.onCompleted: {
        seo.setDescription("This description is from test.qml")
        seo.setKeywords("test")
        seo.setTitle("Dynamic QML - Test")
    }
}
