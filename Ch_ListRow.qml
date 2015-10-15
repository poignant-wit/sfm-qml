import QtQuick 2.0

El_ListRow{
    property string id
    property string date
    property string customer

    rowHeight: 20

    Text {
        id: test
        text: customer
    }
}
