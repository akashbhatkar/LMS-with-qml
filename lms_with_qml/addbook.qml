import QtQuick 2.0
import QtQuick.Controls 2.3
Item {
    id: addbookroot

    GroupBox{
        title: "ADD BOOK"
        anchors.centerIn: parent

        id: abgroup
Column{
    spacing: 15
        Row{
            spacing: 45
            Label{
                text: qsTr("Book Name")
            }

            TextField{
                height: 30
                width: 200

            }
        }
        Row{
            spacing: 55
            Label{
                text: qsTr("Quantity")
            }

            ComboBox{
                model: ['Select Quantity','1','2','3','4','5','6','7','8','9']
            }
        }
        Row{
            spacing: 10
            Button{
                height: 30
                width: 150
                text: qsTr("Add")
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
