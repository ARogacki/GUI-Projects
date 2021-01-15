import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

ApplicationWindow{
    width: 200
    height: 200
    id: secondScreen
    color: "#000000"
    title: qsTr("Car control")

    property real kph: dial.value
    Item {
        id: container
        width: secondScreen.width
        height: Math.min(secondScreen.width, secondScreen.height)
        anchors.centerIn: parent

        Dial {
            id: dial
            anchors.centerIn: parent
            width: height
            height: container.height * 0.5
            value: 30
            maximumValue: 240
        }

    }

}
