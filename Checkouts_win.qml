import QtQuick 2.4
import QtQuick.Window 2.1
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.1
import 'qrc:/js/js/ThemeApp.js' as Theme





Item{
    id: checkout
    signal clickedDetails
    signal clickedBack
    property bool details: false




    StackView{
        id: stack
        initialItem:
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

                    CheckTableRow{
                    id_text: id_checkout
                    date_text: date_checkout
                    title_text: title_checkout
                    customer_name_text: customer_name_checkout
                    customer_company_text: customer_company_checkout

                    row_height: 30
                    onClicked: {
                        details = true;
                        checkout.clickedDetails()
                        //-----console.log("ИНДЕКС" + index)
                        // ----checkout.clicked(index)

                        // ----checkout_details.source = "Checkouts_Details_win.qml";

                        stack.push({item:Qt.resolvedUrl("Checkouts_Details_win.qml"), properties: {row: index}})



                        //-----stack.push({item:checkout_details, properties: {row: index}})

                    }
                }
            }

        }
    }

    onClickedBack: {
        details = false
        stack.pop()
    }



    //    ListView{
    //        id: checkouts_list
    //        anchors.fill: parent
    //        spacing: 1

    //        model: check_model
    //        delegate:

    //            CheckTableRow{
    //            id_text: id_checkout
    //            date_text: date_checkout
    //            title_text: title_checkout
    //            customer_name_text: customer_name_checkout
    //            customer_company_text: customer_company_checkout
    //            //----row_height: height_slider.value
    //            row_height: 30
    //            onClicked: {
    //                console.log("ИНДЕКС" + index)
    //                checkout.clicked(index)

    //               // ----checkout_details.source = "Checkouts_Details_win.qml";

    //                //stack.push({item:Qt.resolvedUrl("Checkouts_Details_win.qml"), properties: {row: index, height: 200}})



    //                //-----stack.push({item:checkout_details, properties: {row: index}})

    //            }
    //        }
    //    }








    //    Rectangle{
    //        //color: Theme.customerColMain
    //        width: parent.width
    //        height: 40
    //    }


    //    Button{
    //        text: "stysftysfy"
    //        onClicked: stack.pop()
    //    }



}








