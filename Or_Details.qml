import QtQuick 2.0
import QtQuick.Layouts 1.1

El_Details{


    RowLayout{

        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: title
            text: qsTr("НАЗВАНИЕ")
            font.bold: true
            font.pixelSize: 20
        }


        TextInput{
            //color: "white"
            width: 100
            font.pixelSize: 20
            text: orders_model.getRow(row, "order_title")


        }

        Text {
            id: test
            text:
                orders_model.getRow(row, "order_title")
            //check_model.getRow(row).id_checkout;
            font.pixelSize: 20
        }
    }
}
