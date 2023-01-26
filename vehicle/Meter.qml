import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick 2.1
import QtQml 2.1

Item {
    property int sec: 00
    property int min: 00
    property int hours: 00
    property color lightgreencolor: "lightgreen"
    property color yellowcolor: "yellow"
    property color redcolor: "red"
    property string lightonn: "qrc:/Images/lightOn.png"
    property string lightoff: "qrc:/Images/lightOff.png"
    property string dipperlight: "qrc:/Images/DipperLight.png"


    Rectangle{
        color: "#0000ff"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        gradient: Gradient{
            GradientStop{position: 0.0; color: "blue"}
            GradientStop{position: 0.7;color: "black"}

        }


    }

Image {
    id: speedometerimage
    x: 17
    y: 99

    source: "qrc:/Images/speedo-removebg-preview.png"
    height: 237
    width: 252


}

Image {
    id: middlespeed
    x: 222
    y: 106
    source: "qrc:/Images/middleDashboard-removebg-preview.png"
    height: 212
    width: 284

    Image {
        id: rightarrow
        x: 205
        y: 171
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
            if((speed>0)&&(speed<60))
            {
                secondgrad.color=lightgreencolor
            }
            else if((speed>60)&&(speed<120))
                secondgrad.color=yellowcolor
            else if((speed>120)&&(speed=180))
                secondgrad.color=redcolor

            else if(speed>180)
            {
                vehicletest.stopSpeed()
            }


        }

        onNotifyEngineRPM:{
            if(rpm>8)
            {
                vehicletest.stopRPM()
            }
            else
                rpmdiall.value=rpm

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
            console.log("started")


        }
        onIndicatorBlinkOff:{
            console.log("stopped")
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
    x: 288
    y: 154
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
    x: 2
    y: 99
    height: 237
    width: 288
    from: 0
    to:180



    Rectangle {
        id: rectangle1
        x: 94
        y: 69
        opacity: 50
        width: 100
        height: 100
        radius:100
        gradient: Gradient{
            GradientStop{position: 0.0; color: "transparent"}
            GradientStop{id:secondgrad;position: 1.7; color: "lightgreen"}

        }
    }

    Label {
        id: kmphlabel
        x: 103
        y: 111
        width: 77
        height: 31
        text:Math.round(diall.value)+" Kmph"
        font.family: "Times New Roman"
        font.bold: true
        font.pointSize: 15
        color: "orange"
    }

    Image {
        id: leftarrow
        x: 250
        y: 176
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
            x: 300
            y: 181
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
        anchors.topMargin: 104
    }
    Label {
        id: templabel
        x: 329
        y: 114

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




Image {
    id: rpmimagbe
    x: 455
    y: 94
    source: "qrc:/Images/rpm_merter.png"
    height: 252
    width: 242

    Dial{
        id:rpmdiall
        x: -23
        y: 7
        height: 237
        width: 288
        from: 1
        to:10
        Rectangle {
            id: bottomrect
            x: -415
            y: 185
            width: 678
            height: 64
            radius:20
            gradient: Gradient{
                GradientStop{position: 0.0; color: "transparent"}
                GradientStop{position: 2.0; color: "red"}

            }
                    }

            Image {
                id: carimage
                x: -99
                y: 177
                width: 47
                height: 36
                source: "qrc:/Images/car.png"
                fillMode: Image.PreserveAspectFit
            }



        Rectangle {
            id: rectangle
            x: 93
            y: 72
            width: 100
            height: 100
            radius: 100
            gradient: Gradient{
                GradientStop{position: 0.0; color: "transparent"}
                GradientStop{position: 2.0; color: "skyblue"}

            }
        }

         Label {
             id: rpmlabel
             x: 99
             y: 110
             width: 77
             height: 31
             font.bold: true
             font.pointSize: 15
             color: "orange"
             text: Math.round(rpmdiall.value)+"X100rpm"
             font.family: "Times New Roman"
         }
         Image {
             id: lightimage
             x: -42
             y: 177
             width: 30
             height: 30
             source: "qrc:/Images/lightOff.png"
             MouseArea{
                 anchors.fill:parent
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
    }
}

    Row{
        id:fuelrow
        x: 309
        y: 197
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
        x: 281
        y: 241
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


//        }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

