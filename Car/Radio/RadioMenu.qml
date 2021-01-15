import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import ".."

Item {
    id: radio
    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0
        Settings{
            id: settings
            property string backgroundColor: "transparent"
            property string textColor: "transparent"
        }
        Repeater{
            id: repeater
            model: [["Radio ZET", 92.60], ["Radio FM", 93.50], ["Radio Parada", 96]]
            Item {
                id: page
                Rectangle{
                    anchors.fill: parent
                    color: settings.value("backgroundColor")
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: parent.height / 14
                        color: settings.textColor
                        text: modelData[0]
                        Text{
                            text: modelData[1].toFixed(2)
                            font.pointSize: parent.font.pointSize / 2
                            anchors.top: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: parent.color
                        }
                    }
                }
            }
        }
    }
    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.top: view.top
        anchors.horizontalCenter: view.horizontalCenter
    }

    Slider {
        id: volume
        RoundButton {
            anchors.bottom: parent.top
            icon.color: "transparent"
            icon.source: (volume.value === 0) ? "mutedIcon.png" : "volumeIcon.png"
            icon.height: parent.height
            icon.width: parent.width
            onClicked: {
                volume.value = 0
            }
        }
        from: 0
        value: 25
        to: 100
        orientation: Qt.Vertical
        anchors.verticalCenter: parent.verticalCenter
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
