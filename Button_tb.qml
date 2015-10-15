import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


//Button {


//    id: btn
//    property string title_btn

//    style: ButtonStyle {
//        background:
//            Rectangle {
//            color: "transparent"
//        }

//        label: Component {

//            Text {
//                text: btn.title_btn
//                clip: true
//                font.pixelSize: 16
//                color: "white"

//                wrapMode: Text.WordWrap
//                verticalAlignment: Text.AlignVCenter
//                horizontalAlignment: Text.AlignHCenter
//                anchors.fill: parent
//            }
//        }
//    }
//}

Text{
    property string title_btn
    signal clicked

    text: title_btn
    color: "white"
    font.pixelSize: 16

    MouseArea{
        height: parent.height
        width: parent.width
        onClicked: parent.clicked()
    }

}



