import QtQuick 2.0
import QtQuick.Controls 2.3

Item {

    id: adduserroot
    GroupBox{
        title: "ADD STUDENT"
        anchors.centerIn: parent

        Column{
            spacing: 20

        Row{
            spacing: 10
            Label{
                id:studentnamelbl
                text: qsTr("Student Name")

            }
            TextField{
                height: 30
                width: 200

            }
        }
        Row{
            spacing: 30
            Label{
                id:monolbl
                text: qsTr("Mobile No")

            }
            TextField{
                height: 30
                width: 200

            }
        }
        Row{
            spacing: 35
            Label{
                id:emaillbl
                text: qsTr("E mail ID")

            }
            TextField{
                height: 30
                width: 200

            }
        }
        Row{
            spacing: 15
            Button{
                id: add
                height: 30
                width:150
                text: qsTr("Add ")
            }
            Button{
                id: auback
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
