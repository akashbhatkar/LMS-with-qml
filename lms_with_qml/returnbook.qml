
import QtQuick 2.0
import QtQuick.Controls 1.4

Item {

    GroupBox{
        title: "Return Book"
     id: rbgroup
     anchors.centerIn: parent

     Column{
         spacing: 30

         Row{
             spacing: 15
             Label{
                 text: qsTr("Student ID")
             }
             TextField{
                 height: 30
                 width: 200
             }
         }
         Calendar{

         }

         Button{
             height: 30
             width: parent.width
             text: qsTr("Search")
         }
         Row{
             spacing: 15

             Label{
                 id: rbselectbook
                 text: qsTr("Student")
             }
             ComboBox{
                 width: 200
                 model: ['Select student']
             }
         }
         Row{
             spacing: 15
             Label{
                 text: qsTr("Fine in Rs.")
             }
             TextField{
                 height: 30
                 width: 200
             }
         }
         CheckBox{
             text: qsTr("Fine is collected")
         }
         Row{
             spacing: 10
             Button{
                 height: 30
                 width: 150
                 text: qsTr("Retun Book")
             }
             Button{
                 height: 30
                 width: 150
                 text: qsTr("Back")

                 onClicked: {
                     lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
                 }
             }
         }
     }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
