import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    color: "black"
    signal clickCustomers
    signal clickOrders

    Button{
        anchors.horizontalCenter: parent.horizontalCenter
        y:50
        text:"ЗАКАЗЫ"
        onClicked: clickOrders()
    }
    Button{
        anchors.horizontalCenter: parent.horizontalCenter
        y:100
        text:"ЗАКАЗЧИКИ"
        onClicked: clickCustomers()
    }

    Button{
        anchors.horizontalCenter: parent.horizontalCenter
        y:150
        text:"ДИКТОРЫ"
    }






}

