import QtQuick 2.0


Item{
    id:pointerOption

    property alias source: choice1.source

    Rectangle{
        id:pointer1
        height:150
        width:150
        anchors.leftMargin : 10
        anchors.topMargin: 10
        opacity:1
        antialiasing: true
        color: choice1area.pressed ? "#222":"transperant"
        border.color: "#f1dede"
        Behavior on opacity { NumberAnimation{} }

        Image{
            id:choice1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source:""
        }
        /**/
        MouseArea{
            id:choice1area
            anchors.fill:parent
            onClicked: {
                rectangle1.configurablePointer=choice1.source
                color:"#222"
            }
        }
    }
}
