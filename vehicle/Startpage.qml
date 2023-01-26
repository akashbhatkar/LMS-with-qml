import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
Item {
    Rectangle{
        anchors.fill:parent
        color: "#fb0d0f37"


        Rectangle{

            anchors.centerIn: parent
            height: 300
            width: 300
            radius: 300
            color: "#0000ff"
            gradient: Gradient{
                GradientStop{position: 0.0;color: "blue"}
                GradientStop{position: 0.7;color: "black"}
            }
            border.color: "yellow"
            border.width: 15
            Text {
                id:recttext
                text: qsTr("START")
                color: "white"
                anchors.centerIn: parent
                font.pointSize: 35
                font.bold: true
                font.family: "Times New Roman"
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{

                    meterstack.replace(Qt.resolvedUrl("qrc:/Meter.qml"))
                    vehicletest.startTimers();

//                onPressAndHold: meterstack.replace(Qt.resolvedUrl("qrc:/Meter.qml"))
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
