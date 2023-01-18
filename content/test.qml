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

    Text 
    {
        anchors.centerIn: parent
        textFormat: Text.RichText
        text: "<style>a:link{color:green}</style>This qml has been loaded dynamically from a web server.<br> Go back <a href=\"main\">home</a>."
        onLinkActivated: (link)=> item.loadPage(link)
    }

    Component.onCompleted: 
    {
        seo.setDescription("This description is from test.qml")
        seo.setKeywords("test")
        seo.setTitle("Dynamic QML - Test")
    }
}
