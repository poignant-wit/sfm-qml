import QtQuick 2.0
import 'qrc:/js/js/ThemeApp.js' as Theme

//Image {
//    id: bg
//    width: 1000
//    height: parent.height
//    source: "qrc:/checkout/bg1.png"
//}
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2


Rectangle{
    id: root
    width: 1000
    height: 1000
    signal clickedCheckouts
    signal clickedDictors
    signal clickedCustomers




    Button {
        id: checkouts_btn
        x: 428
        y: 322
        text: qsTr("ЗАКАЗЫ")
        onClicked: root.clickedCheckouts()

        style: ButtonStyle {
                background: Rectangle {

                    color: Theme.CheckoutColMain
                    implicitWidth: 250
                    implicitHeight: 50
                    border.width: 1
                    border.color: "#888"
                    radius: 4
                }
                label: Component {
                                Text {
                                    text: "ЗАКАЗЫ"
                                    clip: true
                                    font.pixelSize: 32
                                    color: "white"

                                    wrapMode: Text.WordWrap
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.fill: parent
                                }
                            }
            }
    }
    
    
   
    
    
    Button {
        id: customers_btn
        x: 428
        y: 322
       
        onClicked: root.clickedCheckouts()

        style: ButtonStyle {
                background: Rectangle {

                    color: Theme.customerColMain
                    implicitWidth: 250
                    implicitHeight: 50
                    border.width: 1
                    border.color: "#888"
                    radius: 4
                }
                label: Component {
                                Text {
                                    text: "ЗАКАЗЧИКИ"
                                    clip: true
                                    font.pixelSize: 32
                                    color: "white"

                                    wrapMode: Text.WordWrap
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.fill: parent
                                }
                            }

            }

    }

    








    
    
    
    
    



    Button {
        id: cuustomers_btn
        x: 415
        y: 354
        text: qsTr("ЗАКАЗЧИКИ")
        onClicked: root.clickedCustomers()
    }

    Button {
        id: dictors_btn
        x: 422
        y: 386
        text: qsTr("ДИКТОРЫ")
        onClicked: root.clickedDictors()










}





}



