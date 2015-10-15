import QtQuick 2.0

Item{
    id: customers
    signal clicked(int row)
    signal test


        ListView{

            anchors.rightMargin: 12
            anchors.leftMargin: 12
            anchors.bottomMargin: -4
            anchors.topMargin: 20
            anchors.fill: parent

            //anchors.left: parent.left
            spacing: 1
            //interactive: false

            model: customers_model
            delegate:



                CustomersTableRow{
                name_customer_pr: name_customer
                adress_customer_pr: adress_customer
                email_customer_pr: email_customer
                icq_customer_pr: icq_customer
                company_customer_pr: company_customer
                telephone_customer_pr: telephone_customer

                row_height: 20
                onClickedRow: {
                    //console.log("ИНДЕКС" + index)
                    checkout.clicked(index)
                }
            }
        }

        onTest: console.log("WORRRKKKSSS")

    }



