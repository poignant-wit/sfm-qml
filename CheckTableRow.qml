import QtQuick 2.0
import QtQuick.Controls 1.3
import 'qrc:/js/js/ThemeApp.js' as Theme
import QtGraphicalEffects 1.0


Rectangle {
    id: root

    property string id_text
    property string date_text
    property string title_text
    property string type_text
    property string customer_name_text
    property string customer_company_text
    property string paytype_text
    property string payvalue_text
    property string paystatus_text
    property string status_text
    property int row_height
    property int ratio: root.width / 8
    signal clicked(int index)
    width: parent.width
    height: row_height
    radius: 10


//    gradient: Gradient {
//        GradientStop {
//            position: 0
//            color: "#ffffff"
//        }

//        GradientStop {
//            position: 1
//            color: "#ebebeb"
//        }
//    }

    color: {
        color
    if (title_text == "2") {
        color : Theme.mainColor
    }
    }
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
    Image {
        id: icon
        source: "qrc:/checkout/checkout.png"
        scale: 0.4
        anchors.verticalCenter: parent.verticalCenter
    }

    //Айди заказа
    Text {
        id: idtext
        x: icon.x + 55
        width: 42
        height: 15
        text: id_text
        anchors.verticalCenter: parent.verticalCenter
        //anchors.leftMargin: 50
        font.pixelSize: 12
        color: "grey"
    }


//дата заказа
    Text {
        id: datetext

        x: idtext.x + 40

        anchors.verticalCenter: parent.verticalCenter
        width: 75
        height: 15
        text: date_text
        visible: false

        font.pixelSize: 12



    }


    LinearGradient  {
        anchors.fill: datetext
        source: datetext
        start: Qt.point(0, 0)
                end: Qt.point(50, 0)
        gradient: Gradient {
            GradientStop { position: 0.5; color: "black" }
            GradientStop { position: 1; color: "transparent" }
        }
    }


    Text {
        id: titletext
        x: 150
        anchors.verticalCenter: parent.verticalCenter
        width: 75
        height: 15
        text: title_text
        color: {

        if (title_text == "2") {
            color : "red"
        }else{
            color : "blue"
        }


        }

        font.bold: true
        font.pixelSize: 12
    }


    Text {
        id: customernametext
        x: 250
        anchors.verticalCenter: parent.verticalCenter
        width: 75
        height: 15
        text: customer_name_text + " / " + customer_company_text
        font.bold: true
        font.pixelSize: 12
    }

    Text {
        id: customercompanytext
        x: 450
        anchors.verticalCenter: parent.verticalCenter
        width: 75
        height: 15
        text: check_model.getRow(0).customer_company_checkout
        font.bold: true
        font.pixelSize: 12
    }




    CheckBox {
        id: checkBox1
        x: 701
        y: 0
        anchors.verticalCenter: parent.verticalCenter

        checked: true
    }

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

                //console.log(index)
                root.clicked(index)
            }
        }
    }
}

