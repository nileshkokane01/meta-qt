import QtQuick 2.0

Item {
    id: root1
    width:parent.width
    height: parent.width

    Rectangle{
        height:root1.height
        width: root1.width
        color:"red"
    }

    BackButton { text:"Back From Parameters Menu" }
}

