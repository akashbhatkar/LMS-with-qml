   import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQml 2.1
import QtQuick.Controls 2.5
import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    height: 487
    width: 750
    Rectangle{
        id:backrect
        anchors.fill: parent
        color: "#fb0d0f37"
    }
    property color sblue: "skyblue"
    property int cnt: 0


    Popup{
        id:warningpop
        height: 200
        width: 200
        anchors.centerIn: parent
        Column{
        Label{
            text: "Please Enter Valid Credentials";
        }
        Button{
            height: 30
            width: 100
            text: "OK"
            onClicked: warningpop.close()
        }
        }
    }

    GroupBox{
        id:menugroup

        anchors.centerIn: parent
        width: 722
        height: 400
        Popup{
            height: 360
            width: 187
            x:505
            y:10
            id:user1popup
            GroupBox{
                height: parent.height
                width: parent.width

                Column{
                spacing: 30
                Row{
                    spacing: 5
                    Label{
                        text: qsTr("Username")
                    }

                TextField{
                    id:user1text
                    height: 25
                    width: 80
                }
                }

                ComboBox{
                    id:backcolorcombo1
                   model: ['Select Background Color','red','black', 'violet','orange','blue','skyblue','pink']
                }

                ComboBox{
                    id:speedocolorcombo1
                    model: ['Select Speedometer color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
                ComboBox{
                    id:textcolorcombo1
                    model: ['Select text color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
            }
                Row{
                    anchors.bottom: parent.bottom
                    spacing: 33
                    Button{
                        height: 25
                        width: 50
                        id:applybutton1
                        text: qsTr("Apply")
                        onClicked: {
                            if(user1text.text!="")
                           button1.text= user1text.text
                            if(user1text.text==""||backcolorcombo1.currentText=="Select Background Color"||speedocolorcombo1.currentText=="Select Speedometer color"||textcolorcombo1.currentText=="Select text color")
                                warningpop.open()
                            else
                            vehicletest.insertuserdata("User1",user1text.text,backcolorcombo1.currentText,speedocolorcombo1.currentText,textcolorcombo1.currentText);
                            user1text.clear()
                        }
                    }
                    Button{
                        height: 25
                        width: 50
                        id:closebutton1
                        text: qsTr("Close")
                        onClicked: user1popup.close()
                    }
                }
            }
        }
        Popup{
            height: 360
            width: 187
            x:505
            y:10
            id:user2popup
            GroupBox{
                height: parent.height
                width: parent.width

                Column{
                spacing: 30
                Row{
                    spacing: 5
                    Label{
                        text: qsTr("Username")
                    }

                TextField{
                    id:user2text
                    height: 25
                    width: 80
                }
                }

                ComboBox{
                    id:backcolorcombo2
                   model: ['Select Background Color','red','black', 'violet','orange','blue','skyblue','pink']
                }

                ComboBox{
                    id:speedocolorcombo2
                    model: ['Select Speedometer color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
                ComboBox{
                    id:textcolorcombo2
                    model: ['Select text color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
            }
                Row{
                    anchors.bottom: parent.bottom
                    spacing: 33
                    Button{
                        height: 25
                        width: 50
                        id:applybutton2
                        text: qsTr("Apply")
                        onClicked: {
                            if(user2text.text!="")
                           button2.text= user2text.text
                            if(user2text.text==""||backcolorcombo2.currentText=="Select Background Color"||speedocolorcombo2.currentText=="Select Speedometer color"||textcolorcombo2.currentText=="Select text color")
                                warningpop.open()
                            else
                            vehicletest.insertuserdata("User2",user2text.text,backcolorcombo2.currentText,speedocolorcombo2.currentText,textcolorcombo2.currentText);
                            user2text.clear()
                        }
                    }
                    Button{
                        height: 25
                        width: 50
                        id:closebutton2
                        text: qsTr("Close")
                        onClicked: user2popup.close()
                    }
                }
            }
        }
        Popup{
            height: 360
            width: 187
            x:505
            y:10
            id:user3popup
            GroupBox{
                height: parent.height
                width: parent.width

                Column{
                spacing: 30
                Row{
                    spacing: 5
                    Label{
                        text: qsTr("Username")
                    }

                TextField{
                    id:user3text
                    height: 25
                    width: 80
                }
                }

                ComboBox{
                    id:backcolorcombo3
                   model: ['Select Background Color','red','black', 'violet','orange','blue','skyblue','pink']
                }

                ComboBox{
                    id:speedocolorcombo3
                    model: ['Select Speedometer color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
                ComboBox{
                    id:textcolorcombo3
                    model: ['Select text color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
            }
                Row{
                    anchors.bottom: parent.bottom
                    spacing: 33
                    Button{
                        height: 25
                        width: 50
                        id:applybutton3
                        text: qsTr("Apply")
                        onClicked: {
                            if(user3text.text!="")
                           button3.text= user3text.text
                            if(user3text.text==""||backcolorcombo3.currentText=="Select Background Color"||speedocolorcombo3.currentText=="Select Speedometer color"||textcolorcombo3.currentText=="Select text color")
                                warningpop.open()
                            else
                            vehicletest.insertuserdata("User3",user3text.text,backcolorcombo3.currentText,speedocolorcombo3.currentText,textcolorcombo3.currentText);
                            user3text.clear()
                        }
                    }
                    Button{
                        height: 25
                        width: 50
                        id:closebutton3
                        text: qsTr("Close")
                        onClicked: user3popup.close()
                    }
                }
            }
        }
        Popup{
            height: 360
            width: 187
            x:505
            y:10
            id:user4popup
            GroupBox{
                height: parent.height
                width: parent.width

                Column{
                spacing: 30
                Row{
                    spacing: 5
                    Label{
                        text: qsTr("Username")
                    }

                TextField{
                    id:user4text
                    height: 25
                    width: 80
                }
                }

                ComboBox{
                    id:backcolorcombo4
                   model: ['Select Background Color','red','black', 'violet','orange','blue','skyblue','pink']
                }

                ComboBox{
                    id:speedocolorcombo4
                    model: ['Select Speedometer color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
                ComboBox{
                    id:textcolorcombo4
                    model: ['Select text color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
            }
                Row{
                    anchors.bottom: parent.bottom
                    spacing: 33
                    Button{
                        height: 25
                        width: 50
                        id:applybutton4
                        text: qsTr("Apply")
                        onClicked: {
                            if(user4text.text!="")
                           button4.text= user4text.text
                            if(user4text.text==""||backcolorcombo4.currentText=="Select Background Color"||speedocolorcombo4.currentText=="Select Speedometer color"||textcolorcombo4.currentText=="Select text color")
                                warningpop.open()
                            else
                            vehicletest.insertuserdata("User4",user4text.text,backcolorcombo4.currentText,speedocolorcombo4.currentText,textcolorcombo4.currentText);
                            user4text.clear()
                        }
                    }
                    Button{
                        height: 25
                        width: 50
                        id:closebutton4
                        text: qsTr("Close")
                        onClicked: user4popup.close()
                    }
                }
            }
        }
        Popup{
            height: 360
            width: 187
            x:505
            y:10
            id:user5popup
            GroupBox{
                height: parent.height
                width: parent.width

                Column{
                spacing: 30
                Row{
                    spacing: 5
                    Label{
                        text: qsTr("Username")
                    }

                TextField{
                    id:user5text
                    height: 25
                    width: 80
                }
                }

                ComboBox{
                    id:backcolorcombo5
                   model: ['Select Background Color','red','black', 'violet','orange','blue','skyblue','pink']
                }

                ComboBox{
                    id:speedocolorcombo5
                    model: ['Select Speedometer color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
                ComboBox{
                    id:textcolorcombo5
                    model: ['Select text color','yellow','orange','blue','skyblue','pink','lightgreen']
                }
            }
                Row{
                    anchors.bottom: parent.bottom
                    spacing: 33
                    Button{
                        height: 25
                        width: 50
                        id:applybutton5
                        text: qsTr("Apply")
                        onClicked: {
                            if(user5text.text!="")
                           button5.text= user5text.text
                            if(user5text.text==""||backcolorcombo5.currentText=="Select Background Color"||speedocolorcombo5.currentText=="Select Speedometer color"||textcolorcombo5.currentText=="Select text color")
                                warningpop.open()
                            else
                            vehicletest.insertuserdata("User5",user5text.text,backcolorcombo5.currentText,speedocolorcombo5.currentText,textcolorcombo5.currentText);
                            user5text.clear()
                        }
                    }
                    Button{
                        height: 25
                        width: 50
                        id:closebutton5
                        text: qsTr("Close")
                        onClicked: user5popup.close()
                    }
                }
            }
        }
        Grid {
            x: 0
            y: 0
            width: 501
            height: 250
            clip: false
          spacing: 30

          Rectangle{
              id:navigrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:navigationimg
                      anchors.top: navigrect.top
                      anchors.left: navigrect.left
                      anchors.right: navigrect.right
                      height: navigrect.height-20
                      source: "qrc:/Images/navigation.png"

                  }
                  Text {
                      anchors.top: navigationimg.bottom
                      anchors.bottom: parent.bottom
                      text: qsTr("       Navigation")
                      color: "orange"

                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: navigrect
                      onEntered: blueglow.visible=true
                      onExited: blueglow.visible=false
                      onClicked: {

                          if(navigationimg.source=="qrc:/Images/navigation.png")
                              navigationimg.source="qrc:/Images/navigationOn.png"
                          else
                             navigationimg.source="qrc:/Images/navigation.png"

                          root.leftindicatorsignal();
                      }
                  }
                  Image {
                      id:blueglow
                      x: -29
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      opacity: 30
                      clip: false
                      height: 180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:callrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:callimage
                      anchors.top: callrect.top
                      anchors.left: callrect.left
                      anchors.right: callrect.right
                      height: callrect.height-20
                      source: "qrc:/Images/callbutton.png"

                  }
                  Text {
                      anchors.top: callimage.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("            Phone")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: callrect
                      onEntered: callblueglow.visible=true
                      onExited: callblueglow.visible=false
                      onClicked: {

                          if(callimage.source=="qrc:/Images/callbutton.png")
                              callimage.source="qrc:/Images/callbuttonOn.png"
                          else
                             callimage.source="qrc:/Images/callbutton.png"
                  }
                  Image {
                      id:callblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }

}
          }
          Rectangle{
              id:fmrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:fmimage
                      anchors.top: fmrect.top
                      anchors.left: fmrect.left
                      anchors.right: fmrect.right
                      height: fmrect.height-20
                      source: "qrc:/Images/radio.png"

                  }
                  Text {
                      anchors.top: fmimage.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("         FM Radio")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: fmrect
                      onEntered: fmblueglow.visible=true
                      onExited: fmblueglow.visible=false
                      onClicked: {

                          if(fmimage.source=="qrc:/Images/radio.png")
                              fmimage.source="qrc:/Images/radioOn.png"
                          else
                             fmimage.source="qrc:/Images/radio.png"
                      }
                  }
                  Image {
                      id:fmblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:settingrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:settingimg
                      anchors.top: settingrect.top
                      anchors.left: settingrect.left
                      anchors.right: settingrect.right
                      height: settingrect.height-20
                      source: "qrc:/Images/setting.png"

                  }
                  Text {
                      anchors.top: settingimg.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("          Setting")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: settingrect
                      onEntered: settingblueglow.visible=true
                      onExited: settingblueglow.visible=false
                      onClicked: {
                          vehicletest.createsettingtable()
                          var userarray=[]
                          userarray=vehicletest.returnusernames()
                          button1.text=userarray[1]
                          button2.text=userarray[2]
                          button3.text=userarray[3]
                          button4.text=userarray[4]
                          button5.text=userarray[5]
                          if(settingimg.source=="qrc:/Images/setting.png")
                          {
                              settingimg.source="qrc:/Images/settingOn.png"
                              clocklabel.visible=false
                              wallpaper.visible=false

                          }
                          else
                          {
                             settingimg.source="qrc:/Images/setting.png"
                              clocklabel.visible=true
                              wallpaper.visible=true
                          }
                      }
                  }
                  Image {
                      id:settingblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:btrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:bluetoothimg
                      anchors.top: btrect.top
                      anchors.left: btrect.left
                      anchors.right: btrect.right
                      height: btrect.height-20
                      source: "qrc:/Images/bluetooth.png"

                  }
                  Text {
                      anchors.top: bluetoothimg.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("       Bluetooth")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: btrect
                      onEntered: btblueglow.visible=true
                      onExited: btblueglow.visible=false
                      onClicked: {

                          if(bluetoothimg.source=="qrc:/Images/bluetooth.png")
                              bluetoothimg.source="qrc:/Images/bluetoothOn.png"
                          else
                             bluetoothimg.source="qrc:/Images/bluetooth.png"
                      }
                  }
                  Image {
                      id:btblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:apleplayrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:appleplayimg
                      anchors.top: apleplayrect.top
                      anchors.left: apleplayrect.left
                      anchors.right: apleplayrect.right
                      height: apleplayrect.height-20
                      source: "qrc:/Images/applecarplay.png"

                  }
                  Text {
                      anchors.top: appleplayimg.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("       Apple Play")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: apleplayrect
                      onEntered: apblueglow.visible=true
                      onExited: apblueglow.visible=false
                      onClicked: {

                          if(appleplayimg.source=="qrc:/Images/applecarplay.png")
                              appleplayimg.source="qrc:/Images/applecarplayOn.png"
                          else
                             appleplayimg.source="qrc:/Images/applecarplay.png"
                      }
                  }
                  Image {
                      id:apblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:leftrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:leftimg
                      anchors.top: leftrect.top
                      anchors.left: leftrect.left
                      anchors.right: leftrect.right
                      height: leftrect.height-20
                      source: "qrc:/Images/LeftArrow.png"


                  }
                  Text {
                      anchors.top: leftimg.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("       Turn Left")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: leftrect
                      onEntered: leftblueglow.visible=true
                      onExited: leftblueglow.visible=false
                      onClicked: {
                          if(value)
                          {
                            vehicletest.indicatorstartfunction()
                          vehicletest.rightindicatorstopfunction()
                              value=false
                              value2=true
                          }
                          else
                          {
                             vehicletest.indicatorstopfunction()
                              value=true
                          }

                      }
                  }
                  Image {
                      id:leftblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }


          }
          Rectangle{
              id:rightrect
              width: 100
              height: 100
              radius:20
              color: "transparent"
                  Image {
                      id:rightimg
                      anchors.top: rightrect.top
                      anchors.left: rightrect.left
                      anchors.right: rightrect.right
                      height: rightrect.height-20
                      source: "qrc:/Images/RightArrow.png"

                  }
                  Text {
                      anchors.top: rightimg.bottom
                      anchors.bottom: parent.bottom

                      text: qsTr("       Turn Right")
                      color: "orange"
                  }

                  MouseArea{
                      hoverEnabled: true
                      anchors.fill: rightrect
                      onEntered: rightblueglow.visible=true
                      onExited: rightblueglow.visible=false
                      onClicked: {
                          if(value2)
                          {
                                vehicletest.indicatorstopfunction()
                          vehicletest.rightindicatorstartfunction();
                          value2=false
                              value=true
                      }
                          else
                          {
                              vehicletest.rightindicatorstopfunction()
                              value2=true
                          }
                      }
                  }
                  Image {
                      id:rightblueglow
                      x: -32
                      y: -50
                      source: "qrc:/Images/blueglow.png"
                      clip: false
                      height:180
                      width: 200
                      visible: false
                  }
          }

      }
        Rectangle{
            height: parent.height
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            width: 200
            color: "transparent"
            border.color: "yellow"
            border.width: 5


            Column{
                id:settingcolumn
                x: 21
                y: 41
                width: 117
                height: 267
                spacing: 15


                Label{
                    text: "User Setting"
                    color: "Orange"
                    font.family: "Times New Roman"
                    font.pointSize: 25
                }

                Label{
                    id:defaultbutton
                    text: "Default"
                    color: "white"
                    font.family: "Times new roman"
                    font.pointSize: 15

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            vehicletest.insertuserdata("Default","Default","#fb0d0f37","lightgreen","orange");
                            vehicletest.senduser("Default")
                            vehicletest.insertdefaulttheme("Default")
//                            var colors=[]
//                            colors=vehicletest.accesscolors("Default")
//                            backrect.color=colors[0]
                        }
                    }
                }

                Label{
                    id:button1
                    height: 30
                    width: 100
                    text: "User 1"
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 15
                    MouseArea{
                        anchors.fill: parent
                    onClicked: {
                        vehicletest.senduser("User1")
                        vehicletest.insertdefaulttheme("User1")
//                        var colors=[]
//                        colors=vehicletest.accesscolors("User1")
//                        backrect.color=colors[0]
                    }
                    onPressAndHold: {
                        user1popup.open()
                    }
                    }
                }
                Label{
                    id:button2
                    height: 30
                    width: 100
                    text: "User 2"
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 15
                    MouseArea{
                        anchors.fill: parent
                    onClicked: {
                        vehicletest.senduser("User2")
                        vehicletest.insertdefaulttheme("User2")
//                        var colors=[]
//                        colors=vehicletest.accesscolors("User2")
//                        backrect.color=colors[0]
                    }
                    onPressAndHold: {
                        user2popup.open()
                    }
                    }
                }
                Label{
                    id:button3
                    height: 30
                    width: 100
                    text: "User 3"
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 15
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            vehicletest.senduser("User3")
                            vehicletest.insertdefaulttheme("User3")
//                            var colors=[]
//                            colors=vehicletest.accesscolors("User3")
//                            backrect.color=colors[0]
                        }
                    onPressAndHold:  {
                        user3popup.open()
                    }
                    }
                }
                Label{
                    id:button4
                    height: 30
                    width: 100
                    text: "User 4"
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 15
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            vehicletest.senduser("User4")
                            vehicletest.insertdefaulttheme("User4")
//                            var colors=[]
//                            colors=vehicletest.accesscolors("User4")
//                            backrect.color=colors[0]
                        }

                    onPressAndHold: {
                        user4popup.open()
                    }
                    }
                }
                Label{
                    id:button5
                    height: 30
                    width: 100
                    text: "User 5"
                    color: "white"
                    font.family: "Times New Roman"
                    font.pointSize: 15
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                         vehicletest.senduser("User5")
                            vehicletest.insertdefaulttheme("User5")
//                            var colors=[]
//                            colors=vehicletest.accesscolors("User5")
//                            backrect.color=colors[0]
                        }
                    onPressAndHold:  {
                        user5popup.open()
                    }
                    }
                }
            }
        }
        Image {
            id: wallpaper
            height: 360
            width: 187
            x:505
            y:10
            visible: true
            source: "qrc:/Images/carwallpaper.jpg"
            Label{
                id:clocklabel
                x: 21
                y: 88
                width: 87
                height: 51
                visible: true
                text: "hello"
                color: "white"
                font.family: "Times New Roman"
                font.pointSize: 30

            }
        }
    }
    Timer{
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            var date=new Date()
            clocklabel.text=date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm AP")
        }
    }
}
