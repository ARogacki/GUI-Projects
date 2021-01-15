import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import ".."

Item {
    id: weather
    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "transparent"
    }
    Item{
        anchors.fill: parent
        anchors.leftMargin: 0
        id: page
        property real temperature: 5
        Rectangle{
            anchors.fill: parent
            color: settings.backgroundColor
            Text{
                text: "Location: Łódź"
                font.pointSize: parent.height / 14
                anchors.top: parent.top
                anchors.topMargin: parent.height / 12
                anchors.horizontalCenter: parent.horizontalCenter
                //color: settings.value()
                Text{
                    text: page.temperature + "°"
                    font.pointSize: parent.font.pointSize / 1.5
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: settings.textColor
                }
            }
            Image{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "foggyIcon.png"
            }
        }
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
