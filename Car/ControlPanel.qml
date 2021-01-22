import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

ApplicationWindow{
    width: 640
    height: 480
    id: secondScreen
    color: "#000000"
    title: qsTr("Car control")

    property real kph: dial.value
    property int gear: gears.value
    property int previousGear: 0
    property bool accelerate: false
    property string currentWeather: "snowy"
    property real currentTemperature: temperature.value
    property string currentHazards: "nothing"
    Item {
        id: container
        width: secondScreen.width
        height: Math.min(secondScreen.width, secondScreen.height)
        anchors.fill: parent

        Dial {
            id: dial
            anchors.centerIn: parent
            height: container.height * 0.25
            width: height
            value: 30
            maximumValue: 240
        }

        Text {
            id: temperatureText
            text: "Temperature"
            color: "white"
            anchors.right: weatherSnow.left
            anchors.top: parent.top
        }

        Slider {
            id: temperature
            from: -40
            value: 5
            to: 40
            orientation: Qt.Vertical
            anchors.right: weatherSnow.left
            anchors.top: temperatureText.bottom
        }



        Text {
            id: gearsText
            text: "Gears"
            color: "white"
            anchors.left: parent.left
            anchors.top: parent.top
        }
        Slider {
            id: gears
            from: -1
            value: 0
            to: 5
            stepSize: 1
            orientation: Qt.Vertical
            anchors.left: parent.left
            anchors.top: gearsText.bottom
            pressed: {
                secondScreen.previousGear = value
            }

            onValueChanged: {
                console.log(secondScreen.previousGear, value)
                if(secondScreen.previousGear < value){
                    secondScreen.accelerate = true
                }
                else{
                    secondScreen.accelerate = false
                }
            }
        }


        Button{
            id: weatherSnow
            anchors.right: parent.right
            anchors.top: parent.top
            text: "Snow"
            onClicked: {
                secondScreen.currentWeather = "snowy"
            }
        }
        Button{
            id: weatherSunny
            text: "Sunny"
            anchors.top: weatherSnow.bottom
            anchors.horizontalCenter: weatherSnow.horizontalCenter
            onClicked: {
                secondScreen.currentWeather = "sunny"
            }
        }
        Button{
            id: weatherCloudy
            text: "Cloudy"
            anchors.top: weatherSunny.bottom
            anchors.horizontalCenter: weatherSunny.horizontalCenter
            onClicked: {
                secondScreen.currentWeather = "cloudy"
            }
        }
        Button{
            id: weatherFoggy
            text: "Foggy"
            anchors.top: weatherCloudy.bottom
            anchors.horizontalCenter: weatherCloudy.horizontalCenter
            onClicked: {
                secondScreen.currentWeather = "foggy"
            }
        }
        Button{
            id: weatherRainy
            text: "Rain"
            anchors.top: weatherFoggy.bottom
            anchors.horizontalCenter: weatherFoggy.horizontalCenter
            onClicked: {
                secondScreen.currentWeather = "rainy"
            }
        }
        Text{
            id: hazardsText
            text: "Hazards: "
            color: "white"
            anchors.top: weatherRainy.bottom
            anchors.horizontalCenter: weatherRainy.horizontalCenter
        }
        Button{
            id: cleanRoad
            text: "Clean"
            anchors.top: hazardsText.bottom
            anchors.horizontalCenter: hazardsText.horizontalCenter
            onClicked: {
                secondScreen.currentHazards = "nothing"
            }
        }
        Button{
            id: icyRoad
            text: "Ice"
            anchors.top: cleanRoad.bottom
            anchors.horizontalCenter: cleanRoad.horizontalCenter
            onClicked: {
                secondScreen.currentHazards = "icy"
            }
        }
        Button{
            id: wetRoad
            text: "Wet"
            anchors.top: icyRoad.bottom
            anchors.horizontalCenter: icyRoad.horizontalCenter
            onClicked: {
                secondScreen.currentHazards = "wet"
            }
        }
        Button{
            id: foggyRoad
            text: "Fog"
            anchors.top: wetRoad.bottom
            anchors.horizontalCenter: wetRoad.horizontalCenter
            onClicked: {
                secondScreen.currentHazards = "fog"
            }
        }
    }

}
