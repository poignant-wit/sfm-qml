import QtQuick 2.0
import 'qrc:/js/js/ThemeApp.js' as Theme




Rectangle {
    id: root

    property string title_header
    property color bgColor
    signal clicked


    width: parent.width
    height: 60
    anchors.top: parent.top
    color: bgColor



    Image {
        id: arrow
        source: Theme.arrow
        rotation: 180
        scale: 0.2
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width / 30 - 60

        MouseArea{
            anchors.fill: parent
            onClicked: root.clicked()
        }

    }

        Text {
            id: header
            y: 19
            color: Theme.lightColor1
            text: title_header
            font.pixelSize: 32
            anchors.verticalCenter: parent.verticalCenter
            x: arrow.x + 80
        }






}


