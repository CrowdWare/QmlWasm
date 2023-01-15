import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {
    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        text: "The requested page could not be found"
        color: "orange"
    }

    Component.onCompleted: {
        seo.setTitle("Dynamic QML - Page Not Found")
    }
}
