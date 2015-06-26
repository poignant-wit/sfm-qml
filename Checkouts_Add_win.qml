import QtQuick 2.0

Rectangle {
    id: win
    width: 900
    height: 500
    color: "red"
    state: "MINIMUM"

    Component.onCompleted:{ state = "MAXIMUM"
        focus = forceActiveFocus()
    }

    MouseArea{
        anchors.fill: parent
        onClicked: console.log("MOUSE")
    }

    states: [
        State{
            name: "MINIMUM"
            PropertyChanges{
                target: parent
                scale: 0
            }
        },
        State{
            name: "MAXIMUM"
            PropertyChanges{
                target: parent
                scale: 1
            }
        }
    ]

    transitions: [
        Transition {
            from: "MINIMUM"
            to: "MAXIMUM"
            PropertyAnimation{
                target: parent
                property: "scale"
                duration: 200
            }

        }
    ]


    Grid {
        id: grid1
        spacing: 20
        anchors.fill: parent
        rows: 2
        columns: 2

        Text {
            id: text1
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle1
            width: 200
            height: 200
            color: "#ffffff"

            TextInput {
                id: textInput1
                width: 80
                height: 20
                text: qsTr("Text Input")
                font.pixelSize: 12
            }
        }

        Text {
            id: text2
            text: qsTr("Text")
            font.pixelSize: 12
        }
    }


}

