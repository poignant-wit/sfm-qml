import QtQuick 2.0





Item{
    property int rowHeight
    signal clickDetails
    height: rowHeight
    width: parent.width

    Rectangle{
        height: rowHeight
        width: parent.width
    }

//    Text {
//        id: name
//        text: qsTr("text")
//        anchors.right: parent.right
//    }

    El_IconTriangle{
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        onClicked: clickDetails()
       // x:500

    }

    //color: "blue"

}
