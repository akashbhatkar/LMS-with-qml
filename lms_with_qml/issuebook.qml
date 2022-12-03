import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4


Item {
    id:ibroot
    Popup{
        anchors.centerIn:parent
        width: ibgroup.width
        height: ibgroup.height

        id: nobook
        Column{
            anchors.centerIn:parent
            spacing: 20
            Label{

                text: qsTr("! Warning")
                font.bold: true
                font.pointSize: 35
                color: "red"
            }
        Label{

            text: qsTr("Enter Valid Student and Book Name")
            font.pointSize: 15
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                nobook.close()
            }
        }
        }
    }

    GroupBox{
        id: ibgroup
        anchors.centerIn:  parent
        Column{
            spacing: 30

            Row{
                spacing: 15

                Label{
                    text: qsTr("Book Name")
                }

                TextField{
                    id: booktext
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
                TextField{
                    id: studenttext
                    height: 30
                    width: 200

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
                    text: qsTr("Issue ")

                    onClicked: {
                        var x=testing.validbook(booktext.text,studenttext.text)
                        if(x===1)
                        {
                            nobook.open()
                        }

                    }
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
