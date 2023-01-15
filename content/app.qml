import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {

    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        textFormat: Text.RichText
        text: "<style></style>This qml has been loaded dynamically from a web server and is able to set meta keywords. We area also working on <a href=\"https://www.crowdware.at\">hyperlinks</a>"
        color: "white"
        onLinkActivated: (link)=> seo.runScript("window.location.href = \"" + link + "\"")
    }

    Component.onCompleted: {
        seo.setDescription("This description is from app.qml")
        seo.setKeywords("test,qml,wasm")
        seo.setTitle("Dynamic QML - App")
    }
}
