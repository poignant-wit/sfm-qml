import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "qrc:/Customers"




Item{
    id: root
    width: parent.width
    height: parent.height

    signal clickCustomers
    signal clickCheckouts
    signal clickDictors






    StackView{
        id:stack
        width: parent.width


        //

        anchors.top: toolbar.bottom
        initialItem:
            Checkouts_win{
            id: checkouts
            // anchors.left: parent.left
            onClickedDetails: btn1.title_btn = "НАЗАД"
        }

        property variant items: [comp1.createObject()]


//        Customers_win{
//            id: customers
//        }




    }



//    ComponentTest{
//        id: test
//        Component.onCompleted: console.log("START COMPONENTTEST")
//        list: Rectangle{

//            height: 10
//            width: 50
//            color: "blue"

//        }

//    }



    Component{
        id: comp1
//                Rectangle {
//                    height: 500
//                    width: 500
//                    color: "black"

//                    Text {
//                        id: mtext
//                        anchors.centerIn: parent
//                        text: "First Page"
//                    }
//                }

            ComponentTest{
                id: test
                Component.onCompleted: console.log("START COMPONENTTEST")
                list: Rectangle{

                    height: 10
                    width: 50
                    color: "blue"

                }

            }

    }





    onClickCustomers: {
        //stack.push(customers)
       // stack.push(test)
        stack.push({item: stack.items[0]})

    }

    //toolbar
    Rectangle{
        id: toolbar
        color: "lightblue"
        height: 40
        width: root.width


        Button_tb{
            id: btn1
            title_btn: "НОВЫЙ ЗАКАЗ"
            x: 50
            anchors.verticalCenter: toolbar.verticalCenter
            //y: toolbar.verticalCenter

            onClicked:{

                if (stack.currentItem == checkouts) {
                    if (checkouts.details){
                        console.log("CHECKOUTS DETAILS TRUE")
                        checkouts.clickedBack()
                        btn1.title_btn = "НОВЫЙ ЗАКАЗ"

                    }




                    //checkouts.clickedBack()

                }


            }


        }

        TextField{
            width: 200
            height: 20
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20

        }

}


    }





