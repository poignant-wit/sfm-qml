import QtQuick 2.3
import QtQuick.Controls 1.3




ScrollView{

    ListView{
        id: checkouts_list
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        //anchors.bottomMargin: -4
        anchors.topMargin: 10
        //anchors.fill: parent
        anchors.left: parent.left
        spacing: 1

        model: check_model
        delegate:
            Ch_ListRow{
            customer: title_checkout

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
