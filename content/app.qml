import QtQuick 2.13
import QtQuick.Controls 6.4
import at.crowdware.wasm 1.0

Item 
{
    id: item
    signal loadPage(string page)

    Seo 
    {
        id: seo
    }

    Label
    {
        anchors.centerIn: parent
        text: "This qml has been loaded dynamically from a web server and is able to set meta keywords.<br>We area also working on external <a href=\"https://www.crowdware.at\">links</a> and local <a href=\"test\">links</a>."
        onLinkActivated: (link)=> 
        {
            if(link.startsWith("http"))
                seo.runScript("window.location.href = \"" + link + "\"")
            else
                item.loadPage(link)
        }
        MouseArea 
        {
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
            cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        }
    }

    Component.onCompleted: 
    {
        seo.setDescription("This description is from app.qml")
        seo.setKeywords("test,qml,wasm")
        seo.setTitle("Dynamic QML - App")
    }
}
