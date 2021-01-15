import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtQml 2.12
PathView {
    id: mainMenu
    signal launched(string page)
    Settings{
        id: settings
        property string backgroundColor: "transparent"
    }

    Item{
        id: page
        anchors.fill: parent
        Rectangle{
            id: background
            color: settings.value("backgroundColor")
            anchors.fill: parent
            GridLayout {
                id: grid
                anchors.fill: parent
                columns: 3
                rows: 2
                property double colMulti : grid.width / grid.columns
                property double rowMulti : grid.height / grid.rows
                function prefWidth(item){
                    return colMulti * item.Layout.columnSpan
                }
                function prefHeight(item){
                    return rowMulti * item.Layout.rowSpan
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Music/musicIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Music'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Music/MusicMenu.qml"))
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Radio/radioIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Radio'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Radio/RadioMenu.qml"))
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Navigation/navigationIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Navigation'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Navigation/NavigationMenu.qml"))
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Weather/weatherIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Weather'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Weather/WeatherMenu.qml"))
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Details/detailsIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Details'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Details/DetailMenu.qml"))
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Rectangle {
                    color: background.color
                    Button{
                        icon.color: "transparent"
                        icon.source: "Settings/settingsIcon.png"
                        icon.height: parent.height
                        icon.width: parent.width
                        text: 'Settings'
                        display: AbstractButton.IconOnly

                        width: grid.prefWidth(this) * 0.75
                        height: width*0.75
                        anchors.centerIn: parent

                        palette {
                            button: "lightblue"
                        }

                        onClicked: {
                            mainMenu.launched(Qt.resolvedUrl("Settings/SettingsMenu.qml"))
                            background.color = settings.value("backgroundColor")
                        }
                    }
                    Layout.rowSpan   : 1
                    Layout.columnSpan: 1
                    Layout.preferredWidth  : grid.prefWidth(this)
                    Layout.preferredHeight : grid.prefHeight(this)
                }
                Timer {
                    id: backgroundRefresh
                    interval: 100
                    repeat: true
                    running: true
                    onTriggered:{
                        background.color = settings.value("backgroundColor")
                    }
                }
            }
        }
        }




}

/*
DropShadow {
    id: rectShadow
    anchors.fill: source
    cached: true
    horizontalOffset: 3
    verticalOffset: 3
    radius: 8.0
    samples: 16
    color: "#80000000"
    smooth: true
    source: parent
}
*/
