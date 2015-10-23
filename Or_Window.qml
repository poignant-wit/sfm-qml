import QtQuick 2.0






El_StackView_Hor{
    property variant items:[list.createObject(), detailsView.createObject()]
    property bool details: false



    initialItem: items[0]


    Component{
        id: list
        Or_List{
            onClickRowDetails:{
                details = true
                clickDetails(row)
                console.log(row)
                push({item:items[1], properties: {row: row}})
            }

        }
    }

    Component{
        id: detailsView

        Or_Details{

        }
    }

    onClickBack:{
        pop()
        details = false

    }




}
