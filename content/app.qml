import QtQuick 2.13
import at.crowdware.wasm 1.0

Item {
    id: item
    signal loadPage(string page)

    Seo {
        id: seo
    }

    Text {
        anchors.centerIn: parent
        textFormat: Text.RichText
        text: "<style>a:link{color:green}</style>This qml has been loaded dynamically from a web server and is able to set meta keywords.<br>We area also working on external <a href=\"https://www.crowdware.at\">links</a> and local <a href=\"test\">links</a>."
        color: "white
        onLinkActivated: (link)=> 
        {
            if(link.includes("http"))
                seo.runScript("window.location.href = \"" + link + "\"")
            else
                item.loadPage(link)
        }
    }

    Component.onCompleted: {
        seo.setDescription("This description is from app.qml")
        seo.setKeywords("test,qml,wasm")
        seo.setTitle("Dynamic QML - App")
    }
}
