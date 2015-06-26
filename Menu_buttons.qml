import QtQuick 2.0


FocusScope{



    id: menu
     height: 60; width: parent.width

    property string leftIconPath
    property string rightIconPath


    signal clickedLeft
    signal clickedCenter
    signal clickedRight


Rectangle{


    anchors.fill: parent
    color: "black"

    opacity: 0.7






    Image{
        id: centerIcon
        width: 64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/checkout/icons/homeButton.png"
        anchors.baseline: parent.Center

        MouseArea{
            width: parent.width
            height: parent.height
            onClicked: menu.clickedCenter()
        }
    }

    Image{
        id: leftIcon
        width: 64
        height: 64
        x: centerIcon.x - parent.width / 2 + 60
        y: centerIcon.y
        source: leftIconPath
        rotation: 180

        MouseArea{
            width: parent.width
            height: parent.height
            onClicked: menu.clickedLeft()

        }
    }

    Image{
        id: rightIcon
        width: 64
        height: 64
        x: centerIcon.x + parent.width / 2 - 60
        y: centerIcon.y
        source: "qrc:/checkout/icons/homeButton.png"

        MouseArea{
            width: parent.width
            height: parent.height
            onClicked: menu.clickedRight()

        }
    }



}



}
