import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {

    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        text: "Hello world."
        color: "white"
    }

    Component.onCompleted: {
        seo.setDescription("This content was rendered in using C++,QML and WASM")
        seo.setKeywords("QML, WASM, C++")
        seo.setTitle("Dynamic QML - Main")
    }
}
