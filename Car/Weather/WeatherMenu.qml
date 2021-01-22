import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQml 2.12
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.12
import ".."

Item {
    id: weather
    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "transparent"
        property bool darkMode: false
    }
    Values{
        id: values
    }

    Item{
        anchors.fill: parent
        anchors.leftMargin: 0
        id: page
        Rectangle{
            anchors.fill: parent
            color: settings.backgroundColor
            Text{
                id: location
                text: "Location: Łódź"
                font.pointSize: parent.height / 14
                anchors.top: parent.top
                anchors.topMargin: parent.height / 12
                anchors.horizontalCenter: parent.horizontalCenter
                color: settings.textColor
                Text{
                    text: values.currentTemperature + "°"
                    font.pointSize: parent.font.pointSize / 1.5
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: settings.textColor
                }
            }

            Image{
                id: weatherImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "sunnyIcon.png"
            }
            ColorOverlay {
                anchors.fill: weatherImage
                source: weatherImage
                color: settings.textColor
                //color: (settings.darkMode) ? "white" : "black"
            }
            Text{
                id: hazardText
                text: ""
                font.pointSize: parent.height / 21
                anchors.top: weatherImage.bottom
                anchors.horizontalCenter: weatherImage.horizontalCenter
                color: settings.textColor
            }
            Timer {
                id: weatherChangeTimer
                interval: 100
                repeat: true
                running: true
                onTriggered:{
                    if(values.currentWeather == "sunny"){
                        weatherImage.source = "sunnyIcon.png"
                    }
                    else if(values.currentWeather == "snowy"){
                        weatherImage.source = "snowyIcon.png"
                    }
                    else if(values.currentWeather == "foggy"){
                        weatherImage.source =  "foggyIcon.png"
                    }
                    else if(values.currentWeather == "cloudy"){
                        weatherImage.source = "cloudIcon.png"
                    }
                    else if(values.currentWeather == "rainy"){
                        weatherImage.source = "rainyIcon.png"
                    }

                    if(values.currentHazards == "nothing"){
                        hazardText.text = ""
                    }
                    else if(values.currentHazards == "icy"){
                        hazardText.text = "Warning: Icy roads!"
                    }
                    else if(values.currentHazards == "wet"){
                        hazardText.text = "Warning: Wet roads!"
                    }
                    else if(values.currentHazards == "fog"){
                        hazardText.text = "Warning: Fog!"
                    }
                }
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
