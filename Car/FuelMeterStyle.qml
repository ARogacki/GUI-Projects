import QtQuick 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.2

CircularGaugeStyle {
    id: fuelMeter
    tickmarkStepSize: 10
    labelStepSize: 10
    needle: Rectangle {
        y: outerRadius * 0.15
        implicitWidth: outerRadius * 0.03
        implicitHeight: outerRadius * 0.9
        antialiasing: true
        color: Qt.rgba(0.66, 0.3, 0, 1)
    }
}
