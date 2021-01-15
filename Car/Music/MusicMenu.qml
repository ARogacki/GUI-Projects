import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQml 2.12
import Qt.labs.settings 1.0
import ".."

Item {
    id: music
    Settings{
        id: settings
        property string backgroundColor: "transparent"
        property string textColor: "transparent"
    }
    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0
        background: Rectangle{
            color: settings.value("backgroundColor")
        }
        Repeater{
            id: repeater
            model: [["Nightfall", "Blind Guardian", 100], ["Sadly Sings Destiny", "Blind Guardian", 150], ["Feel Good Inc.", "Gorillaz", 250]]
            Item {
                id: page
                Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: parent.height / 12
                        font.pointSize: parent.height / 14
                        text: modelData[0]
                        color: settings.value("textColor")
                        Text{
                            text: modelData[1]
                            font.pointSize: parent.font.pointSize / 3
                            anchors.top: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: parent.color
                        }
                        RoundButton{
                            id: playerButton
                            property bool started: false
                            icon.color: "transparent"
                            icon.source: (started == false) ? "startIcon.png" : "stopIcon.png"
                            icon.height: parent.height
                            icon.width: parent.width
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.verticalCenter
                            anchors.topMargin: parent.height*2

                            onClicked: {
                                playerButton.started = (started == false) ? true : false
                            }
                            ProgressBar{
                                id: firstSong
                                from: 0
                                to: modelData[2] //song length
                                value: 0
                                anchors.top: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: parent.height
                            }

                            RoundButton{
                                id: repeatButton
                                opacity: 1
                                icon.color: "transparent"
                                icon.source: "repeatIcon.png"
                                icon.height: parent.height/3
                                icon.width: parent.width/3
                                anchors.top: parent.top
                                anchors.right: parent.right
                                anchors.rightMargin: parent.width/1.5
                                anchors.topMargin: parent.height/1.5
                                onClicked: {
                                    firstSong.value = 0
                                    playerButton.started = false
                                }
                            }
                        }
                    }
                    Timer {
                        id: songOneTimer
                        interval: 100
                        repeat: true
                        running: playerButton.started
                        //onTriggered: firstSong.value < firstSong.to ? firstSong.value += 1.0 : (firstSong.value = firstSong.from)
                        onTriggered:{
                            if(firstSong.value < firstSong.to){
                                firstSong.value += 1
                            }
                            else{
                                firstSong.value = firstSong.from
                                playerButton.started = false
                                var temp = repeater.count
                                if(!(view.currentIndex+1 === temp)){
                                    //console.log(view.currentIndex+1, repeater.count, view.currentIndex+1 === temp)
                                    view.currentIndex += 1
                                }
                            }
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

    Slider {
        id: volume
        RoundButton {
            anchors.bottom: parent.top
            icon.color: "transparent"
            icon.source: (volume.value === 0) ? "mutedIcon.png" : "volumeIcon.png"
            icon.height: parent.height
            icon.width: parent.width
            onClicked: {
                volume.value = 0
            }
        }
        from: 0
        value: 25
        to: 100
        orientation: Qt.Vertical
        anchors.verticalCenter: parent.verticalCenter
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
