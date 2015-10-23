import QtQuick 2.0

Rectangle{
    id: rectangleId
    property alias text: textId.text
    property alias colorText: textId.color
    property alias colorBg: rectangleId.color



    width: textId.width + 6
    radius: 3



    Text{
        id:textId
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 10
    }


}
