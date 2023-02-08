import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtQml 2.12
Item {
    id:startitem
    property bool value: true
    Connections{

    target: vehicletest

            onEnginestarting:{

                meterstack.replace(Qt.resolvedUrl("qrc:/Meter.qml"))

            }
            onMakedefault:{

            }
    }


    Rectangle{
        id:backg
        anchors.fill:parent
        color:"#fb0d0f37"

//Connections{
//    target: vehicletest
//    onEnginestarting:{
//          meterstack.replace(Qt.resolvedUrl("qrc:/Meter.qml"))
//         vehicletest.startTimers();
//        vehicletest.stopEngine()
//    }
//}
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
                onClicked: {
                    vehicletest.startEngine()
//                    vehicletest.startTimers();
                    vehicletest.createtable()
                        label.text="ON"
                        value=false
                    meterstack.replace(Qt.resolvedUrl("qrc:/Meter.qml"))
                   vehicletest.startTimers();
                  vehicletest.stopEngine()
                    vehicletest.applythemestart()

                }

                Label {
                    id: label
                    x: 127
                    y: 175
                    width: 100
                    height: 15
                    text: qsTr("OFF")
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 10
                }
            }

        }
    }
//    Text {
//        id: time
//        text:hour
//        color: "yellow"
//        font.pointSize: 25
//    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
