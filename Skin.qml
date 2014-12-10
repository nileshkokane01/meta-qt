import QtQuick 2.0


Item {
    id: root1
    width:parent.width
    height: parent.width

    Rectangle{
        height:root1.height
        width: root1.width
        color:"green"
    }
     BackButton { text:"Back From Skin Menu" }

}
