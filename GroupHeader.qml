import QtQuick 2.0
import QtQuick.Controls 1.2
import 'qrc:/js/js/ThemeApp.js' as Theme




Rectangle {
    id: root

    property string title
    signal clicked
    width: parent.width
    height: 30
    anchors.top: parent.top
    color: Theme.lightColor1
    Text {
        id: header
        x:  20
        y: 19
        color: Theme.CheckoutColMain
        text: title
        font.pixelSize: 16
        anchors.verticalCenter: parent.verticalCenter

        MouseArea{
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }

    Button{
        anchors.verticalCenter: root.verticalCenter
        anchors.left: header.right
        anchors.leftMargin: 10
    }
}


