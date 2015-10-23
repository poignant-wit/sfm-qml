import QtQuick 2.0
import QtQuick.Layouts 1.1

El_ListRow{
    property string order_row_id
    property string order_row_date
    property string order_row_title
    property real payment_row_value

    property string order_row_customer


    rowHeight: 25





    //    Text {
    //        id: order_id_text

    //        //text: order_row_id

    //        text: pad(order_row_id, 5)

    //        anchors.verticalCenter: parent.verticalCenter
    //        x:10
    //        color: "grey"

    //        function pad(num, size) {
    //            var s = "000000000" + num;
    //            return s.substr(s.length-size);
    //        }


    //    }


    EL_Label{

        id: order_id_text
        anchors.verticalCenter: parent.verticalCenter

        anchors.left: parent.left
        anchors.leftMargin: 10
        //anchors.right: parent.right
        anchors.rightMargin: 25
        text: pad(order_row_id, 5)
        height: 16

        colorBg: order_row_id == 24 ? "grey": "lightgrey"
        colorText: "white"

        function pad(num, size) {
            var s = "000000000" + num;
            return s.substr(s.length-size);
        }


    }






    Text {

        id: date
        visible: parent.width > 300 ? true : false
        text: Qt.formatDate(order_row_date, "dd MMM")
        //font.pixelSize: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: order_id_text.right
        anchors.leftMargin: 10
        //x:30
        color: !(order_row_id == 24) ? "lightgrey": "grey"
    }





    Text {

        id: customerId

        //anchors.left: paymentLabelId.right
        //anchors.leftMargin: 5
        x: order_row_id == 24 ? 300+ paymentLabelId.width + 10: 305
        anchors.verticalCenter: parent.verticalCenter

        text: order_row_title

        color: !(order_row_id == 24) ? "grey": "black"
    }




    RowLayout{

        EL_Label{
            id: paymentLabelId
            anchors.verticalCenter: parent.verticalCenter

            //anchors.left: date.right
            // anchors.leftMargin: 25
            //anchors.right: parent.right
            // anchors.rightMargin: 25

            enabled: false
            text: "НЕ ОПЛАЧЕНО"
            height: 16
            x: 305
            colorBg: "red"
            colorText: "white"

            Component.onCompleted: print(payment_row_value)
            visible: //payment_row_value == 0 ? true : false
                     order_row_id == 24 ? true: false

        }

        Text{
            text: order_row_title
        }


    }





}
