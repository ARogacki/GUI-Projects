import QtQuick 2.12
import Qt.labs.settings 1.0

Item {
    id: values
    Settings{
        id: settings
        property string backgroundColor: "transparent"
    }

    property real kph: control.kph
    property real rpm: 0
    property real fuel: 0.8
    property string backgroundColor: settings.backgroundColor
}
