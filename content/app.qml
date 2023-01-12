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

    component.onCompleted: seo.setDescription("This is the description from app.qml")
}