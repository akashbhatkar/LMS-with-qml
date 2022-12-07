import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    Image {
        id: returnbookimage
        source: "qrc:/Image/bookdrop.jpg"
        anchors.fill:parent
    }
    Popup{
        anchors.centerIn:parent
        width: rbgroup.width
        height: rbgroup.height
        Image {
//            id: nobookimg
            source: "qrc:/Image/warningsign.jpg"
            anchors.fill:parent
        }
        id: wrongstudent
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

            text: qsTr("Enter Valid Student Name")
            font.pointSize: 15
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                wrongstudent.close()
            }
        }
        }
    }

    Popup{
        anchors.centerIn:parent
        width: rbgroup.width
        height: rbgroup.height
        Image {
//            id: nobookimg
            source: "qrc:/Image/warningsign.jpg"
            anchors.fill:parent
        }
        id: wrongbook
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

            text: qsTr("Book not belongs to this student, please check!")
            font.pointSize: 12
            font.bold: true
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                wrongbook.close()
            }
        }
        }
    }
    Popup{
        Image {

            source: "qrc:/Image/checkrightclick.jpg"
            anchors.fill:parent
        }
        anchors.centerIn:parent
        width: rbgroup.width
        height: rbgroup.height

        id: success
        Column{
            anchors.centerIn:parent
            spacing: 20

        Label{

            text: qsTr("Returned Successfully")
            font.pointSize: 12
            font.bold: true
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

    GroupBox{
        title: "RETURN BOOK"


     id: rbgroup
     anchors.centerIn: parent

     Column{
         x: 0
         y: 0
         width: 394
         height: 243
         spacing: 30

         Row{
             spacing: 70
             Label{
                 text: qsTr("Student ID")
                 font.bold:true
                 font.pointSize:15
                 color: "yellow"
             }
             TextField{
                 id:studentreturntext
                 height: 30
                 width: 200
             }
         }


         Row{
             spacing: 120

             Label{
                 id: rbselectbook
                 text: qsTr("Books")
                 font.bold:true
                 font.pointSize:15
                 color: "yellow"
             }

             TextField {
                 id: booktext
                 width: 200
                 height: 30

             }
         }
         Button{
             height: 30
             width: parent.width
             text: qsTr("Return Book ")
             onClicked: {
                 var x=testing.returnbooks(studentreturntext.text)
                 var arr=testing.issuedbooks(studentreturntext.text,booktext.text)
                 if(x===1)
                 {
                     wrongstudent.open();
                 }

                 else if(arr!==1)
                 {
//                    if(arr!==1)
                        wrongbook.open()
                 }
                 else
                 {
                     success.open()
                 }
             }
         }
//         Row{
//             spacing: 15
//         }
//         Row{
//             spacing: 10
//             Button{
//                 height: 30
//                 width: 150
//                 text: qsTr("Retun Book")

//             }
             Button{
                 height: 30
                 width: 150
                 text: qsTr("Back")

                 onClicked: {
                     lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
                 }
             }


//         }
     }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
