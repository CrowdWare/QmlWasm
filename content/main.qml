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

    Text
    {
        anchors.centerIn: parent
        color: "white"
        text: "Hello world!<br>Navigate to the next <a href=\"app\">page</a> or just enter #app or #test at the end of the adresse bar of your browser."
        onLinkActivated: (link)=> item.loadPage(link)
        
        MouseArea 
        {
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
            cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        }
    }
    
    Label
    {
        anchors.left: parent.left
        anchors.top: parent.top
        text: "Label <a href=\"app\">page</a>"
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
