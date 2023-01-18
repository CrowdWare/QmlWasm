import QtQuick 6.4
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

    TextEdit
    {
        anchors.centerIn: parent
        textFormat: Text.RichText
        readonly: true
        text: "<style>a:link{color:green} a:hover{color:orange}</style>Hello world.<br>Navigate to the next <a href=\"app\">page</a> or just enter #app or #test at the end of the adresse bar of your browser."
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
        onClicked: 
        {
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
