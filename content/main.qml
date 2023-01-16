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
        onClicked: {
            seo.runScript("document.requestFullscreen()")
            enter.visible = false
            exit.visible = true
        }
    }
    
    Button 
    {
        id: exit
        visible: false
        text: "Exit Fullscreen"
        onClicked:
        {
            seo.runScript("document.exitFullscreen()")
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
