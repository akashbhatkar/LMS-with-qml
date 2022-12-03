import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("DEVELOPED BY: AKASH BHATKAR")

    StackView{
        id:lmsstack
        anchors.fill:parent
        initialItem: Qt.resolvedUrl("qrc:/loginscreen.qml")

    }


}
