import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {

    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        textFormat: Text.RichText
        text: "This qml has been loaded dynamically from a <a href=\"https://www.crowdware.at\">web server</a> and is able to set meta keywords."
        color: "white"
    }

    Component.onCompleted: {
        seo.setDescription("This description is from app.qml")
        seo.setKeywords("test,qml,wasm")
        seo.setTitle("Dynamic QML - App")
    }
}
