import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1


Item {
    id: root1
    width:parent.width
    height:440

    property string imageSource;


    Rectangle{
        height:root1.height
        width: root1.width
        color:"blue"
    }

    /**/

    PointerOption{id:pointer1;source:"image/fuelneedle.png"}

    PointerOption{
        id:pointer2;
        source:"image/needle.png"
        anchors.leftMargin: 50
        anchors.right:pointer1.BottomRight
        x:150
    }

    BackButton { text:"Back From Pointers Menu" }

}
