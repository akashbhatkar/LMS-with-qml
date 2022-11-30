import QtQuick 2.0
import QtQuick.Controls 2.3

Item {

    id:itemroot


    GroupBox
    {
        id: logingroup
        height: 346
        width: 416
        anchors.centerIn: parent
    Column{
        spacing: 20
        id:logincolumn
        anchors.fill: parent
        anchors.rightMargin: 161
        anchors.bottomMargin: 157

        Label{
            x: 65
            y: 41
            text: qsTr("Library Management System ")
            font.bold: true
            font.pointSize: 20
            color: "red"
            anchors.bottom: logingroup.top
            anchors.bottomMargin: 6
            anchors.left: parent.left
        }
        Label{
            id: userlabel
            text: qsTr("Username")
            font.pointSize: 15
        }

       TextField{
           id:usertext
           height: 30
           width: 200


       }
       Label{
           id: passlabel
           text: qsTr("Password")
           font.pointSize: 15
       }

      TextField{
          id:passtext
          height: 30
          width: 200

      }
      Label{
          id: signlabel
          text: qsTr("Dont have account? Sign up")
          font.pointSize: 15
      }

      Row{
          spacing: 5
      Button{
          id: loginbutton
          height: 30
          width: 150
          text: qsTr("Login")
      }
      Button{
          id: signupbutton
          height: 30
          width: 150
          text: qsTr("Sign Up")

          onClicked: {
              lmsstack.replace(Qt.resolvedUrl("qrc:/signup.qml"))
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
