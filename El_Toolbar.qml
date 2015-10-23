import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    property string buttonTitle
    property string title
    signal clickButton
    signal clickIcon

    color: "BLACK"



    El_IconMenu{
        id: iconMenu
        width: parent.height
        height: parent.height
        onClickButton: clickIcon()

    }

    Text {
        id: name
        text: buttonTitle
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: iconMenu.right
        anchors.leftMargin: 10
        color: "white"
        MouseArea{
            height: parent.height
            width: parent.width
            onClicked: clickButton()
        }
    }

    Text {
        //id: title
        text: title
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter


        color: "grey"
    }

    TextField{
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        width: 150
        height: 20

    }


}

