import QtQuick 2.0






El_StackView_Ver{
    property variant items:[list.createObject()]


    initialItem: items[0]


    Component{
        id: list
        Ch_List{

        }
    }


}
