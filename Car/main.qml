import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQml 2.12
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.12

ApplicationWindow {
    width: 640
    height: 480
    id: mainScreen
    visible: true
    color: "#000000"
    title: "Dashboard"

    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "black"
        property real fuel: 100
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
            title: "Options"
            MenuItem {
                text: "Control"
                onTriggered: control.visible = true
            }
            MenuItem {
                text: "User panel"
                onTriggered: user.visible = true
            }
            MenuItem {
                text: "Exit"
                onTriggered: Qt.quit()
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
            Image{
                id: leftIndicator
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height/8
                width: height
                source: "leftArrow.png"
                layer {
                    enabled: true
                    effect: ColorOverlay {
                        id: leftIndicatorColor
                        color: (values.leftIndicatorOn) ? "green" : "gray"
                    }
                }

            }
            CircularGauge {
                id: fuel
                value: values.fuel
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 100
                width: height
                height: container.height * 0.25
                style: FuelMeterStyle {
                    id: fuelGaugeStyle
                    minimumValueAngle: -90
                    maximumValueAngle: 90
                    minorTickmark: Rectangle {
                    }
                    tickmarkLabel: Text {
                        color: "white"
                        visible: styleData.value === 0 || styleData.value === 100
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
            Image{
                id: rightIndicator
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height/8
                width: height
                source: "rightArrow.png"
                layer {
                    enabled: true
                    effect: ColorOverlay {
                        id: rightIndicatorColor
                        color: (values.rightIndicatorOn) ? "green" : "gray"
                    }
                }
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
                if(values.rpm < 8){
                    values.rpm += 0.1
                }
                values.fuel -= 0.0005
                if(values.rpm > 0){
                values.rpm -= 0.05
                }
            }
            else if(values.gear == 4){
                if(values.accelerate && values.kph < 80 && values.fuel > 0){
                    values.kph += 0.4
                    values.fuel -= 0.002
                }
                else if(!values.accelerate && values.kph > 80){
                    values.kph -= 0.3
                }
                if(values.rpm < 6){
                    values.rpm += 0.05
                }
                values.fuel -= 0.0003
                if(values.rpm > 0){
                values.rpm -= 0.02
                }
            }
            else if(values.gear == 3){
                if(values.accelerate && values.kph < 60 && values.fuel > 0){
                    values.kph += 0.3
                    values.fuel -= 0.001
                }
                if(values.rpm < 5){
                    values.rpm += 0.03
                }
                else if(!values.accelerate && values.kph > 60){
                    values.kph -= 0.2
                }
                values.fuel -= 0.0001
                if(values.rpm > 0){
                values.rpm -= 0.01
                }

            }
            else if(values.gear == 2){
                if(values.accelerate && values.kph < 40 && values.fuel > 0){
                    values.kph += 0.2
                    values.fuel -= 0.0005
                }
                if(values.rpm < 3){
                    values.rpm += 0.02
                }
                else if(!values.accelerate && values.kph > 40){
                    values.kph -= 0.2
                }
                values.fuel -= 0.00005
                if(values.rpm > 0){
                values.rpm -= 0.01
                }

            }
            else if(values.gear == 1){
                if(values.accelerate && values.kph < 20 && values.fuel > 0){
                    values.kph += 0.2
                    values.fuel -= 0.0001
                }
                if(values.rpm < 2){
                    values.rpm += 0.01
                }
                else if(!values.accelerate && values.kph > 20){
                    values.kph -= 0.2
                }
                values.fuel -= 0.00001
                if(values.rpm > 0){
                values.rpm -= 0.005
                }

            }
            else if(values.gear == 0){
                if(values.kph >= 0){
                    values.kph -= 0.2
                }
                if(values.rpm > 0){
                values.rpm -= 0.01
                }
            }
            else if(values.gear == -1 && values.kph < 10 && values.fuel > 0){
                values.kph += 0.2
                values.fuel -= 0.00001
                if(values.rpm < 2){
                    values.rpm += 0.01
                }
                if(values.rpm > 0){
                values.rpm -= 0.005
                }
            }

            if(values.gear != 0){
                values.kph -= 0.1
            }
            settings.fuel = values.fuel
        }
    }
}
