import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    id: viewstudentroot

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
