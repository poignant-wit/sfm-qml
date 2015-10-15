import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0

Rectangle{
    id: rectangle1
    width: 600
    height: 600
    color: "#000000"

    Button {
        id: button1
        x: 262
        y: 300
        text: qsTr("Button")
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
    }

}
