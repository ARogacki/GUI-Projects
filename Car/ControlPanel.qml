import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.12

ApplicationWindow{
    width: 640
    height: 480
    id: secondScreen
    color: "#000000"
    title: qsTr("Car control")

    property int gear: gears.value
    property int previousGear: 0
    property bool accelerate: false
    property string currentWeather: "snowy"
    property real currentTemperature: temperature.value
    property string currentHazards: "nothing"
    property string lastRefuel: settings.lastRefuel
    Settings{
        id: settings
        property real fuel: 100
        property string lastRefuel: Qt.formatDateTime(new Date(), "dd.MM.yyyy")
    }
    Item {
        id: container
        width: secondScreen.width
        height: Math.min(secondScreen.width, secondScreen.height)
        anchors.fill: parent
        property real defaultButtonHeight: height/9
        property real defaultButtonWidth: width/7
        property real defaultMargin: 2
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Rectangle {
                Layout.preferredWidth: parent.width / 2
                Layout.fillHeight: true
                color: "transparent"
                Text {
                    id: gearsText
                    text: "Gears"
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height/6
                    font.pointSize: parent.height/12
                    minimumPixelSize: 5
                }
                Slider {
                    id: gears
                    from: -1
                    value: 0
                    to: 5
                    stepSize: 1
                    orientation: Qt.Vertical
                    anchors.top: gearsText.bottom
                    anchors.horizontalCenter: gearsText.horizontalCenter
                    pressed: {
                        secondScreen.previousGear = value
                    }
                    onValueChanged: {
                        if(secondScreen.previousGear < value){
                            secondScreen.accelerate = true
                        }
                        else{
                            secondScreen.accelerate = false
                        }
                    }
                }

                Text {
                    id: gear5
                    text: "5"
                    anchors.top: gears.top
                    anchors.left: gears.right
                    font.pointSize: parent.height/20
                    color: "white"
                }
                Text {
                    text: "R"
                    anchors.bottom: gears.bottom
                    anchors.left: gears.right
                    font.pointSize: parent.height/20
                    color: "white"
                }
                Button{
                    id: turnLeft
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    anchors.right: refuel.left
                    anchors.rightMargin: container.defaultMargin
                    anchors.top: refuel.top
                    text: "Turn left"
                    onClicked: {
                        values.rightIndicatorOn = false
                        if(values.leftIndicatorOn){
                            values.leftIndicatorOn = false
                        }
                        else{
                            values.leftIndicatorOn = true
                        }
                    }
                }
                Button{
                    id: refuel
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    anchors.horizontalCenter: gears.horizontalCenter
                    anchors.top: gears.bottom
                    text: "Refuel"
                    onClicked: {
                        settings.fuel = 100
                        values.fuel = 100
                        settings.lastRefuel = Qt.formatDateTime(new Date(), "dd.MM.yyyy")
                        secondScreen.lastRefuel = Qt.formatDateTime(new Date(), "dd.MM.yyyy")
                    }
                }
                Button{
                    id: turnRight
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    anchors.left: refuel.right
                    anchors.leftMargin: container.defaultMargin
                    anchors.top: refuel.top
                    text: "Turn right"
                    onClicked: {
                        values.leftIndicatorOn = false
                        if(values.rightIndicatorOn){
                            values.rightIndicatorOn = false
                        }
                        else{
                            values.rightIndicatorOn = true
                        }
                    }
                }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
                Text {
                    id: temperatureText
                    text: "Weather"
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    font.pointSize: parent.height/12
                    minimumPixelSize: 5
                }
                Image{
                    source: "lowTemp.png"
                    anchors.verticalCenter: temperature.verticalCenter
                    anchors.right: temperature.left
                    height: temperature.height
                    width: height
                }

                Slider {
                    id: temperature
                    from: -40
                    value: 5
                    to: 40
                    orientation: Qt.Horizontal
                    anchors.top: temperatureText.bottom
                    anchors.horizontalCenter: temperatureText.horizontalCenter
                }
                Image{
                    source: "highTemp.png"
                    anchors.verticalCenter: temperature.verticalCenter
                    anchors.left: temperature.right
                    height: temperature.height
                    width: height
                }
                Button{
                    id: weatherSnow
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Snow"
                    anchors.top: temperature.bottom
                    anchors.horizontalCenter: temperature.horizontalCenter
                    onClicked: {
                        secondScreen.currentWeather = "snowy"
                    }
                }
                Button{
                    id: weatherSunny
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Sunny"
                    anchors.top: weatherSnow.top
                    anchors.right: weatherSnow.left
                    anchors.rightMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentWeather = "sunny"
                    }
                }
                Button{
                    id: weatherCloudy
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Cloudy"
                    anchors.top: weatherSunny.top
                    anchors.left: weatherSnow.right
                    anchors.leftMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentWeather = "cloudy"
                    }
                }
                Button{
                    id: weatherFoggy
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Foggy"
                    anchors.top: weatherSunny.bottom
                    anchors.horizontalCenter: weatherSunny.horizontalCenter
                    anchors.topMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentWeather = "foggy"
                    }
                }
                Button{
                    id: weatherRainy
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Rain"
                    anchors.top: weatherSnow.bottom
                    anchors.horizontalCenter: weatherSnow.horizontalCenter
                    anchors.topMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentWeather = "rainy"
                    }
                }
                Text{
                    id: hazardsText
                    text: "Hazards"
                    color: "white"
                    font.pointSize: parent.height/14
                    anchors.top: weatherRainy.bottom
                    anchors.topMargin: parent.height/5
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Button{
                    id: cleanRoad
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Clean"
                    anchors.top: hazardsText.bottom
                    anchors.horizontalCenter: hazardsText.horizontalCenter
                    onClicked: {
                        secondScreen.currentHazards = "nothing"
                    }
                }
                Button{
                    id: icyRoad
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Ice"
                    anchors.top: cleanRoad.top
                    anchors.right: cleanRoad.left
                    anchors.rightMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentHazards = "icy"
                    }
                }
                Button{
                    id: wetRoad
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Wet"
                    anchors.top: cleanRoad.top
                    anchors.left: cleanRoad.right
                    anchors.leftMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentHazards = "wet"
                    }
                }
                Button{
                    id: foggyRoad
                    height: container.defaultButtonHeight
                    width: container.defaultButtonWidth
                    text: "Fog"
                    anchors.top: icyRoad.bottom
                    anchors.horizontalCenter: icyRoad.horizontalCenter
                    anchors.topMargin: container.defaultMargin
                    onClicked: {
                        secondScreen.currentHazards = "fog"
                    }
                }
            }
        }
    }
}
