import QtQuick 2.12
import Qt.labs.settings 1.0

Item {
    id: values
    Settings{
        id: settings
        property string backgroundColor: "transparent"
    }

    property int gear: control.gear
    property bool accelerate: control.accelerate
    //property real kph: control.kph
    property real kph: 0
    property real rpm: 0
    property real fuel: 100
    property string currentWeather: control.currentWeather
    property real currentTemperature: control.currentTemperature
    property string currentHazards: control.currentHazards
}
