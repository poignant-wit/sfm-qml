import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0

Item{
    property string test_value: "value"
    width: 160

    height: 160

    MouseArea{
        anchors.left: parent.left
        anchors.leftMargin: 17
        onClicked: console.log(test_value)
    }
}
