import QtQuick 2.4
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.1
import "qrc:/Customers"








ApplicationWindow{
    id: applicationWindow
    width: Screen.width / 2
    height: Screen.height / 2
    visible: true


    property variant win






    //-------------------------------------------------

    //    SplitView {
    //        anchors.fill: parent
    //        orientation: Qt.Horizontal



    //        Rectangle {
    //            id: rect
    //            width: 200
    //            Layout.maximumWidth: 400

    //            color: "grey"
    //            Text {
    //                text: "View 1"
    //                anchors.centerIn: parent
    //            }
    //        }

    //        Main_win{
    //            id: mainWin
    //            Layout.fillWidth: true
    //        }


    //    }


    //    Rectangle{
    //        width: rect.width
    //        height: rect.height

    //        color: "black"

    //        Text{

    //            id: btn_customers
    //            text: "ЗАКАЗЧИКИ"
    //            color: "white"
    //            anchors.right: parent.right

    //            MouseArea{
    //                anchors.fill: btn_customers
    //                onClicked: mainWin.clickCustomers()
    //            }
    //        }

    //    }


    //------------------------------------------------------------------




    El_Toolbar{
        id: toolbar
        //  Layout.fillWidth: true
        // Layout.preferredHeight: 40
        // height: 40
        // width: applicationWindow.width

        anchors.left: leftToolbar.right
        anchors.right: parent.right
        //width: applicationWindow.width - leftToolbarGuide.width
        height: 40

        buttonTitle: "НОВЫЙ ЗАКАЗ"
        title: "ЗАКАЗЫ"
        onClickButton: {



            //            if(stack.items[0].details){
            //              stack.items[0].clickBack()
            //                buttonTitle = "НОВЫЙ ЗАКАЗ"
            //                title = "ЗАКАЗЫ"

            //            }


            //            if (orders.details){
            //                orders.clickBack()
            //                stack.items[0].clickBack()
            //                buttonTitle = "НОВЫЙ ЗАКАЗ"
            //                title = "ЗАКАЗЫ"
            //            }

        }

        onClickIcon: leftToolbar.toggle()



    }



    Loader{
        id: currentPage
       // height: 50
      // width: 50
                anchors.left: leftToolbar.right
                anchors.right: parent.right
                anchors.top: toolbar.bottom
                anchors.bottom: parent.bottom

               // onSourceComponentChanged: animation.running = true
       // sourceComponent: orders_component

                NumberAnimation {
                            id: animation
                            target: currentPage.item
                            property: "y"

                            to: applicationWindow.height * 2
                            duration: 600
                            easing.type: Easing.InExpo

                            onStopped:{


                                animation2.running = true
                                //currentPage.removeAnchors()


                            }


                        }
                NumberAnimation {
                            id: animation2
                            target: currentPage.item
                            property: "y"

                            from: -applicationWindow.height * 2

                            to: applicationWindow.height / 2
                            duration: 600
                            easing.type: Easing.InExpo



                            onStopped:{
                                currentPage.sourceComponent = orders_component


                            }


                        }



    }

    //    StackView{
    //        id:stack
    //        anchors.left: leftToolbar.right
    //        anchors.right: parent.right
    //        anchors.top: toolbar.bottom
    //        anchors.bottom: parent.bottom


    //        property variant items:[orders_component.createObject(), customers_component.createObject()]
    //        initialItem: items[0]


    Component{
        id: orders_component
        // signal clickBack
        //  onClickBack: orders.clickBack()


        Or_Window{

            id: orders


            onClickDetails: {
                toolbar.buttonTitle = "НАЗАД";
                toolbar.title = "ЗАКАЗ: " + orders_model.getRow(row, "order_id");
            }
        }
    }

    Component{
        id:customers_component

        Cs_Window{

        }
    }


    //  }









    El_Toolbar_Left{

        function toggle(){
            if (leftToolbar.state === "HIDE"){ leftToolbar.state = "SHOW" }else{ leftToolbar.state = "HIDE" }
        }

        id:leftToolbar
        width: 100
        height: applicationWindow.height

        states:[
            State {
                name: "SHOW"
                PropertyChanges {
                    target: leftToolbar
                    x: 0
                }
            },

            State {
                name: "HIDE"

                PropertyChanges {
                    target: leftToolbar
                    x: -100
                }
            }
        ]
        transitions: Transition {
            NumberAnimation { properties: "x"; duration: 1000; easing.type: Easing.OutQuint }
        }

        onClickCustomers:{

           // customers_component.createObject()
            currentPage.sourceComponent = customers_component
        }

        onClickOrders: currentPage.sourceComponent = orders_component
        // stack.push({item: stack.items[1], destroyOnPop:true})}

    }








}



//    El_Menu{

//    }



//    Or_Window{≈≈≈

//    }







//    Main_win{
//        //Layout.fillWidth: true
//        width: parent.width - 200
//        height: parent.height
//        x: 200
//    }

//    Rectangle {
//        id: rect
//        width: 200
//        height: parent.height
//        Layout.maximumWidth: 400

//        color: "grey"

//        Button_LeftPanel{
//            id: btn1
//            x:20
//            y:20
//            title: "ЗАКАЗЫ"
//            status: false
//            onToggle: btn2.toggle()

//        }

//        Button_LeftPanel{
//            id: btn2
//            x:20
//            y:50
//            title: "ЗАКАЗЧИКИ"
//            status: true
//            onToggle: btn1.toggle()
//        }

//    }


//    Rectangle{
//        color: "black"
//        width: rect.height
//        height: 300
//    }

//        Component {
//               id: myrec

//               MouseArea {
//                   Text {
//                       text: stack.depth
//                       anchors.centerIn: parent
//                   }
//                   onClicked: stack.push(Qt.resolvedUrl("Test.qml"))
//               }
//           }


//    Rectangle{
//        id: myrect
//        width: parent.width
//        height: parent.height
//        color: "red"
//    }


//    ListView{

//        id: view1
//        anchors.rightMargin: 12
//        anchors.leftMargin: 12
//        anchors.bottomMargin: -4
//        anchors.topMargin: 20
//        anchors.fill: parent
//        spacing: 5
//        model: check_model
//        add: Transition {
//                NumberAnimation { properties: "x,y"; from: 100; duration: 3000 }
//            }


//        delegate:
//            CheckTableRow{
//            id_text: id_checkout
//            date_text: date_checkout
//            title_text: title_checkout
//            row_height: height_slider.value
//        }




//    }

//    // The delegate for each section header
//    Component {
//        id: sectionHeading
//        Rectangle {
//            width: 100
//            height: 30
//            color: "red"

//            Text {
//                text: section
//                font.bold: true
//                font.pixelSize: 10
//            }
//        }
//    }





//нижнее меню мышка
//    MouseArea{
//        id: menuMouse
//        width: parent.width
//        height: 60
//        y: parent.height - 30
//        hoverEnabled: false
//        onEntered: menuButtons.focus = true
//        onExited: menuButtons.focus = false
//    }

////нижнее меню
//    Menu_buttons{
//        id: menuButtons
//        state: "HIDE"
//        leftIconPath: "qrc:/checkout/arrowToRight.png"
//        y: parent.height
//        onClickedLeft: {
//           // console.log("LEFT")
//             if (stack.currentItem === checkouts_win) checkout_add_win.source = "Checkouts_Add_win.qml"
//            if (stack.currentItem === checkouts_detail_win) stack.pop(checkouts_win)


//        }
//        onClickedCenter:{
//            //stack.pop(Qt.resolvedUrl("Home_win.qml"))
//            stack.pop(stack.initialItem)
//            menuMouse.hoverEnabled = false
//        }

//        states: [
//            State {
//                name: "SHOW"
//                when: menuButtons.activeFocus
//                PropertyChanges {
//                    target: menuButtons
//                    y: applicationWindow1.height - 90
//                }
//            },
//            State {
//                name: "HIDE"
//                when: !menuButtons.activeFocus
//                PropertyChanges {
//                    target: menuButtons
//                    y: applicationWindow1.height
//                }
//            }
//        ]

//        transitions: Transition {
//            NumberAnimation { properties: "y"; duration: 600; easing.type: Easing.OutQuint }
//        }
//    }












