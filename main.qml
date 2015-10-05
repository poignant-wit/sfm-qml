import QtQuick 2.4
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.1
import "qrc:/Customers"








ApplicationWindow{
    id: applicationWindow1
    width: Screen.width / 2
    height: Screen.height / 2
    visible: true


    property variant win




    toolBar:  ToolBar{
        height: 30


        ToolButton{
            text: "ADD"

            onClicked: {
                console.log("TEST BUTTON")

               // view1.add
                check_model.addCheckout()


            }
        }

        Slider {
            id: height_slider
            y: 253
            anchors.left: parent.left
            anchors.leftMargin: 9
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            minimumValue: 40
            maximumValue: 100
            value: 40
            stepSize: 1
            orientation: Qt.Vertical
        }

    }







//    //стэквью  с вариантом с хоум страницей

//    StackView{
//        anchors.fill: parent
//        id: stack
//        initialItem:
//            Home_win{
//            id: home
//            onClickedCheckouts: {
//               // stack.push(Qt.resolvedUrl("Checkouts_win.qml"))
//                stack.push(checkouts_win)

//                menuMouse.hoverEnabled = true
//            }
//            onClickedCustomers: {
//                stack.push(customers_win)

//                menuMouse.hoverEnabled = true
//            }

//        }
//    }





    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            width: 200
            Layout.maximumWidth: 400

            color: "lightblue"
            Text {
                text: "View 1"
                anchors.centerIn: parent
            }
        }

        Checkouts_win{
            Layout.fillWidth: true
        }

//        Rectangle {
//            id: centerItem
//            // Layout.minimumWidth: 50
//            Layout.fillWidth: true
//            color: "lightgray"
//            Text {
//                text: "View 2"
//                anchors.centerIn: parent
//            }
//        }

    }
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




    Loader{
        id: checkout_add_win
        width: parent.width - 60
        height: parent.height - 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

//menu line
//    Rectangle{
//        id: rectangle1
//        height: 60
//        color: "black"

//        width: parent.width
//        anchors.bottom: parent.bottom
//        opacity: 0.7

//        Image{
//            width: 64
//            height: 64
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
//            source: "qrc:/checkout/icons/homeButton.png"
//            anchors.baseline: parent.Center

//            MouseArea{
//                width: parent.width
//                height: parent.height
//                onClicked: {console.log("HOME")

//                    stack.pop(Qt.resolvedUrl("Home_win.qml"))
//                    //loadtest.source = "Checkouts_Add_win.qml"









//                }
//            }
//        }


//}

//нижнее меню мышка
    MouseArea{
        id: menuMouse
        width: parent.width
        height: 60
        y: parent.height - 30
        hoverEnabled: false
        onEntered: menuButtons.focus = true
        onExited: menuButtons.focus = false
    }

//нижнее меню
    Menu_buttons{
        id: menuButtons
        state: "HIDE"
        leftIconPath: "qrc:/checkout/arrowToRight.png"
        y: parent.height
        onClickedLeft: {
           // console.log("LEFT")
             if (stack.currentItem === checkouts_win) checkout_add_win.source = "Checkouts_Add_win.qml"
            if (stack.currentItem === checkouts_detail_win) stack.pop(checkouts_win)


        }
        onClickedCenter:{
            //stack.pop(Qt.resolvedUrl("Home_win.qml"))
            stack.pop(stack.initialItem)
            menuMouse.hoverEnabled = false
        }

        states: [
            State {
                name: "SHOW"
                when: menuButtons.activeFocus
                PropertyChanges {
                    target: menuButtons
                    y: applicationWindow1.height - 90
                }
            },
            State {
                name: "HIDE"
                when: !menuButtons.activeFocus
                PropertyChanges {
                    target: menuButtons
                    y: applicationWindow1.height
                }
            }
        ]

        transitions: Transition {
            NumberAnimation { properties: "y"; duration: 600; easing.type: Easing.OutQuint }
        }
    }




    Checkouts_win{
        id: checkouts_win
        //visible: false
        onClicked:{

            stack.push({item: checkouts_detail_win, properties: {row: row }})


        }
    }

    Checkouts_Details_win{
        id: checkouts_detail_win
        visible: false
        onClickedBack: stack.pop(checkouts_win)
    }

    Customers_win{
        id: customers_win
        visible: false
    }


}







