import QtQuick 2.4
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1






Item{
    id: checkout
    signal clicked(int row)


        ListView{
            id: checkouts_list
            anchors.rightMargin: 12
            anchors.leftMargin: 12
            anchors.bottomMargin: -4
            anchors.topMargin: 20
            anchors.fill: parent
            spacing: 5
            //interactive: false

            model: check_model
            delegate:


                CheckTableRow{
                id_text: id_checkout
                date_text: date_checkout
                title_text: title_checkout
                customer_name_text: customer_name_checkout
                customer_company_text: customer_company_checkout
                row_height: height_slider.value
                onClicked: {
                    //console.log("ИНДЕКС" + index)
                    checkout.clicked(index)
                }
            }
        }

    }






