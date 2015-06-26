import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2
import 'qrc:/Checkout_Details_elements'
import QtQuick.Layouts 1.1
import 'qrc:/js/js/ThemeApp.js' as Theme


Rectangle{
    id: root
    property int row

    signal clickedBack

    width: parent.width
    height: parent.height

    //    Rectangle {
    //        id: rectangle1
    //        width: 500
    //        height: 97
    //        color: "#221b5f"
    //    }

    //    Header{
    //title_header: "efefvev"


    //    }



    //    Text {
    //        id: text1
    //        x: 37
    //        y: 19
    //        color: "#c9c9c9"
    //        text: qsTr("ЗАКАЗ")
    //        font.pixelSize: 26
    //    }

    //    Text {
    //        id: date_text
    //        x: 38
    //        y: 59
    //        width: 54
    //        height: 23
    //        color: "#9b9b9b"
    //        text: check_model.getRow(row).date_checkout
    //        font.pixelSize: 20
    //    }

    //    Text{
    //        x: 128
    //        y: 19
    //        color: "#fef3f3"
    //        text: check_model.getRow(row).id_checkout
    //        font.bold: true
    //        font.pointSize: 26

    //    }

    //    Text {
    //        id: text2
    //        x: 95
    //        y: 146
    //        width: 40
    //        height: 15
    //        text: qsTr("Название")
    //        verticalAlignment: Text.AlignVCenter
    //        font.pixelSize: 16
    //    }



    TextField {
        id: textField2
        x: 95
        y: 233
        width: 310
        height: 22
        placeholderText: qsTr("Text Field")
    }

    TextField {
        id: textField3
        x: 95
        y: 254
        width: 310
        height: 22
        placeholderText: qsTr("Text Field")
    }

    Button {
        id: button1
        x: 8
        y: 394
        width: 484
        height: 60
        text: qsTr("Добавить")
    }




    Header{
        id: header
        bgColor: Theme.CheckoutColMain
        title_header: "ЗАКАЗ: " + check_model.getRow(row).id_checkout;
        onClicked: root.clickedBack()

    }

    GroupHeader{
        id: group1
        title: "ОБЩИЕ"
        anchors.top: header.bottom

    }




    //общие
    Rectangle{

        id: block_obshie

        color: "white"
        width: parent.width
        height: 75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: group1.bottom




        RowLayout {
            y: 10
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.right: parent.right
            anchors.rightMargin:  60
            Text{
                id: text
                text: "НАЗВАНИЕ"
                color: Theme.CheckoutColMain
            }

            TextField {
                id: title_text
                x: 95
                y: 0
                anchors.right: parent.right
                anchors.left: text.right
                anchors.leftMargin: 10
                text: check_model.getRow(row).title_checkout
                placeholderText: qsTr("Text Field")
                onTextChanged: check_model.editCheckout(row, title_text.text, "", "", "")
                style: TextFieldStyle{
                    background: Rectangle {
                        radius: 2
                        border.color: Theme.CheckoutColMain
                        border.width: 1
                    }
                }
            }
        }

        ComboBox{
            id: combo
            y: 40
            width: title_text.width
            anchors.right: parent.right
            anchors.rightMargin: 60
        }

        Text{

            text: "ТИП"
            color: Theme.CheckoutColMain
            anchors.right: combo.left
            anchors.rightMargin: 10
            anchors.baseline: combo.baseline

        }
    }

    GroupHeader{
        id: header_zakazchik
        title: "ЗАКАЗЧИК"
        anchors.top: block_obshie.bottom

    }

    Loader{
        id: loader_customers
        width: parent.width
        height: 200
        anchors.top: header_zakazchik.bottom
        source: "qrc:/Checkout_Details_elements/CustomersTable.qml"

    }





}

