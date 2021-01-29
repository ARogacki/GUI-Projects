import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt.labs.settings 1.0

ApplicationWindow{
    width: 640
    height: 480
    id: thirdScreen
    color: "white"
    title: "User panel"
    Values {
        id: values
    }

    StackView {
        id: stackView

        focus: true
        anchors.fill: parent

        initialItem: MainMenu {
            onLaunched: stackView.push(page)
        }
    }
}
