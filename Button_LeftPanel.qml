import QtQuick 2.0




Text{

    property string title
    property bool status
    signal toggle
    id: text
    text: title
    color: if (status){
               color = "white"
           }else{
               color = "black"
           }


    MouseArea{
        id: mouse
        height: parent.height
        width: parent.width
        onClicked:{
            text.toggle()
            status ? color="black" : color="white"

            status ? status=false : status=true

//            if (status){
//                status=false
//            }else{
//                status=true
//            }

            //status++
            console.log(status)
        }
    }

    onToggle: {
        console.log("toggle")
        status ? color="black" : color="white"

        status ? status=false : status=true
    }

}

