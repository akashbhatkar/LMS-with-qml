import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item{
    Image {
        id: libraryimage
        source: "qrc:/Image/library.jpg"
        anchors.fill:parent
    }
    Popup{
        Image {
            id: wrongpopupimg
            source: "qrc:/Image/warningsign.jpg"
            anchors.fill:parent
        }
        anchors.centerIn: parent
        id: wrongpopup
        height: logingroup.height
        width: logingroup.width

        Column
        {
            anchors.centerIn: parent
            spacing: 25
            Label{
                text: qsTr("! WARNING")
                font.bold: true
                font.pixelSize: 40
                color: "red"
            }

            Label{
                text: qsTr("Username or Password is incorrect")
                font.bold: true
                font.pixelSize: 20
            }
            Button{
                text: qsTr("OK")
                width: parent.width
                onClicked: {
                    wrongpopup.close()
                }
            }
        }
    }
    Popup{
        anchors.centerIn: parent
        id: notenteredwarning
        height: logingroup.height
        width: logingroup.width
        Image {
//            id: notenteredwarningomg
            source: "qrc:/Image/warningsign.jpg"
            anchors.fill:parent
        }

        Column
        {
            anchors.centerIn: parent
            spacing: 25
            Label{
                text: qsTr("! WARNING")
                font.bold: true
                font.pixelSize: 40
                color: "red"
            }

            Label{
                text: qsTr("Please enter username and password")
                font.bold: true
                font.pixelSize: 20
            }
            Button{
                text: qsTr("OK")
                width: parent.width
                onClicked: {
                    notenteredwarning.close()
                }
            }
        }
    }
    GroupBox{
        id:logingroup
        width: 512
        height: 392
        anchors.centerIn:  parent



    Button {
        id: button
        x: 220
        y: 236
        width: 84
        height: 25
        text: "LogIn"
//        font.italic: true
//        font.bold: true

        onClicked: {
            if(testing.login(usertext.text,passtext.text)===2)
            {
                notenteredwarning.open()
            }
            if(testing.login(usertext.text,passtext.text)===4)
            {
                wrongpopup.open()
            }

            if(testing.login(usertext.text,passtext.text)===1)
            {
          lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
            }
        }

    }

    Button {
        id: button1
        x: 329
        y: 238
        width: 91
        height: 23
        text: qsTr("SignUp")
//        font.italic: true
//        font.bold: true
        onClicked: {

                  lmsstack.replace(Qt.resolvedUrl("qrc:/signup.qml"))
              }

    }

    Label {
        id: label
        x: 125
        y: 34
        width: 295
        height: 22
        text: "DTIOT LIBRARY MANAGEMENT "
        color: "orange"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 20
        font.bold: true
    }

    Label {
        id: label1
        x: 79
        y: 95
        width: 89
        height: 27
        text: qsTr("UserName :")
        color: "yellow"
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 10
    }

    Label {
        id: label2
        x: 79
        y: 159
        width: 89
        height: 24
        text: qsTr("PassWord :")
        color: "yellow"
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 10
    }

    TextField {
        id: usertext
        x: 220
        y: 95
        width: 200
        height: 27
//        font.bold: true
    }

    TextField {
        id: passtext
        x: 220
        y: 159
        width: 200
        height: 24
    }
}
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
