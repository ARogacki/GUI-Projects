import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import QtQml 2.12
import ".."

Item {
    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "transparent"
    }
    Rectangle{
        anchors.fill: parent
        Values{
            id: values
        }
        color: settings.value("backgroundColor")
        Rectangle{
            anchors.centerIn: parent
            height: parent.height/1.5
            width: parent.width/1.5
            color: "transparent"
            Text{
                id: model
                text: "Model: BMW"
                font.pointSize: parent.height / 14
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                color: settings.value("textColor")
                minimumPixelSize: 5
            }
            Text{
                id: year
                text: "Produced in: 2020"
                font.pointSize: parent.height / 14
                anchors.top: model.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: settings.value("textColor")
                minimumPixelSize: 5
            }
            Text{
                id: overall
                text: "Overall km: 3000"
                font.pointSize: parent.height / 14
                anchors.top: year.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: settings.value("textColor")
                minimumPixelSize: 5
            }
            Text{
                id: latest
                text: "Last refuel: " + values.lastRefuel
                font.pointSize: parent.height / 14
                anchors.top: overall.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: settings.value("textColor")
                minimumPixelSize: 5
            }
        }
        /*
        Text{
            id: speed
            text: "Current speed: " + values.kph
            font.pointSize: parent.height / 14
            anchors.top: latest.top
            anchors.topMargin: parent.height / 12
            anchors.horizontalCenter: parent.horizontalCenter
            color: settings.value("textColor")
        }
        */
    }
    Timer {
        id: updateDetails
        interval: 100
        repeat: true
        running: true
        onTriggered:{
            latest.text = "Last refuel: " +values.lastRefuel
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
