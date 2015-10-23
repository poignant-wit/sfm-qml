import QtQuick 2.3
import QtQuick.Controls 1.3




ScrollView{
    signal clickRowDetails(int row)

    ListView{
        id: checkouts_list
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        //anchors.bottomMargin: -4
        anchors.topMargin: 10
        //anchors.fill: parent
        anchors.left: parent.left
        spacing: 1

        model: orders_model
        delegate:
            Or_ListRow{
            order_row_id: order_id
            order_row_date: order_date
            order_row_title: order_title
            payment_row_value: payment_value
            onClickDetails: {
                console.log(index)
                clickRowDetails(index)
            }

        }


//            CheckTableRow{
//            id_text: id_checkout
//            date_text: date_checkout
//            title_text: title_checkout
//            customer_name_text: customer_name_checkout
//            customer_company_text: customer_company_checkout

//            row_height: 30
//            onClicked: {
//                stack.push({item:Qt.resolvedUrl("Checkouts_Details_win.qml"), properties: {row: index}})
//            }
//        }







    }

}
