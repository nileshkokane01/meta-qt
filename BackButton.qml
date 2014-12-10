import QtQuick 2.0


Item{

    id:backButton
    width:parent.width
    height: parent.height

    property alias text : text1.text

    Rectangle {
        id: backtomenu
        width:  60
        y:400
        anchors.left: parent.bottom
        anchors.leftMargin: 20
        opacity: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin:50
        antialiasing: true
        height: 60
        radius: 4
        color: backmouse.pressed ? "#222" : "transparent"
        Behavior on opacity { NumberAnimation{} }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "image/navigation_previous_item.png"
        }
        MouseArea {
            id: backmouse
            anchors.fill: parent
            anchors.margins: -10
            onClicked: {
                stackView.pop()
                rectangle1.backCluster = 1
            }
        }
    }



    Text{
        id:text1
        y:340
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 20

    }
}
