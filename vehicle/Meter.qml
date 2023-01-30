import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQml 2.1

Item {
    property int sec: 00
    property int min: 00
    property int hours: 00
    property int rpmval: 00
    property color lightgreencolor: "lightgreen"
    property color yellowcolor: "orange"
    property color redcolor: "red"
    property string lightonn: "qrc:/Images/lightOn.png"
    property string lightoff: "qrc:/Images/lightOff.png"
    property string dipperlight: "qrc:/Images/DipperLight.png"


    Rectangle{
        color: "#0000ff"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: -89
        anchors.leftMargin: -102
        anchors.left: parent.left
        anchors.right: parent.right
        gradient: Gradient{
            GradientStop{position: 0.0; color: "blue"}
            GradientStop{position: 0.7;color: "black"}

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
        x: 205
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
            console.log(speed)
            diall.value=speed

            if((speed>0)&&(speed<60))
            {
                rectangle1.color=lightgreencolor
            }
            else if((speed>60)&&(speed<120))
                rectangle1.color=yellowcolor
            else if((speed>120)&&(speed<180))
                rectangle1.color=redcolor

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
            rightarrowanimationone.target=rightarrow

           rightarrowanimationone.start()
            leftarrowanimationone.target=leftarrow
            leftarrowanimationone.start()
        }
        onIndicatorBlinkOff:{

             rightarrowanimationone.target=img
            leftarrowanimationone.target=img2
            vehicletest.indicatorstopfunction()
        }

        onTotalEngineTime:{
            sec=sec+1;
            if(sec===60)
            {
                sec=0
                ++min
                if(min===60)
                {
                    min=0
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
//}
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

        Tumbler {
            id: tumbler
            x: -6
            y: 40
            width: 57
            height: 25
            font.pointSize: 15
            font.bold: true
            visibleItemCount: 1
            model: 221
            currentIndex: diall.value
        }
    }

    Label {
        id: kmphlabel
        x: 75
        y: 64
        width: 61
        height: 19
        text:" Km/h"
        font.family: "Times New Roman"
        font.bold: true
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
            x: 262
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
             x: 390
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
                     lightimage.source="qrc:/Images/lightOn.png"

                     else if(lightimage.source=="qrc:/Images/lightOn.png")
                       lightimage.source="qrc:/Images/DipperLight.png"
                     else
                         lightimage.source="qrc:/Images/lightOn.png"
                 }
                 onPressAndHold: lightimage.source="qrc:/Images/lightOff.png"
             }
         }
         Image {
             id: carimage
             x: 336
             y: 360
             width: 47
             height: 36
             source: "qrc:/Images/car.png"
             fillMode: Image.PreserveAspectFit
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

    Row{
        x: 293
        y: 317
        width: 172
        height: 24
        spacing:5
        Label{
            id:engtimelabel
            text: qsTr("Engine Time")
            font.pointSize: 12
            color: "orange"
            font.family: "Times New Roman"
        }
        Label{
            id:hrlabel
            text: hours+"H"
            font.pointSize: 12
            color: "orange"
            font.family: "Times New Roman"
        }

        Label{
         id:minlable
         text:min+"M"
         font.pointSize: 12
         color: "orange"
         font.family: "Times New Roman"

        }

        Label{
            id:seclabel
            text: sec+"S"
            font.pointSize: 12
            color: "orange"
            font.family: "Times New Roman"
        }
    }
//Button{
//    id:acclerator
//    x:0
//    y:0
//    height: 100
//    width: 70

//    onPressed:  vehicletest.startTimers();
//    onReleased: {
//        vehicletest.startTimers();
//        vehicletest.stopSpeed();
//        vehicletest.stopRPM();
//        vehicletest.stopTemp();
//        vehicletest.stopFuel();
//    }
//    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

