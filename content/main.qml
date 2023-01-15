import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {
    id: item
    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        color: "white"
        textFormat: Text.RichText
        text: "<style>a:link{color:green}</style>Hello world. Navgate to the next <a href=\"app\">page</a>."
        color: "white"
        onLinkActivated: (link)=> item.parent.loadPage(link)
    }

    Component.onCompleted: {
        seo.setDescription("This content was rendered in using C++,QML and WASM")
        seo.setKeywords("QML, WASM, C++")
        seo.setTitle("Dynamic QML - Main")
    }
}
