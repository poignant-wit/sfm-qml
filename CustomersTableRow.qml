import QtQuick 2.0
import QtQuick.Controls 1.3
import 'qrc:/js/js/ThemeApp.js' as Theme
import QtGraphicalEffects 1.0


Rectangle {
    id: root

    property string id_customer_pr
    property string name_customer_pr
    property string adress_customer_pr
    property string email_customer_pr
    property string icq_customer_pr
    property string company_customer_pr
    property string telephone_customer_pr

    property int row_height
    property int ratio: root.width / 8


    signal clickedRow(int index)

    width: parent.width
    height: row_height
    radius: 10

    border.width: 2
    border.color: "transparent"


    states: [
        State {
            name: "SELECTED"
            PropertyChanges {
                target: root
                border.color: "#bdbdbd"

            }
        },
        State {
            name: "NORMAL"
            PropertyChanges {
                target: root
                border.color: "transparent"

            }
        }
    ]

    transitions: [
        Transition {
            from: "NORMAL"
            to: "SELECTED"

            ColorAnimation {
                target: root
                duration: 200
            }
        },
        Transition {
            from: "SELECTED"
            to: "NORMAL"

            ColorAnimation {
                target: root
                duration: 200
            }
        }

    ]


    //иконка заказа

//    Image {
//        id: icon
//        source: "qrc:/checkout/checkout.png"
//        scale: 0.4
//        anchors.verticalCenter: parent.verticalCenter
//    }

    //Айди заказа
    Text {

        id: nametext
        x: 20
        width: 42
        height: 15
        text: name_customer_pr
        anchors.verticalCenter: parent.verticalCenter
        //anchors.leftMargin: 50
        font.pixelSize: 12

    }




//дата заказа
    Text {
        id: adresstext

        x: 140

        anchors.verticalCenter: parent.verticalCenter
        width: 75
        height: 15
        text: adress_customer_pr
     //   visible: false

        font.pixelSize: 12
        color: "grey"



    }

    Image {
        id: emailicon
        x: 100

        source: "qrc:/icons/Mail-icon.png"
        scale: 0.08
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        anchors.left: emailicon.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: -110
        text: email_customer_pr
    }

    Image {
        id: icqicon
        x: 200

        source: "qrc:/icons/ICQ-icon.png"
        scale: 0.03
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        anchors.left: icqicon.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: -240
        text: icq_customer_pr
    }






//    LinearGradient  {
//        anchors.fill: datetext
//        source: datetext
//        start: Qt.point(0, 0)
//                end: Qt.point(50, 0)
//        gradient: Gradient {
//            GradientStop { position: 0.5; color: "black" }
//            GradientStop { position: 1; color: "transparent" }
//        }
//    }


//    Text {
//        id: titletext
//        x: 150
//        anchors.verticalCenter: parent.verticalCenter
//        width: 75
//        height: 15
//        text: title_text
//        color: {

//        if (title_text == "2") {
//            color : "red"
//        }else{
//            color : "blue"
//        }


//        }

//        font.bold: true
//        font.pixelSize: 12
//    }


//    Text {
//        id: customernametext
//        x: 250
//        anchors.verticalCenter: parent.verticalCenter
//        width: 75
//        height: 15
//        text: customer_name_text + " / " + customer_company_text
//        font.bold: true
//        font.pixelSize: 12
//    }

//    Text {
//        id: customercompanytext
//        x: 450
//        anchors.verticalCenter: parent.verticalCenter
//        width: 75
//        height: 15
//        text: check_model.getRow(0).customer_company_checkout
//        font.bold: true
//        font.pixelSize: 12
//    }





//стрелка
    Image {
        id: arrow
        anchors.verticalCenter: parent.verticalCenter
        anchors.right:parent.right
        anchors.rightMargin: -30
        scale: 0.2
        source: "qrc:/checkout/arrowToRight.png"

        states: [

            State {
                name: "NORMAL"
                PropertyChanges {
                    target: arrow
                    scale: 0.2
                }
            },

            State {
                name: "ENTERED"
                PropertyChanges {
                    target: arrow
                    scale: 0.3
                }
            }

        ]

        transitions: [
            Transition {
                from: "NORMAL"
                to: "ENTERED"
                PropertyAnimation{
                    target: arrow
                    property: "scale"
                    duration: 100
                }
            },
            Transition {
                from: "ENTERED"
                to: "NORMAL"
                PropertyAnimation{
                    target: arrow
                    property: "scale"
                    duration: 100
                }
            }

        ]


        MouseArea{
            height: parent.height
            width: parent.width
            hoverEnabled: true
            onEntered:{
                arrow.state = "ENTERED"
                root.state = "SELECTED"
            }
            onExited:{
                arrow.state = "NORMAL"
                root.state = "NORMAL"
            }
            onClicked: {
                root.clickedRow(index)
                console.log(name_customer)
            }
        }
    }
}

