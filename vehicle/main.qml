import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.5
Window {
    width: 750
    height: 487
    visible: true
    title: qsTr("Vehicle Dashboard System")

  StackView{
      id: meterstack
      anchors.fill:   parent
      initialItem: Qt.resolvedUrl("qrc:/Startpage.qml")
  }
}
