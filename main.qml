import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import at.crowdware.wasm 1.0

ApplicationWindow
{
    id: mainWindow
    visible: true

    Seo
    {
        id: seo
    }

    StackView
    {
        id: stackview
        anchors.fill: parent

        NumberAnimation
        {
            id: fadeOut
            property: "opacity"
            from: 1
            to: 0
            duration: 500
        }
        NumberAnimation
        {
            id: fadeIn
            property: "opacity"
            from: 0
            to: 1
            duration: 500
        }
    }

    Connections
    {
        id: conn
        target: null
        ignoreUnknownSignals: true
        function onLoadPage(page)
        {
            mainWindow.loadPage(page)
            seo.runScript("window.location = \"#" + page + "\"")
        }
    }

    property var component;
    property var serverUrl;

    function setProperties(url: string, theme: string, foreground: string, background: string, primary: string, accent: string)
    {
        serverUrl = url;
        if(theme !== "")
            Material.theme =  parseInt(theme)
        if(foreground !== "")
            Material.foreground = foreground
        if(background !== "")
            Material.background = background
        if(primary !== "")
            Material.primary = primary
        if(accent !== "")
            Material.accent = accent
    }

    function loadPage(page: string)
    {
        var url = serverUrl + page + ".qml"
        fadeOut.target = stackview.currentItem
        component = Qt.createComponent(url)
        if (component.status === Component.Ready)
        {
            fadeIn.target = component.createObject(stackview)
            showPage()
        }
        else if (component.status === Component.Error)
        {
            var error = component.errorString()
            if(error.includes("File not found"))
                loadPage("404")
            else
                console.log("Error loading component:", error);
        }
        else
            component.statusChanged.connect(finishCreation);
    }

    function finishCreation()
    {
        if (component.status === Component.Ready)
        {
            fadeIn.target = component.createObject(stackview)
            showPage()
        }
        else if (component.status === Component.Error)
        {
            var error = component.errorString()
            if(error.includes("File not found"))
                loadPage("404")
            else
                console.log("Error loading component:", error);
        }
    }

    function showPage()
    {
        fadeOut.start()
        stackview.replace(fadeIn.target)
        fadeIn.start()
        if(fadeOut.target != null)
            fadeOut.target.destroy()
        conn.target = fadeIn.target
    }
}
