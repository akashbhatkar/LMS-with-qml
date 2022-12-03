import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    id: viewbooksroot

    GroupBox{
        title: "View User"
        anchors.fill: parent

        Column{
            id:vbcolumn
            anchors.fill: parent
            spacing: 10

//            ScrollView{
//                id: vbscroll
//                width: parent.width
//                height: parent.height- (vbback.height)
//}





            Button{
                id: vbback
                text: qsTr("Back")
                width: parent.width

                onClicked: {
                    lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
                }
            }
        }

        TextArea {
            id: textArea
            x: 8
            y: 62
            width: 608
            height: 333
            text: printallbooks()
        }
    }
}

