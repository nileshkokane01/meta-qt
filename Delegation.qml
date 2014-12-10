import QtQuick 2.0

Item {
    id: root
    width:parent.width/2
    height: 30

    property alias text: textitem.text
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#11ffffff"
        visible: mouse.pressed
    }

    Text {
        id: textitem
        color: "white"
        font.pixelSize: 20
        //      y:80
        text: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
    }

    Rectangle {
        y:30
        x:30
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 0
        height:1
        color: "#424246"
    }


    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()
    }

}
