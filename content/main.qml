import QtQuick
import QtQuick.Controls
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
        color: "white"
        textFormat: Text.RichText
        text: "<style>a:link{color:green}</style>Hello world!.<br>Navigate to the next <a href=\"app\">page</a>."
        onLinkActivated: (link)=> item.loadPage(link)
    }
    
    Button 
    {
        id: enter
        text: "Enter Fullscreen"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        onClicked: {
            seo.runScript("document.documentElement.requestFullscreen()")
            enter.visible = false
            exit.visible = true
        }
    }
    
    Button 
    {
        id: exit
        visible: false
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        text: "Exit Fullscreen"
        onClicked:
        {
            seo.runScript("document.documentElement.exitFullscreen()")
            exit.visible = false
            enter.visible = true   
        }
    }

    Component.onCompleted: 
    {
        seo.setDescription("This content was rendered in using C++,QML and WASM")
        seo.setKeywords("QML, WASM, C++")
        seo.setTitle("Dynamic QML - Main")
    }
}
