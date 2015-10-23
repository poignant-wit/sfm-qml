import QtQuick 2.4

Canvas{
    id: canvas
    width: 256
    height: 256

    signal clickButton
    property bool arrowFormState: false
    function toggle() {
        console.log("TOGGLE FUNCTION")
        arrowFormState = !arrowFormState
    }

    property real angle: 0
    property real morphing: 0

    states: State {
        when: arrowFormState
        PropertyChanges { angle: Math.PI*0.5; target: canvas }
    }

    State {
        PropertyChanges { morphing: 1; target: canvas }
    }

    transitions: Transition {
        NumberAnimation {
            property: "angle"
            easing.type: Easing.InOutCubic
            duration: 500
        }
    }

    onAngleChanged: requestPaint()
    onMorphingChanged:{
        console.log("test changes")
    }

    //renderTarget: Canvas.FramebufferObject
    // renderStrategy: Canvas.Cooperative


    onPaint: {
        var ctx = getContext('2d')
        ctx.fillStyle = 'black'

        ctx.fillRect(0, 0, width, height)
        ctx.resetTransform()

        var left = width * 0.25
        var right = width * 0.75
        var vCenter = height * 0.5
        var vDelta = height / 6

        ctx.translate(width / 2, height / 2)
        ctx.rotate(angle)
        ctx.translate(-width / 2, -height / 2)

        ctx.lineCap = "square"
        ctx.lineWidth = vDelta * 0.4
        ctx.strokeStyle = 'white'

        ctx.beginPath()
        ctx.moveTo(left, vCenter - vDelta)
        ctx.lineTo(right, vCenter - vDelta)
        ctx.moveTo(left, vCenter)
        ctx.lineTo(right, vCenter)
        ctx.moveTo(left, vCenter + vDelta)
        ctx.lineTo(right, vCenter + vDelta)
        ctx.stroke()


    }

    MouseArea{
        width: parent.width
        height: parent.height
        onClicked: {
            clickButton()
            toggle()
        }
    }

}



//Image {
//    property int currentImage:0
//    source: "qrc:/TEST ANIMATION/Comp 1/Comp 1_0000" + currentImage +".png"
//    Behavior on currentImage {
//        PropertyAnimation { duration: 300 }
//    }
//    MouseArea {
//        anchors.fill: parent
//        onClicked: parent.currentImage = 9
//    }
//}
