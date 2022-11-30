import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: viewstudentroot

//    Rectangle{
//        height: 500
//        width: 500
//        color: "red"

    GroupBox{
        title: "View User"
        anchors.fill: parent

        Column{
            id:vscolumn
            anchors.fill: parent
            spacing: 10
            ScrollView{
                id: vsscroll
                width: parent.width
                height: parent.height -(vuback.height)
            }

        Button{
            id: vuback
            text: qsTr("Back")
            width: parent.width

            onClicked: {
                lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
            }
        }
    }
    }

}