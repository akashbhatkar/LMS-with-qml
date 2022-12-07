import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4

Item {
    id: viewstudentroot

    GroupBox{
        title: "View User"
        anchors.fill: parent

        ListView{
            id:liststudent
            anchors.fill: parent
            model: ListModel{

            }
            spacing: 5
            delegate: Text {
                id: dtext
                text: value
            }
        }

        Column{
            id:vscolumn
            anchors.fill: parent
            spacing: 10
            ScrollView{
                id: vsscroll
                width: parent.width
                height: parent.height -(vuback.height)
            }
            Row{
                spacing: 50
                Button{
                    id: vushow
                    width: 300
                    text: qsTr("Show")
                    onClicked: {
                        var stdarr=[]
                        stdarr=testing.getstudent()
                        var emailarr
                        emailarr=testing.getemail()

                        for(let i=0;i<stdarr.length;i++)
                        {
                            console.log(stdarr[i])
                            console.log(emailarr[i])

//                            liststudent.model.append({value:stdarr[i]+"\t"+emailarr[i]})
                            liststudent.model.append({value:stdarr[i]+"\t"+emailarr[i]})


                        }

                    }


                }
                Button{
                    id: vuback
                    width: 300
                    text: qsTr("Back")


                    onClicked: {
                        lmsstack.replace(Qt.resolvedUrl("qrc:/mainmenu.qml"))
                    }
                }
            }
        }
    }
}
