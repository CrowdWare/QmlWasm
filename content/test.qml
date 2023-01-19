import QtQuick 2.13
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
        text: "This qml has been loaded dynamically from a web server.<br> Go back <a href=\"main\">home</a>."
        onLinkActivated: (link)=> item.loadPage(link)
        MouseArea 
        {
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
            cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        }
    }

    Component.onCompleted: 
    {
        seo.setDescription("This description is from test.qml")
        seo.setKeywords("test")
        seo.setTitle("Dynamic QML - Test")
    }
}
