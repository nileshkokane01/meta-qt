import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 1280
    height: 480


    Rectangle {
        color: "#212126"
        anchors.fill: parent
    }


    Item{
        id:cluster
        Rectangle {
            // parent rectangle
            id: rectangle1
            x: 0
            y: 0
            z: 0
            width: 1280
            height: 480
            radius: 0
            visible: true
            border.width: 0
            border.color: "#ffffff"
            signal message(string msg)


            property bool startFlag: true
            property real dialOpacity : 0
            property real  rpmValue: 0
            property real  speedValue: 0
            property int  gear: 0
            property int fuelValue: 30

            property bool turn_rightFlag: false
            property bool turn_leftFlag: false
            property bool beamFlag: false
            property bool oilFlag: false
            property bool batteryFlag: false
            property bool fuelFlag: false
            property bool parkingFlag: false
            property bool brakeFlag: false

            property string configurablePointer:"image/needle.png"
            property alias backCluster : loadNavigation.opacity

            color:"black"

            function rpmSpeedMeter(){

                rpm_dial.value = rpmValue
                speed_dial.value = speedValue
                if(gear == 0){
                    rpmValue = rpmValue + 5
                    speedValue = speedValue + 2
                    gear = 1
                }
                else if(gear == 1){
                    if(rpmValue > 60)
                    {
                        rpmValue = 30;
                        speedValue = speedValue - 5
                        gear = 2
                    }
                    rpmValue = rpmValue + 2.5
                    speedValue = speedValue + 1.5

                }
                else if(gear == 2){
                    if(rpmValue > 70)
                    {
                        rpmValue = 50;
                        speedValue = speedValue - 4
                        gear = 3
                    }
                    rpmValue = rpmValue + 2
                    speedValue = speedValue + 1


                }
                else if(gear == 3){
                    if(rpmValue > 80)
                    {
                        rpmValue = 60;
                        speedValue = speedValue - 3
                        //indicatorflash.running = true
                        gear = 4
                    }
                    rpmValue = rpmValue + 1.5
                    speedValue = speedValue + 0.5

                }
                else if(gear == 4){
                    if(rpmValue > 90)
                    {
                        rpmValue = 70;
                        speedValue = speedValue - 1
                        gear = 4
                    }
                    rpmValue = rpmValue + 1
                    speedValue = speedValue + 0.3
                }
                if(speedValue >120)
                {
                    rpmValue = speedValue = gear = 0
                }

            }


            Loader{id:navload ;z:8}

            Rectangle{
                id:loadNavigation
                width:300
                height:60
                z: 9
                anchors.bottom: parent.bottom
                color:"black"

                Rectangle {
                    id: backButton
                    width: opacity ? 60 : 0
                    opacity: 1 //stackView.depth > 1 ? 1 : 0
                    antialiasing: true
                    height: 60
                    radius: 4
                    property bool loadnav:true
                    color: backmouse.pressed ? "#222" : "transparent"
                    Behavior on opacity { NumberAnimation{} }
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        source: "image/navigation_previous_item.png"
                    }
                }



                MouseArea {
                    id: backmouse
                    anchors.fill: parent
                    anchors.margins: -10
                    onClicked:{
                        if(backButton.loadnav==true){
                            navload.source=""
                            navload.source="Navigation.qml"
                            context.text="Back"

                        }
                        else{
                            navload.source=""
                            navload.source="cluster"
                            context.text="Configurable Menu"
                        }
                        backButton.loadnav=! backButton.loadnav
                    }
                }
                Text {
                    id:context
                    font.pixelSize: 20
                    Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
                    x: backButton.x + backButton.width + 20
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                    text: "Configurable Menu"
                }


            }

            Timer {
                id:rpmAndspeedUpdate
                interval: 200
                running: false
                repeat: true
                onTriggered: {
                    if(rectangle1.startFlag == true)
                        rectangle1.rpmSpeedMeter()
                    else{rpm_dial.value=0;speed_dial.value=0;}
                }
            }

            Image {
                id: straightBeam
                x: 322
                y: 27
                z: 0
                opacity: 0
                source: "image/High_Beam_Indicator.png"
            }

            Image {
                id: fuel_gauge
                x: 552
                y: 57
                z: 0
                opacity: 1
                source: "image/fuel_gauge.png"
            }

            Image {
                id: fuel_pointer
                x: 622
                y: 80
                z: 0
                clip:true
                smooth:true
                opacity: 1
                source: "image/fuelneedle.png"
                transform:Rotation{
                    id:fuelpointer
                    origin.x: 5; origin.y: 43
                    angle: Math.min(Math.max(-70, speed_dial.value*2.6 - 130), 70)
                    Behavior on angle{
                        SpringAnimation{
                            spring:1.4
                            damping: .60
                        }
                    }

                }
            }

            Image {
                id: parkingLight
                x: 850
                y: 32
                z: 0
                fillMode: Image.Tile
                source: "image/parkingLight.png"
            }

            Image {
                id: battery_low
                x: 200
                y: 85
                scale: 1.0
                rotation: 90
                z: 0
                source: "image/battery_low1.png"
            }

            Image {
                id: turn_left
                x: 560
                y: 208
                smooth: true
                z: 0
                source: "image/turn_indicator_left.png"
            }

            Image {
                id: turn_right
                x: 660
                y: 208
                smooth: true
                z: 0
                source: "image/turn_indicator.png"
            }


            Image {
                id: petrol_indicator
                x: 980
                y: 59
                z: 0
                scale: 0.4
                source: "image/petrol.png"
            }


            Image {
                id: oilIndication
                x: 110
                y: 182
                z: 0
                source: "image/oilIndicator.png"
            }

            Image {
                id: line
                x: -49
                y: 20
                visible: true
                opacity: 0
                source: "image/dropDown.png"
            }

            Image {
                id: rpm_active
                x: 260
                y: 79
                z: 3
                opacity: 0
                visible: true
                source: "image/rpm_active.png"
            }

            Image {
                id: speed_active
                x: 695
                y: 75
                z:  3
                opacity: 0
                visible: true
                source: "image/speed_active1.png"
            }

            Image {
                id: brakeDamage
                x: 1070
                y: 190
                z: 0
                source: "image/Brake_failure.png"
            }

            Text {
                id: totalDistance
                x: 563
                y: 131
                color: "#a5bcc6"
                text: "Distance: 5000"
                smooth: true
                opacity: 0
                style: Text.Raised
                font.bold: true
                z: 0
                font.pixelSize: 15
            }



            Text {
                id: destination
                x: 363
                y: 131
                color: "#a5bcc6"
                text: "Destination: 51 Street"
                smooth: true
                opacity: 0
                style: Text.Raised
                font.pixelSize: 15
                font.bold: true
                z: 0
            }


            Text {
                id: time
                x: 363
                y: 131
                color: "#a5bcc6"
                text: "Time: 12:45:07"
                smooth: true
                opacity:0
                style: Text.Raised
                font.pixelSize: 15
                font.bold: true
                z: 0
            }


            Text {
                id: date
                x: 363
                y: 131
                color: "#a5bcc6"
                text: " Date: 28:02:2017"
                smooth: true
                opacity: 0
                style: Text.Raised
                font.pixelSize: 15
                font.bold: true
                z: 0
            }

            Text {
                id: oil
                x: 363
                y: 0
                color: "#e61414"
                text: "Engine Oil Low Level"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: brake
                x: -178
                y: 0
                color: "#f52323"
                text: "Brake Pad Warning"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: fuelLeak
                x: -178
                y: 0
                color: "#c70a0a"
                text: "Fuel Tank Leakage Warning"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: battery
                x: -178
                y: 0
                color: "#f21616"
                text: "Battery Low"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }


            Text {
                id:parkinglight
                x: -178
                y: 0
                color: "#f21616"
                text: "Parking Light ON"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: highBeam
                x: -178
                y: 0
                color: "#e61414"
                text: "High Beam On"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: turnright
                x: -178
                y: 0
                color: "#f21616"
                text: "Right Turn"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            Text {
                id: turnleft
                x: -178
                y: 0
                color: "#f21616"
                text: "Turn Left"
                smooth: true
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                visible: false
                font.pixelSize: 15
            }

            MouseArea {
                id: right
                x: 758
                y: 187
                width: 42
                height: 262
                onClicked:{
                    leftTurn.running = false
                    leftIndicatorOff.start()
                    rightTurn.running = true
                }
            }



            // speed dial import from speedDial qml
            SpeedDial  {
                id: speed_dial
                x: 477
                y: 86
                value: 0
                z: 0
                opacity: 1
                anchors.verticalCenterOffset: -4
                anchors.horizontalCenterOffset: 227
                anchors.centerIn: parent

                Image  { id: speed_inactive; x: -9; y: 8; opacity: 0.8; z: 3; source: "image/speed_inactive.png"

                }

                Image  {
                    id: needle1
                    x: 136; y: 86
                    clip: true
                    opacity: 1//root1.opacity
                    z: 3
                    smooth: true
                    source:rectangle1.configurablePointer//"image/needle.png"
                    transform: Rotation  {
                        id: needle1Rotation
                        origin.x: 5; origin.y: 65
                        angle: Math.min(Math.max(-130, speed_dial.value*2.6 - 130), 133)

                        Behavior on angle  {
                            SpringAnimation  {
                                spring: 1.4
                                damping: .15
                            }
                        }
                    }
                }

                Image {
                    id: speedOverlay
                    x: 123
                    y: 137
                    z: 0
                    opacity: 1
                    source: "image/overlay_active.png"
                }
            }

            // rpm dial object from RpmDial qml
            RpmDial  {
                id: rpm_dial
                x: 43
                y: 98
                visible: true
                z: 0
                opacity: 1
                anchors.verticalCenterOffset: 8
                anchors.horizontalCenterOffset: -207
                anchors.centerIn: parent
                // value: slider.x * 100 / (container.width - 34)
                Image  { id: rpm_inactive; x: -10; y: 0; opacity: 0.8; z: 3; source: "image/rpm_inactive.png"
                    //          transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 0; y: 1; z: 0} angle: 20 }
                    smooth: true
                }

                Image {
                    id: rpmOverlay
                    x: 123
                    y: 129
                    z: 0
                    opacity: 1
                    source: "image/overlay_active.png"
                }

                Image  {
                    id: needle
                    x: 135; y: 76 ; z:5
                    clip: true
                    opacity: 1//root.opacity

                    smooth: true
                    source: "image/needle.png"
                    transform: Rotation  {
                        id: needleRotation
                        origin.x: 5; origin.y: 65
                        angle: Math.min(Math.max(-130, rpm_dial.value*2.6 - 130),133)

                        Behavior on angle  {
                            SpringAnimation  {
                                spring: 1.4
                                damping: .15
                            }
                        }
                    }
                }
            }

            // engine start and stop button with flipable property
            Flipable {
                id: flipable
                width: 50
                height: 64

                property bool flipped: false
                x: 620
                y: 311

                front: Image { source: "image/Engine_start_stop_inactive.png"; anchors.centerIn: parent }
                back: Image { source: "image/Engine_start_stop_active.png"; anchors.centerIn: parent }

                transform: Rotation {
                    id: rotation
                    origin.x: flipable.width/2
                    origin.y: flipable.height/2
                    axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                    angle: 0    // the default angle
                }

                states: State {
                    name: "back"
                    PropertyChanges { target: rotation; angle: 180}
                    when: flipable.flipped;
                }

                transitions: Transition {
                    NumberAnimation { target: rotation; property: "angle"; duration: 100 }
                }

                MouseArea {
                    anchors.rightMargin: -2
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.fill: parent
                    onClicked:{ flipable.flipped = !flipable.flipped
                        rectangle1.startFlag = !rectangle1.startFlag
                        if(rectangle1.startFlag == true)
                        {

                            dialEffectStop.stop()                      // stop dial animation
                            dialEffectStart.start()                    // start dial effect animation
                            indicatorAnimateFocus.stop()               // stop indicator animation
                            indicatorAnimatedDim.start()               // startindictor effect animation
                            rpmAndspeedUpdate.running = true           // start rpmAndspeedUpdate timer
                            dummyAnimation.running=true

                        }
                        else {

                            dialEffectStart.stop()                     // stop dial effect animation
                            dialEffectStop.start()                     // start dial effect stop animation
                            indicatorAnimateFocus.start()              // start indicator focus annimation
                            indicatorAnimatedDim.stop()                // stop indicator animation
                            //                             rpmAndspeedUpdate.running = false
                            dummyAnimation.running=false
                        }


                    }
                }
            }

            // start dial glowing effect
            ParallelAnimation{
                id: dialEffectStart
                running: false

                NumberAnimation{target: speed_active; property:  "opacity"; to: 1.0; duration: 1000}
                NumberAnimation{target: rpm_active; property: "opacity" ; to : 1.0; duration: 1000}
                NumberAnimation{target: totalDistance; property: "opacity"; to: 1.0; duration: 1000}
                //NumberAnimation{target: digitRectangle; property: "opacity"; to: 1.0; duration: 1000}
                NumberAnimation{target: line; property: "opacity"; to: 1.0; duration: 1000}
                NumberAnimation { target:rpm_active; property:"x";to: 50; duration: 500 }
                NumberAnimation { target:rpm_inactive; property:"x";to: -220; duration: 500 }
                NumberAnimation { target:battery_low; property:"x";to: 80; duration: 500 }
                NumberAnimation { target:battery_low; property:"y";to: 40; duration: 500 }
                NumberAnimation { target:straightBeam; property:"x";to:250; duration: 500 }
                NumberAnimation { target:oilIndication; property: "x"; to: 10; duration: 500}
                NumberAnimation { target:needle; property: "x"; to:-70; duration: 500}
                NumberAnimation { target:rpmOverlay; property: "x"; to:-82; duration: 500}
                NumberAnimation { target: turn_left; property: "x"; to: 380; duration: 500}



                NumberAnimation { target:speed_active; property:"x";to: 850; duration: 500 }
                NumberAnimation { target:speed_inactive; property:"x";to:144; duration: 500 }
                NumberAnimation { target:needle1; property: "x"; to:290; duration: 500}
                NumberAnimation { target:speedOverlay; property: "x"; to:280; duration: 500}
                NumberAnimation { target:parkingLight; property: "x"; to: 920; duration: 500 }
                NumberAnimation { target:petrol_indicator; property: "x"; to: 1070; duration: 500 }
                NumberAnimation { target:petrol_indicator; property: "y"; to: 20; duration: 500 }
                NumberAnimation { target:brakeDamage; property: "x"; to: 1150; duration: 500 }
                NumberAnimation {target: turn_right; property: "x"; to: 800; duration: 500}



                NumberAnimation{target: totalDistance; property: "x"; to: 27; duration: 800}
                NumberAnimation{target: totalDistance; property: "y"; to: 400; duration: 800}
                NumberAnimation{target: destination; property: "opacity"; to: 1.0; duration: 1000}
                NumberAnimation{target: destination; property: "x"; to: 300; duration: 800}
                NumberAnimation{target: destination; property: "y"; to: 400; duration: 800}
                NumberAnimation{target: time; property: "opacity"; to: 1.0; duration: 1000}
                NumberAnimation{target: time; property: "x"; to: 850; duration: 800}
                NumberAnimation{target: time; property: "y"; to: 400; duration: 800}
                NumberAnimation{target: date; property: "opacity"; to: 1.0; duration: 1000}
                NumberAnimation{target: date; property: "x"; to: 1100; duration: 800}
                NumberAnimation{target: date; property: "y"; to: 400; duration: 800}
                NumberAnimation{target: turn_left; property: "opacity"; to: 0.2; duration: 500}
                NumberAnimation{target: turn_right; property: "opacity"; to: 0.2; duration: 500}
            }

            // decrease active effect of dial
            ParallelAnimation{
                id: dialEffectStop
                running: false
                NumberAnimation{target: speed_active; property:  "opacity"; to: 0; duration: 1500}
                NumberAnimation{target: rpm_active; property:  "opacity"; to: 0; duration: 1500}
                NumberAnimation{target: totalDistance; property: "opacity"; to: 0; duration: 100}
                //NumberAnimation{target: digitRectangle; property: "opacity"; to: 0; duration: 1000}
                NumberAnimation{target: line; property: "opacity"; to: 0; duration: 1000}

                //Throwing the RPM meter sideways
                NumberAnimation { target:rpm_active; property:"x";to: 260; duration: 500 }
                NumberAnimation { target:rpm_inactive; property:"x";to: -10; duration: 500 }
                NumberAnimation { target:battery_low; property:"x";to: 200; duration: 500 }
                NumberAnimation { target:battery_low; property:"y";to: 85; duration: 500 }
                NumberAnimation { target:straightBeam; property:"x";to:320; duration: 500 }
                NumberAnimation { target:oilIndication; property: "x"; to: 110; duration: 500}
                NumberAnimation { target:needle; property: "x"; to:135 ; duration: 500}
                NumberAnimation { target:rpmOverlay; property: "x"; to:123; duration: 500}
                NumberAnimation { target: turn_left; property: "x"; to: 560; duration: 500}

                //Throwing the Speedo meter sideways
                NumberAnimation { target:speed_active; property:"x";to: 695; duration: 500 }
                NumberAnimation { target:speed_inactive; property:"x";to: -9; duration: 500 }
                NumberAnimation { target:needle1; property: "x"; to:136; duration: 500}
                NumberAnimation { target:speedOverlay; property: "x"; to:123; duration: 500}
                NumberAnimation { target:parkingLight; property: "x"; to: 850; duration: 500 }
                NumberAnimation { target:petrol_indicator; property: "x"; to: 980; duration: 500 }
                NumberAnimation { target:petrol_indicator; property: "y"; to: 59; duration: 500 }
                NumberAnimation { target:brakeDamage; property: "x"; to: 1070; duration: 500 }
                NumberAnimation { target: turn_right; property: "x"; to: 660; duration: 500}



                NumberAnimation{target: totalDistance; property: "x"; to: 363; duration: 200}
                NumberAnimation{target: totalDistance; property: "y"; to: 131; duration: 200}
                NumberAnimation{target: destination; property: "opacity"; to: 0; duration: 100}
                NumberAnimation{target: destination; property: "x"; to: 363; duration: 200}
                NumberAnimation{target: destination; property: "y"; to: 131; duration: 200}
                NumberAnimation{target: time; property: "opacity"; to: 0; duration: 100}
                NumberAnimation{target: time; property: "x"; to: 363; duration: 200}
                NumberAnimation{target: time; property: "y"; to: 131; duration: 200}
                NumberAnimation{target: date; property: "opacity"; to: 0; duration: 100}
                NumberAnimation{target: date; property: "x"; to: 363; duration: 200}
                NumberAnimation{target: date; property: "y"; to: 131; duration: 200}
                NumberAnimation{target: turn_left; property: "opacity"; to: 1; duration: 500}
                NumberAnimation{target: turn_right; property: "opacity"; to: 1; duration: 500}

            }



            //increase all indicator opacity
            SequentialAnimation{
                id: indicatorAnimateFocus
                running: false
                NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 500}
                NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 100}
                NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 600 }
                NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 1; duration: 300 }
                NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 100 }
                NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 200 }
            }

            // decrease all indicators opacity
            SequentialAnimation{
                id: indicatorAnimatedDim
                running: false
                NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}
                NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
                NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100 }
                NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
                NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.3; duration: 100 }
                NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.3; duration: 100 }

            }

            SequentialAnimation{
                id: dummyAnimation
                running: false
                loops: Animation.Infinite 							// The animation is set to loop indefinitely
                NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.3; duration: 100}
                NumberAnimation{ target:highBeam; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:highBeam; property: "x"; to: 710; duration: 300}
                NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 3000}
                NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}
                NumberAnimation{ target:highBeam; property: "x"; to: 1280; duration: 3000}
                NumberAnimation{ target:highBeam; property: "visible"; to: 0; duration: 100}

                NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.9; duration: 100}
                NumberAnimation{ target:oil; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:oil; property: "x"; to: 710; duration: 700}
                NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 6000}
                NumberAnimation{ target:oil; property: "x"; to: 1280; duration: 700}
                NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
                NumberAnimation{ target:oil; property: "visible"; to: 0; duration: 1300}


                NumberAnimation{ target:battery_low; property: "opacity"; to: 0.9; duration: 100}
                NumberAnimation{ target:battery; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:battery; property: "x"; to: 710; duration: 300}
                NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 6000}
                NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100}
                NumberAnimation{ target:battery; property: "x"; to: 1280; duration: 3000}
                NumberAnimation{ target:battery; property: "visible"; to: 0; duration: 100}


                NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 100 }
                NumberAnimation{ target:fuelLeak; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:fuelLeak; property: "x"; to: 305; duration: 300}
                NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 6000 }
                NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
                NumberAnimation{ target:fuelLeak; property: "x"; to: -150; duration: 3000}
                NumberAnimation{ target:fuelLeak; property: "visible"; to: 0; duration: 100}


                NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.9; duration: 100 }
                NumberAnimation{ target:parkinglight; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:parkinglight; property: "x"; to: 310; duration: 300}
                NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 3000 }
                NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.2; duration: 100 }
                NumberAnimation{ target:parkinglight; property: "x"; to: -150; duration: 3000}
                NumberAnimation{ target:parkinglight; property: "visible"; to: 0; duration: 100}

                NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.9; duration: 100 }
                NumberAnimation{ target:brake; property: "visible"; to: 1; duration: 100}
                NumberAnimation{ target:brake; property: "x"; to: 330; duration: 300}
                NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 6000 }
                NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.2; duration: 100 }
                NumberAnimation{ target:brake; property: "visible"; to: 0; duration: 100}
                NumberAnimation{ target:brake; property: "x"; to: -150; duration: 3000}


                NumberAnimation{ target:turnright; property: "visible"; to: 1; duration: 100}

                ParallelAnimation{
                    id:indicator
                    NumberAnimation{ target:turnright; property: "x"; to: 330; duration: 300}
                    NumberAnimation {target:turn_right; properties: "opacity";from: 0.1; to: 1.0 ;loops: 30 }
                }

                NumberAnimation{ target:turnright; property: "x"; to: -150; duration: 3000}
                NumberAnimation {target:turn_right; properties: "opacity";to: 0 ;loops: 30 }


                NumberAnimation{ target:turnleft; property: "visible"; to: 1; duration: 100}
                ParallelAnimation{
                    id:indicator1
                    NumberAnimation{ target:turnleft; property: "x"; to: 330; duration: 300}
                    NumberAnimation {target:turn_left; properties: "opacity";from: 0.1; to: 1.0 ;loops: 30 }
                }

                NumberAnimation{ target:turnleft; property: "x"; to: -150; duration: 3000}
                NumberAnimation {target:turn_left; properties: "opacity";to: 0 ;loops: 30 }

            }
        }
    }
}

