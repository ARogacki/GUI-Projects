import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1
import Qt.labs.settings 1.0
import ".."

Item {
    id: settingMenu
    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "transparent"
        property bool darkMode: false
    }
    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0
        background: Rectangle{
            id: background
            color: settings.value("backgroundColor")
        }
        Item{
            id: page
            property string textColor: settings.textColor
            Text{
                text: "Settings"
                font.pointSize: parent.height / 14
                anchors.horizontalCenter: parent.horizontalCenter
                color: page.textColor
            }
            Item{
                id: backgroundSettings
                property int redValue: 255
                property int greenValue: 255
                property int blueValue: 255
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height/8
                height: parent.height/3
                width: parent.width/2
                Text{
                    id: backgroundText
                    font.pointSize: parent.height / 14
                    color: page.textColor
                    text: "Background"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Slider {
                    id: red
                    anchors.top: backgroundText.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.redValue
                    to: 255
                    Text{
                        text: "Red " + parent.value.toFixed(0)
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.greenValue
                    to: 255
                    Text{
                        text: "Green " + parent.value.toFixed(0)
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.blueValue
                    to: 255
                    Text{
                        text: "Blue " + parent.value.toFixed(0)
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
                    property string red: (parent.redValue.toString(16).length < 2) ? "0"+parent.redValue.toString(16) : parent.redValue.toString(16)
                    property string blue: (parent.blueValue.toString(16).length < 2) ? "0"+parent.blueValue.toString(16) : parent.blueValue.toString(16)
                    property string green: (parent.greenValue.toString(16).length < 2) ? "0"+parent.greenValue.toString(16) : parent.greenValue.toString(16)
                    property string hexValue: "#" + preview.red + preview.green + preview.blue
                    color: hexValue
                    anchors.right: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height / 4
                    width: height
                    border.color: "black"
                    border.width: 3
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(backgroundSettings.redValue < 60 && backgroundSettings.blueValue < 60 && backgroundSettings.greenValue < 60){
                                settings.setValue("darkMode", true)
                            }
                            else{
                                settings.setValue("darkMode", false)
                            }
                            background.color = parent.hexValue
                            settings.setValue("backgroundColor", preview.hexValue)
                        }
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
                height: parent.height/3
                width: parent.width/2
                Text{
                    id: textText
                    font.pointSize: parent.height / 14
                    color: page.textColor
                    text: "Text"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Slider {
                    id: redText
                    anchors.top: textText.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.redValue
                    to: 255
                    Text{
                        text: "Red " + parent.value.toFixed(0)
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.greenValue
                    to: 255
                    Text{
                        text: "Green " + parent.value.toFixed(0)
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    value: parent.blueValue
                    to: 255
                    Text{
                        text: "Blue " + parent.value.toFixed(0)
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
                    property string red: (parent.redValue.toString(16).length < 2) ? "0"+parent.redValue.toString(16) : parent.redValue.toString(16)
                    property string blue: (parent.blueValue.toString(16).length < 2) ? "0"+parent.blueValue.toString(16) : parent.blueValue.toString(16)
                    property string green: (parent.greenValue.toString(16).length < 2) ? "0"+parent.greenValue.toString(16) : parent.greenValue.toString(16)
                    property string hexValue: "#" + previewText.red + previewText.green + previewText.blue
                    color: hexValue
                    anchors.right: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height / 4
                    width: height
                    border.color: "black"
                    border.width: 3
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            page.textColor = previewText.hexValue
                            settings.setValue("textColor", previewText.hexValue)
                        }
                    }
                }
            }
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
