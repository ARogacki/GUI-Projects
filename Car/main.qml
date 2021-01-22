import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQml 2.12
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
        visible: false
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
    Timer {
        id: gearsTimer
        interval: 10
        repeat: true
        running: true
        onTriggered:{
            if(values.gear == 5){
                if(values.accelerate && values.kph < 100 && values.fuel > 0){
                    values.kph += 0.6
                    values.fuel -= 0.003
                }
                values.fuel -= 0.0005
            }
            else if(values.gear == 4){
                if(values.accelerate && values.kph < 80 && values.fuel > 0){
                    values.kph += 0.4
                    values.fuel -= 0.002
                }
                else if(!values.accelerate && values.kph > 80){
                    values.kph -= 0.3
                }
                values.fuel -= 0.0003
            }
            else if(values.gear == 3){
                if(values.accelerate && values.kph < 60 && values.fuel > 0){
                    values.kph += 0.3
                    values.fuel -= 0.001
                }
                else if(!values.accelerate && values.kph > 60){
                    values.kph -= 0.2
                }
                values.fuel -= 0.0001
            }
            else if(values.gear == 2){
                if(values.accelerate && values.kph < 40 && values.fuel > 0){
                    values.kph += 0.2
                    values.fuel -= 0.0005
                }
                else if(!values.accelerate && values.kph > 40){
                    values.kph -= 0.2
                }
                values.fuel -= 0.00005
            }
            else if(values.gear == 1){
                if(values.accelerate && values.kph < 20 && values.fuel > 0){
                    values.kph += 0.2
                    values.fuel -= 0.0001
                }
                else if(!values.accelerate && values.kph > 20){
                    values.kph -= 0.2
                }
                values.fuel -= 0.00001
            }
            else if(values.gear == 0){
                if(values.kph >= 0){
                    values.kph -= 0.2
                }
            }
            else if(values.gear == -1 && values.kph < 10 && values.fuel > 0){
                values.kph += 0.2
                values.fuel -= 0.00001
            }

            if(values.gear != 0){
                values.kph -= 0.1
            }
            console.log(values.fuel)
        }
    }

    //Timer for speed, gas + stop, fuel dependence

    /*
    Button{
        text: qsTr("Test");
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
    }
    */
}
