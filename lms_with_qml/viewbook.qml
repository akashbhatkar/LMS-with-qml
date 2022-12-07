import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0

Item {
    id: viewbooksroot
    GroupBox{
        title: "View User"
        anchors.fill: parent
        Column{
            id: column

        anchors.fill:parent
        ListView{

            anchors.fill: parent

            id: list
            model: ListModel{

            }
            spacing: 5
            delegate: Text {
                id: b2
                text: val
            }

        }

        Row{
            height: 30
    spacing: 50
        Button {
            id: button
            x: 38
            y: 405
            width: 271
            height: 40
            text: qsTr("Show")
            onClicked: {
                var arr=[]
                arr=testing.bookpass()
                var arrquantity=[]
                arrquantity=testing.quantitypass()
                for(let i=0;i<arr.length;i++)
                {
                    console.log(arr[i])
                    list.model.append({val:arr[i]+"\t"+arrquantity[i]})


                }
            }
        }

        Button {
            id: button1
            x: 353
            y: 405
            width: 271
            height: 40
            text: qsTr("Back")
            onClicked: {
             lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
            }
        }

}
        }
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorColor:"#ffffff";height:480;width:640}
}
##^##*/
