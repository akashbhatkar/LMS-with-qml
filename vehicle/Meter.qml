import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQml 2.1
Item {
Rectangle{
    anchors.fill: parent
    anchors.rightMargin: -2
    anchors.bottomMargin: -1
    anchors.leftMargin: 4
    anchors.topMargin: 0
    gradient: Gradient{
        GradientStop{position: 0.0; color: "blue"}
        GradientStop{position: 0.7;color: "black"}

    }
    Image {
        id: speedometerimage
        x: 16
        y: 88

        source: "qrc:/Images/dashboard_speedo (1) (1).png"
        height: 225
        width: 219
    }

    Dial{
        id:diall
        x: 4
        y: 99
        height: 206
        width: 246
        from: 0
        to:180
         Label {
             id: kmphlabel
             x: 106
             y: 88
             width: 77
             height: 31
            text: Math.round(diall.value)
            font.bold: true
            font.pointSize: 15
            color: "orange"
         }
    }

    Label {
        id: label
        x: 505
        y: 8
        width: 101
        height: 25
        color: "orange"
        text:qsTr(" ")
        font.pointSize: 15
        font.italic: true
//        font.bold: true
        font.underline: true
    }
    Timer{
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            var date=new Date()
            label.text=date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm:ss ap")
        }
    }
}
Image {
    id: rpmimagbe
    x: 402
    y: 94
    source: "qrc:/Images/dashboard_rpm-removebg-preview.png"
    height: 225
    width: 219

    Dial{
        id:rpmdiall
        x: -18
        y: 7
        height: 206
        width: 246
        from: 1
        to:10
         Label {
             id: rpmlabel
             x: 92
             y: 88

             width: 77
             height: 31
            text:{ if(Math.round(rpmdiall.value)>=8)
                    "8"
                else
                    Math.round(rpmdiall.value)
            }
            font.bold: true
            font.pointSize: 15
            color: "orange"
         }
    }
}
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
