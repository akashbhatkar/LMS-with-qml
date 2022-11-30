import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    id: signuproot

    GroupBox{
        id: signupgroup
        title: ""
        anchors.centerIn: parent


        Column{
            id: signupcolumn
            anchors.fill: parent
            spacing: 20

            Label{
                text: qsTr("SIGN UP ")
                font.bold: true
                font.pointSize: 20
                color: "red"
            }
            Row{
                spacing: 95
            Label{
                id:usersignlabel
                text: qsTr("Username")
                font.pointSize: 15

            }
            TextField{
                    id:usersigntext
                    height: 30
                    width: 200


                }
            }

            Row{
                spacing: 50
            Label{
                id:passsignlabel
                text: qsTr("Enter Password")
                font.pointSize: 15

            }
            TextField{
                    id:passsigntext
                    height: 30
                    width: 200


                }
            }

            Row{
                spacing: 20
            Label{
                id:repasssignlabel
                text: qsTr("Re-Enter Password")
                font.pointSize: 15

            }
            TextField{
                    id:repasssigntext
                    height: 30
                    width: 200


                }
            }

            Row{
                spacing: 10
                Button{
                    id: signbuttonscreen
                    height: 30
                    width: 150
                    text: qsTr("Sign up")

                }
                Button{
                    id: signupback
                    height: 30
                    width: 150

                    text: qsTr("Back")

                    onClicked: {
                        lmsstack.replace(Qt.resolvedUrl("qrc:/loginscreen.qml"))

                    }

                }

            }
            }
        }



}
