import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {

    id: adduserroot
    Popup{
        anchors.centerIn:parent
        width: aubooks.width
        height: aubooks.height

        id: studentwarning
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

            text: qsTr("please Enter student name and Email -Id")
            font.pointSize: 10
            font.bold: true
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                studentwarning.close()
            }
        }
        }
    }

    Popup{
        anchors.centerIn:parent
        width: aubooks.width
        height: aubooks.height

        id: repeatname
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

            text: qsTr("Student already Exist ")
            font.pointSize: 10
            font.bold: true
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                repeatname.close()
            }
        }
        }
    }

    Popup
    {
            anchors.centerIn:parent
            width: aubooks.width
            height: aubooks.height

            id: successuser
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
                        successuser.close()
                    }
            }
        }
        }


    Popup{
        anchors.centerIn:parent
        width: aubooks.width
        height: aubooks.height

        id: validemailwarning
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

            text: qsTr("E- Mail ID is not valid")
            font.pointSize: 10
            font.bold: true
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                validemailwarning.close()
            }
        }
        }
    }

    GroupBox{
        id: aubooks
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
                id: studenttext
                height: 30
                width: 200

            }
        }
        Row{
            spacing: 30
        }
        Row{
            spacing: 35
            Label{
                id:emaillbl
                text: qsTr("E mail ID")

            }
            TextField{
                id:emailtext
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

                onClicked: {
                    var x=testing.checkvalidstudent(studenttext.text,emailtext.text)
                    if(x===1)
                    {
                        studentwarning.open()
                    }
                    else if(x===2)
                    {
                        validemailwarning.open()
                    }
                    else if(x===4)
                    {
                        repeatname.open()
                    }

                    else
                    {
                        successuser.open()
                    }
                }
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
