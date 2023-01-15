import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {
    property string error: ""
    
    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        text: "The requested page could not be loaded (" + error + ")"
        color: "red"
    }

    Component.onCompleted: {
        seo.setDescription("This content was rendered in using C++,QML and WASM")
        seo.setKeywords("QML, WASM, C++")
        seo.setTitle("Dynamic QML - Not found")
    }
}
