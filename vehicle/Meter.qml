import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQml 2.1
import QtQuick.Window 2.12
import QtMultimedia 5.0
Item {
    id: meteritem

    property int sec: vehicletest.passEngineSecond()
    property int min: vehicletest.passEngineMinute()
    property int hours: vehicletest.passEngineHour()

    property int distance: vehicletest.passkms()

    property int rpmval: 00
    property color lightgreencolor: "lightgreen"
    property color yellowcolor: "orange"
    property color redcolor: "red"
    property string lightonn: "qrc:/Images/lightOn.png"
    property string lightoff: "qrc:/Images/lightOff.png"
    property string dipperlight: "qrc:/Images/DipperLight.png"

    property bool value: true
    property bool value2: true
    property bool enginevalue: true

      Rectangle{
          id:backg
        visible: true
        color: "#fb0d0f37"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: -89
        anchors.leftMargin: -102
        anchors.left: parent.left
        anchors.right: parent.right
//        gradient: Gradient{
//            GradientStop{position: 0.0; color: "blue"}
//            GradientStop{position: 0.7;color: "black"}

//        }

        Image {
            id: glowimage1
            x: 0
            y: 291
            width: 641
            height: 189
            visible: false
            source: "qrc:/Images/blueglow.png"

        }

        Image {
            id: glowimage2
            x: 448
            y: 291
            width: 661
            height: 189
            visible: false
            source: "qrc:/Images/blueglow.png"
            fillMode: Image.Stretch
        }
    }
Image {
    id: speedometerimage
    x: 0
    y: 146
    source: "qrc:/Images/220Speedo.png"
    height: 280
    visible: true
    width: 280

    Label {
        id: distancelabel
        x: 101
        y: 215
        width: 109
        height: 20
        text: distance+" kms"
        font.family: "Times New Roman"
        color: "#000000"
        font.bold: true
        font.pointSize: 20

    }
}

Image {
    id: middlespeed
    x: 233
    y: 166
    source: "qrc:/Images/middleDashboard-removebg-preview.png"
    height: 236
    width: 284

    Image {
        id: rightarrow
        x: 210
        y: 195
        width: 57
        height: 45
        source: "qrc:/Images/RightArrow.png"
        PropertyAnimation {
            id: rightarrowanimationone;
            target:rightarrow;
            alwaysRunToEnd: true;
            property: "opacity";
            to:0
            duration: 100;
            onStopped: rightarrowanimationTwo.start()
        }
        PropertyAnimation {
            id: rightarrowanimationTwo;
            target: rightarrow;
            alwaysRunToEnd: true;
            property: "opacity";
            to:1;
            duration: 100;
            onStopped: rightarrowanimationone.start()
        }
    }
}

Connections{
    target: vehicletest
        onNotifyVehicleSpeed:
        {
            diall.value=speed
            if(speed>220)
            {
                vehicletest.stopSpeed()

            }
        }

        onNotifyEngineRPM:{
            if(rpm>8000)
            {
                vehicletest.stopRPM()
            }
            else
            {
                rpmdiall.value=rpm
                rpmval= rpm/1000
            }
        }

        onNotifyOutsideTemp:{
            if(temp>35)
            {
                vehicletest.stopTemp()
            }
            else
                templabel.text="Temp:-"+temp+" C"
        }

        onNotifyFuelLevel:{

            if(fuel<0)
            {
                vehicletest.stopFuel()
                animationOne.start()
                diall.value=0
                rpmdiall.value=0
                rpmval=0

            }
            else
                fueltext.text=fuel+"Ltrs"
            if(fuel<20)
            {
                fuelImage.source="qrc:/Images/fuelIndicatorRED.png"
               animationOne.start()
            }
        }
        onIndicatorBlink:{

            leftarrowanimationone.target=leftarrow
            leftarrowanimationone.start()
        }
        onIndicatorBlinkOff:{
            leftarrowanimationone.target=img2
//            vehicletest.indicatorstopfunction()
        }
        onRightIndicatorBlink:{
            rightarrowanimationone.target=rightarrow

           rightarrowanimationone.start()
        }
        onRightIndicatorBlinkOff:{
            rightarrowanimationone.target=img
        }

        onTotalEngineTime:{
            sec=sec+1;
            if(sec===60)
            {
                sec=0
                ++min
                if(min===60)
                {
                    min1=0
                    ++hours
                    if(hours===12)
                    {
                        sec=0
                        min=0
                        hours=0
                    }
                }
            }
        }
        onDistancesignal:{
            distance=distance+1
           }
        onUsersignal:{
            var colors=[]
            colors=vehicletest.accesscolors(user)
            backg.color=colors[0]
            rectangle.color=colors[1]
            rectangle1.color=colors[1]
            templabel.color=colors[2]
            label.color=colors[2]
            fueltext.color=colors[2]
            engtimelabel.color=colors[2]
            distancelabel.color=colors[2]
        }
        onMakedefault:{
            var colors=[]
            colors=vehicletest.accesscolors(defaultuser)
            backg.color=colors[0]
            rectangle.color=colors[1]
            rectangle1.color=colors[1]
            templabel.color=colors[2]
            label.color=colors[2]
            fueltext.color=colors[2]
            engtimelabel.color=colors[2]
            distancelabel.color=colors[2]
        }
}

Row{
    x: 294
    y: 223
    width: 70
    height: 30
    spacing:7
    Image {
        id: clockimage
        source: "qrc:/Images/clock.png"
        height:30
        width: 30
    }
    Label {
        id: label
        width: 101
        height: 25
        color: "orange"
        text:qsTr(" ")

        anchors.bottom: parent.bottom
        font.pointSize: 15
        font.family: "Times New Roman"
    }
}

Dial{
    id:diall
    x: 48
    y: 205
    height: 148
    wrap: true
    width: 172
    from: 0
    to:220



    Rectangle {
        id: rectangle1
        x: 36
        y: 22
        visible: true
        width: 100
        height: 100
        radius:100
        color: "lightgreen"

        Image {
            id: hornimage
            x: 33
            y: 13
            width: 34
            height: 30
            source: "qrc:/Images/horn.png"
            fillMode: Image.Stretch

            MouseArea{
                anchors.fill:parent
                onClicked: {
                   hornsound.play()
                }
            }
        }

        Tumbler {
            id: tumbler
            x: -4
            y: 49
            width: 57
            height: 25
            font.pointSize: 15
            font.bold: true
            visibleItemCount: 1
            model: 221
            currentIndex: diall.value
        }
    }
    SoundEffect{
        id:hornsound
        source: "qrc:/sounds/carhorn.wav"
    }
    Label {
        id: kmphlabel
        x: 78
        y: 74
        width: 61
        height: 19
        text:" Km/h"
        font.family: "Times New Roman"
        font.bold: false
        font.pointSize: 15
        color: "Black"
    }

    Image {
        id: leftarrow
        x: 207
        y: 155
        width: 45
        height: 39
        source: "qrc:/Images/LeftArrow.png"
        fillMode: Image.PreserveAspectFit

        PropertyAnimation {
            id: leftarrowanimationone;
            target:leftarrow;
            alwaysRunToEnd: true;
            property: "opacity";
            to:0
            duration: 100;
            onStopped: lefttarrowanimationTwo.start()
        }
        PropertyAnimation {
            id: lefttarrowanimationTwo;
            target: leftarrow;
            alwaysRunToEnd: true;
            property: "opacity";
            to:1;
            duration: 100;
            onStopped: leftarrowanimationone.start()
        }
}

Image {
    id: batteryimage
            x: 253
            y: 156
            width: 30
            height: 25
            source: "qrc:/Images/Battery.png"
            fillMode: Image.PreserveAspectFit
        }


}

    Timer{
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            var date=new Date()
            label.text=date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm:ss AP")
        }
    }


    Image {
        id: tempimage
        x: 269
        width: 65
        height: 45
        anchors.top:parent.top
        source: "qrc:/Images/tempIndicator.png"
        anchors.topMargin: 171
    }
    Label {
        id: templabel
        x: 329
        y: 179

        width: 77
        height: 25
        font.pointSize: 18
        color: "orange"
        text: {
            qsTr("Temp:-10 C")
        }
        font.family: "Times New Roman"
    }



    Image {
        id: img
        x: 590
        y: 373
        width: 9
        height: 10
        visible: false
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }

Image {
    id: img2
    x: 621
    y: 396
    width: 9
    height: 6
    visible: false
    source: "qrc:/qtquickplugin/images/template_image.png"
    fillMode: Image.PreserveAspectFit
}




Image{
    id: rpmimagbe
    x: 469
    y: 146
    source: "qrc:/Images/rpmwhite.png"
    height: 280
    visible: true
    width: 280
}
    Dial{
        id:rpmdiall
        x: 525
        y: 203
        height: 140
        width: 166
        from: 0
        to:8000

        Rectangle {
            id: rectangle
            x: 39
            y: 27
            width: 90
            height: 90
            visible: true
            radius: 90
            color: lightgreencolor

            Tumbler {
                id: tumbler1
                x: 14
                y: 22
                width: 60
                height: 37
                font.pointSize: 15
                font.bold: true
                visibleItemCount: 1
                model: 9
                currentIndex: rpmval
            }
        }

         Label {
             id: rpmlabel
             x: 50
             y: 82
             width: 77
             height: 31
             font.bold: true
             font.pointSize: 10
             color: "black"
             text:"X1000 RPM"
             font.family: "Times New Roman"
         }
    }
    Image {
        id: lightimage
        x: 340
        y: 361
        width: 30
        height: 30
        source: "qrc:/Images/lightOff.png"

             MouseArea{
                 anchors.fill:parent
                 anchors.rightMargin: 0
                 anchors.bottomMargin: -2
                 anchors.leftMargin: 0
                 anchors.topMargin: 2
                 onClicked: {

                     if(lightimage.source=="qrc:/Images/lightOff.png")
                     {
                     lightimage.source="qrc:/Images/lightOn.png"
                         glowimage1.visible=true
                         glowimage2.visible=true
                     }

                     else if(lightimage.source=="qrc:/Images/lightOn.png")
                     {
                       lightimage.source="qrc:/Images/DipperLight.png"
                         glowimage1.visible=true
                         glowimage2.visible=true
                     }
                     else
                     {
                         lightimage.source="qrc:/Images/lightOn.png"
                         glowimage1.visible=true
                         glowimage2.visible=true
                     }
                 }
                 onPressAndHold: {
                     glowimage1.visible=false
                     glowimage2.visible=false
                     lightimage.source="qrc:/Images/lightOff.png"
                 }
             }
         }
    Image {
        id: stearingimage
        x: 370
        y: 359
        width: 39
        height: 34
        source: "qrc:/Images/stearing.png"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.fill: parent
            onClicked: {

                var component = Qt.createComponent("qrc:/Menupage.qml")
                            var window    = component.createObject(parent)
                            window.show()
            }
        }
    }
         Image {
             id: backimage
             x: 414
             y: 359
             width: 38
             height: 36
             source: "qrc:/Images/engineStop.png"

             MouseArea{
                 anchors.fill: parent
                 onClicked: {
//                     meterstack.replace(Qt.resolvedUrl("qrc:/Startpage.qml"))
                     vehicletest.updateValues(hours,min,sec)
                     vehicletest.updatedistance(distance)
                     Qt.quit()
                 }
             }
         }



    Row{
        id:fuelrow
        x: 314
        y: 272
        width: 102
        height: 43
        anchors.verticalCenterOffset: -19
        anchors.horizontalCenterOffset: -15
        spacing: 10
        Image {
            id: fuelImage
            width: 30
            height: 30
            source: "qrc:/Images/fuelIndicatorGREEN.png"
            PropertyAnimation {
                id: animationOne
                target:fuelImage
                alwaysRunToEnd: true
                property: "opacity"
                to: 1
                duration: 200
                onStopped: animationTwo.start()
            }
            PropertyAnimation {
                id: animationTwo
                target: fuelImage
                alwaysRunToEnd: true
                property: "opacity"
                to: 0
                duration: 300
                onStopped: animationOne.start()
            }

        }
        Text {

            id: fueltext
            height: 43
            visible: true
            font.pointSize: 15
            text:"50Ltrs"
            font.family: "Times New Roman"
            color: "orange"
        }
    }
        Label{
            id:engtimelabel
            x: 290
            y: 321
            text:"Engine Time"+" "+hours+"H "+min+"M "+sec+"S"
            font.pointSize: 12
            color: "orange"
            font.family: "Times New Roman"
        }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

