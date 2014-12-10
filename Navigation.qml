import QtQuick 2.0
import QtQuick.Controls 1.1

Item{
    id:nav
    width: 1280
    height: 480
    y:2


    property  alias currentView:stackView.currentItem

    Rectangle{
        width:parent.width
        height: parent.height

        color:"black"
    }

    StackView {
        id: stackView
        anchors.fill: parent
        // Implements back key navigation

        focus: true

        initialItem: Item {
            width: 200
            height: 200
            ListView {
                model: pageModel
                anchors.fill: parent
                spacing : 10
                orientation: ListView.Vertical
                delegate: Delegation {
                    text: title
                    onClicked: {
                        rectangle1.backCluster = 0
                        stackView.push(Qt.resolvedUrl(page))
                    }
                }
            }
        }
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Parameters"
            page: "Parameters.qml"
        }
        ListElement {
            title: "Skin"
            page: "Skin.qml"
        }
        ListElement {
            title: "Dial Positions"
            page: "Position.qml"
        }
        ListElement {
            title: "Pointer Select"
            page: "Pointers.qml"
        }
    }
}
