import QtQuick 2.0


Item{

    Rectangle {
        x: 300
        y: 300
        width: 200
        height: 200
    }

    Rectangle {
        width: 100; height: 100
        color: "blue"
        transform: Rotation { origin.x: 25; origin.y: 25; angle: 45}
    }


}
