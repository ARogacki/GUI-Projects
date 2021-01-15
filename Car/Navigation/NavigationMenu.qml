import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtLocation 5.12
import QtPositioning 5.12
import ".."

Item {
    id: navigation

    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(51.759445, 19.457216) // Lodz
        zoomLevel: 14
    }
    Button{
        id: homeButton
        icon.color: "transparent"
        icon.source: "../homeIcon.png"
        icon.height: parent.height
        icon.width: parent.width
        text: 'Music'
        display: AbstractButton.IconOnly

        height: parent.height / 8
        width: homeButton.height
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        background: Rectangle{
            color: "lightblue"
            border.width: 1
            border.color: "gray"
            radius: 4
        }

        palette {
            button: "lightblue"
        }


        onClicked: stackView.pop(null)
    }
}
