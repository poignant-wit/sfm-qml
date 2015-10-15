import QtQuick 2.0





Item{
    property int rowHeight
    signal clickDetails
    height: rowHeight
    width: parent.width

    Text {
        id: name
        text: qsTr("text")
        anchors.right: parent.right
    }

    //color: "blue"

}
