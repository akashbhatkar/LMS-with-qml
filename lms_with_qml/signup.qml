import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    id: signuproot

    Image {
        id: signupimage
        source: "qrc:/Image/library.jpg"
        anchors.fill:parent
    }

    Popup{

        anchors.centerIn:parent
        width: signupgroup.width
        height: signupgroup.height

        Image {

            source: "qrc:/Image/checkrightclick.jpg"
            anchors.fill:parent
        }
        id: success
        Column{
            anchors.centerIn:parent
            spacing: 40
            Label{

                text: qsTr("Succesfully Added")
                font.bold: true
                font.pointSize: 25
                color: "green"
            }
            Button{
                height: 30
                width: 200
                text: "OK"
                onClicked: {
                    success.close()
                }
            }
        }
    }


    Popup{
        anchors.centerIn:parent
        width: signupgroup.width
        height: signupgroup.height

        id: repeatentry
        Image {
            //            id: nobookimg
            source: "qrc:/Image/warningsign.jpg"
            anchors.fill:parent
        }
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

                text: qsTr("User already Exist")
                font.pointSize: 15
            }
            Button{
                height: 30
                width: 200
                text: "OK"
                onClicked: {
                    repeatentry.close()
                }
            }
        }
    }


        Popup{
            anchors.centerIn:parent
            width: signupgroup.width
            height: signupgroup.height

            id: notentered
            Image {
                //            id: nobookimg
                source: "qrc:/Image/warningsign.jpg"
                anchors.fill:parent
            }
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

                    text: qsTr("Enter Username and password")
                    font.pointSize: 15
                }
                Button{
                    height: 30
                    width: 200
                    text: "OK"
                    onClicked: {
                        notentered.close()
                    }
                }
            }

        }
        Popup{
            anchors.centerIn:parent
            width: signupgroup.width
            height: signupgroup.height

            id: warning
            Image {
                //            id: nobookimg
                source: "qrc:/Image/warningsign.jpg"
                anchors.fill:parent
            }
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

                    text: qsTr("Please Enter same password ")
                    font.pointSize: 15
                }
                Button{
                    height: 30
                    width: 200
                    text: "OK"
                    onClicked: {
                        warning.close()
                    }
                }
            }

        }
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
                    font.family: "Times New Roman"
                }
                Row{
                    spacing: 95
                    Label{
                        id:usersignlabel
                        text: qsTr("Username")
                        font.pointSize: 15
                        color: "yellow"
                        font.bold: true
                        font.family: "Times New Roman"

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
                        color: "yellow"
                        font.family: "Times New Roman"
                        font.bold: true
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
                        color: "yellow"
                        font.family: "Times New Roman"
                        font.bold: true

                    }
                    TextField{
                        id:repasssigntext
                        height: 30
                        width: 200


                    }
                }

                Row{
                    spacing: 90
                    Button{
                        id: signbuttonscreen
                        height: 30
                        width: 150
                        text: qsTr("Sign up")

                        onClicked: {

                            var x=testing.signup(usersigntext.text,passsigntext.text,repasssigntext.text)

                            if(x===2)
                            {
                                warning.open()
                            }
                            if(x===3)
                            {
                                notentered.open()
                            }
                            if(x===4)
                            {
                                repeatentry.open()
                            }

                            if(x===0)
                            {
                                success.open()
                            }
                        }

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
