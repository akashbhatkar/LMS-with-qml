import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4
Item {
    id: menuroot
    Image {
        id: libraryimage
        source: "qrc:/Image/librarymenu.jpg"
        anchors.fill:parent
    }
    Popup{
        id:logoutpop
        width: groupmenu.width
        height: groupmenu.height
        anchors.centerIn: parent

        Column{
            id: menucolumn
            anchors.centerIn: parent
            spacing: 30
//            anchors.fill: groupmenu

        Label{
            text: qsTr("Are you sure, you want to logout?")
            font.pointSize: 10

        }
        Row{
            spacing: 15
            Button{
                text: qsTr("Yes")
                onClicked:{
                    logoutpop.close()
                    lmsstack.replace(Qt.resolvedUrl("qrc:/loginscreen.qml"))
                }

            }
            Button{
                text: qsTr("No")
                onClicked: logoutpop.close()
            }
        }
        }
    }

    GroupBox{
        id: groupmenu
        anchors.centerIn:  parent
    Grid{

        id:menugrid
        x: 0
        y: 0
        width: 682
        height: 293
        rows: 3
        columns: 3
        spacing: 30

        Button{
           height: 50
           width: 200
           text: qsTr("View Books")
           onClicked: {
               lmsstack.replace(Qt.resolvedUrl("qrc:/viewbook.qml"))


           }

        }
        Button{
           height: 50
           width: 200
           text: qsTr("View user")
           onClicked:
               lmsstack.replace(Qt.resolvedUrl("qrc:/viewstudent.qml"))



        }
        Button{
           height: 50
           width: 200
           text: qsTr("Issue Books")
           onClicked: {
               lmsstack.replace(Qt.resolvedUrl("qrc:/issuebook.qml"))
           }

        }
        Button{
           height: 50
           width: 200
           text: qsTr("Add User")

           onClicked: {
                lmsstack.replace(Qt.resolvedUrl("qrc:/adduser.qml"))
           }

        }
        Button{
           height: 50
           width: 200
           text: qsTr("Add Books")
           onClicked: {

               lmsstack.replace(Qt.resolvedUrl("qrc:/addbook.qml"))
           }

        }
        Button{
           height: 50
           width: 200
           text: qsTr("Return Books")
           onClicked: {
               lmsstack.replace(Qt.resolvedUrl("qrc:/returnbook.qml"))
           }

        }
        Button{
           height: 50
           width: 200
           text: qsTr("Logout")
           onClicked: {
               logoutpop.open()
           }


        }

    }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.33;height:480;width:640}
}
##^##*/
