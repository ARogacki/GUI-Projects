import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt.labs.settings 1.0

ApplicationWindow {
    width: 640
    height: 480
    id: mainScreen
    visible: true
    color: "#000000"
    title: qsTr("Car dashboard")

    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "black"
    }

    Values {
        id: values
    }
    ControlPanel{
        id: control
        visible: false
    }
    UserPanel{
        id: user
        visible: true
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("Options")
            MenuItem {
                text: qsTr("Control")
                onTriggered: control.visible = true;
            }
            MenuItem {
                text: qsTr("User panel")
                onTriggered: user.visible = true;
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }
    Item {
        id: container
        width: mainScreen.width
        height: Math.min(mainScreen.width, mainScreen.height)
        anchors.centerIn: parent
        Row {
            id: gaugeRow
            spacing: container.width * 0.02
            anchors.centerIn: parent
            CircularGauge {
                id: fuel
                value: values.fuel
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 100
                width: height
                height: container.height * 0.25
                style: FuelMeterStyle {
                    id: fuelGaugeStyle
                    tickmarkLabel: Text {
                        color: "white"
                        visible: styleData.value === 0 || styleData.value === 100
                        //font.pixelSize: fuelGaugeStyle.toPixels(0.225)
                        text: styleData.value === 0 ? "E" : (styleData.value === 100 ? "F" : "")
                    }
                }
            }
            CircularGauge {
                id: speedometer
                value: values.kph
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 240
                width: height
                height: container.height * 0.5

                style: DashboardGaugeStyle {}
            }
            CircularGauge {
                id: rpm
                value: values.rpm
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 8
                width: height
                height: container.height * 0.25

                style: RPMmeterStyle {}
            }
        }
    }

    /*
    Button{
        text: qsTr("Test");
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
    }
    */
}
