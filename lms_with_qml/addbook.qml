import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4
Item {
    id: addbookroot
    Image {

        source: "qrc:/Image/addbookimg6.jpg"
        anchors.fill:parent
    }

    Popup
    {
            anchors.centerIn:parent
            width: abgroup.width
            height: abgroup.height
            Image {

                source: "qrc:/Image/checkrightclick.jpg"
                anchors.fill:parent
            }

            id: successbookadd
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
                        successbookadd.close()
                    }
            }
        }
        }

    Popup{
        anchors.centerIn:parent
        width: abgroup.width
        height: abgroup.height

        id: bookwarning
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

            text: qsTr("Enter valid Book and Quantity")
            font.pointSize: 15
        }
        Button{
            height: 30
            width: 200
            text: "OK"
            onClicked: {
                bookwarning.close()
            }
        }
        }

    }

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
                id: booktext
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
                id: quantitytext
                width: 200
                model: ['Select Quantity','1','2','3','4','5','6','7','8','9']
            }
        }
        Row{
            spacing: 10
            Button{
                height: 30
                width: 150
                text: qsTr("Add")

                onClicked: {
                    if(testing.checkvalidbooks(booktext.text,quantitytext.currentIndex)===1)
                    {
                        bookwarning.open()
                    }

                    else
                    {
                        successbookadd.open()
                    }
                }
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
