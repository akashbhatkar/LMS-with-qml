import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.5
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

  StackView{
      id: meterstack
      anchors.fill: parent
      initialItem: Qt.resolvedUrl("qrc:/Startpage.qml")
  }
}