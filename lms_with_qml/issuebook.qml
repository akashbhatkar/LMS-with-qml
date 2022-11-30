import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4


Item {
    id:ibroot
    GroupBox{
        anchors.centerIn:  parent
        Column{
            spacing: 30

            Row{
                spacing: 15

                Label{
                    text: qsTr("Book Name")
                }

                TextField{
                    height: 30
                    width: 200
                }
            }
            Row{
                spacing: 15

                Label{
                    id: ibstdlbl
                    text: qsTr("Student")
                }
                ComboBox{
                    width: 200
                    model: ['Select student']
                }
            }

            Calendar{

            }
            Row{
                spacing: 15
                Button{
                    id: issue
                    height: 30
                    width:150
                    text: qsTr("Add ")
                }
                Button{
                    id: ibback
                    height: 30
                    width:150
                    text: qsTr("Back")
                    onClicked: {
                        lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
                    }
                }
            }

        }
    }



}
