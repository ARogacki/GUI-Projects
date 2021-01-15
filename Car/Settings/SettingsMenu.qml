import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1
import Qt.labs.settings 1.0
import ".."

Item {
    SwipeView {
        id: view
        anchors.fill: parent
        Values{
            id: values
        }
        Settings{
            id: settings
            property string backgroundColor: "transparent"
            property string textColor: "transparent"
        }
        /*
        ColorDialog {
            id: colorDialog
            visible: true
            modality: Qt.Modal
            title: "Choose a color"
            color: "green"
            showAlphaChannel: colorDialogAlpha.checked
            onAccepted: { console.log("Accepted: " + color) }
            onRejected: { console.log("Rejected") }
        }
        */
        currentIndex: 0
        Item{
            id: page
            anchors.fill: parent
            property string textColor: settings.textColor

            Item{
                id: backgroundSettings
                property int redValue: 255
                property int greenValue: 255
                property int blueValue: 255
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.rightMargin: parent.width/2
                height: parent.height/2
                width: parent.width/2
                Slider {
                    id: red
                    from: 0
                    value: parent.redValue
                    to: 255
                    Text{
                        text: "Red " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.redValue = value
                    }
                }
                Slider {
                    id: green
                    anchors.top: red.bottom
                    from: 0
                    value: parent.greenValue
                    to: 255
                    Text{
                        text: "Green " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.greenValue = value
                    }
                }
                Slider {
                    id: blue
                    anchors.top: green.bottom
                    from: 0
                    value: parent.blueValue
                    to: 255
                    Text{
                        text: "Blue " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.blueValue = value
                    }
                }
                //property string hexValue: red.value.toString(16) + blue.value.toString(16) + green.value.toString(16)
                Rectangle {
                    id: preview
                    property string hexValue: "#" + parent.redValue.toString(16) + parent.blueValue.toString(16) + parent.greenValue.toString(16)
                    color: hexValue
                    anchors.top: blue.bottom
                    height: parent.height / 10
                    width: height
                    border.color: "black"
                    border.width: 3
                }

                Button{
                    id: changeBackground
                    anchors.left: preview.right
                    anchors.verticalCenter: preview.verticalCenter
                    Text{
                        text: "change"
                    }

                    onClicked: {
                        background.color = preview.hexValue
                        settings.setValue("backgroundColor", preview.hexValue)
                    }
                }
            }
            Item{
                id: textSettings
                property int redValue: 255
                property int greenValue: 255
                property int blueValue: 255
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: backgroundSettings.bottom
                anchors.rightMargin: parent.width/2
                height: parent.height/2
                width: parent.width/2
                Slider {
                    id: redText
                    from: 0
                    value: parent.redValue
                    to: 255
                    Text{
                        text: "Red " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.redValue = value
                    }
                }
                Slider {
                    id: greenText
                    anchors.top: redText.bottom
                    from: 0
                    value: parent.greenValue
                    to: 255
                    Text{
                        text: "Green " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.greenValue = value
                    }
                }
                Slider {
                    id: blueText
                    anchors.top: greenText.bottom
                    from: 0
                    value: parent.blueValue
                    to: 255
                    Text{
                        text: "Blue " + parent.value
                        font.pointSize: parent.height/2
                        anchors.left: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        color: page.textColor
                    }
                    onValueChanged: {
                        parent.blueValue = value
                    }
                }
                Rectangle {
                    id: previewText
                    property string hexValue: "#" + parent.redValue.toString(16) + parent.blueValue.toString(16) + parent.greenValue.toString(16)
                    color: hexValue
                    anchors.top: blueText.bottom
                    height: parent.height / 10
                    width: height
                    border.color: "black"
                    border.width: 3
                }

                Button{
                    id: changeText
                    anchors.left: previewText.right
                    anchors.verticalCenter: previewText.verticalCenter
                    Text{
                        text: "change"
                    }

                    onClicked: {
                        //values.backgroundColor = previewText.hexValue
                        page.textColor = previewText.hexValue
                        settings.setValue("textColor", previewText.hexValue)
                    }
                }
            }

        }

        background: Rectangle{
            id: background
            color: settings.value("backgroundColor")
        }
    }
    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.top: view.top
        anchors.horizontalCenter: view.horizontalCenter
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


        onClicked: {
            stackView.pop(null)
        }
    }
}
