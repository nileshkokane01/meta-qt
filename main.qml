import QtQuick 2.2
import QtQuick.Window 2.1




Window {

    visible: true
    width: 1280
    height: 480



    Rectangle {

           // parent rectangle
           id: rectangle1
           x: 0
           y: 0
           z: 2
           width: 1280
           height: 480
           radius: 0
           visible: true
           border.width: 0
           border.color: "#ffffff"


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

           gradient: Gradient {
               GradientStop {
                   position: 0.33;
                   color: "#000000";
               }
               GradientStop {
                   position: 0.70;
                   color: "#e61313";
               }
           }


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
//                     indicatorflash.running = true
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
                      z: 5
                      opacity: 0
                      source: "pics/High_Beam_Indicator.png"
           }

           Image {
                     id: parkingLight
                     x: 850
                     y: 32
                     z: 5
                     fillMode: Image.Tile
                     source: "pics/parkingLight.png"
           }

           Image {
                      id: battery_low
                      x: 200
                      y: 85
                      scale: 1.0
                      rotation: 90
                      z: 9
                      source: "pics/battery_low1.png"
           }

           Image {
                   id: turn_left
                   x: 560
                   y: 208
                   smooth: true
                   z: 6
                   source: "pics/turn_indicator_left.png"
           }
           Image {
                       id: turn_right
                       x: 660
                       y: 208
                       smooth: true
                       z: 6
                       source: "pics/turn_indicator.png"
           }


           Image {
                     id: petrol_indicator
                     x: 980
                     y: 59
                     z: 5
                     scale: 0.4
                     source: "pics/petrol.png"
           }


           Image {
                       id: oilIndication
                       x: 110
                       y: 182
                       z: 5
                       source: "pics/oilIndicator.png"
           }

           Image {
                      id: line
                      x: -49
                      y: 20
                      visible: true
                      opacity: 0
                      source: "pics/dropDown.png"
           }

           Image {
                       id: rpm_active
                       x: 260
                       y: 79
                       z: 11
                       opacity: 0
                       visible: true
                       source: "pics/rpm_active.png"
           }

           Image {
                      id: speed_active
                       x: 695
                       y: 75
                       z: 12
                       opacity: 0
                       visible: true
                       source: "pics/speed_active1.png"
           }

           Image {
                      id: brakeDamage
                      x: 1070
                      y: 190
                      z: 5
                      source: "pics/Brake_failure.png"
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
                   z: 10
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
                       z: 10
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
                       z: 10
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
                      z: 10
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
/**/
          // speed dial import from speedDial qml
                SpeedDial  {
                    id: speed_dial
                    x: 477
                    y: 86
                    value: 0
                    z: 7
                    opacity: 1
                    anchors.verticalCenterOffset: -4
                    anchors.horizontalCenterOffset: 227
                    anchors.centerIn: parent
                    //value: slider.x * 100 / (container.width - 34)
                    //value: 50
/**/
                    Image {
                        id: speedOverlay
                        x: 123
                        y: 137
                        z: 7
                        opacity: 1
                        source: "pics/overlay_active.png"
                    }
                }
/**/
                // rpm dial object from RpmDial qml
                     RpmDial  {
                         id: rpm_dial
                         x: 43
                         y: 98
                         visible: true
                         z: 7
                         opacity: 1
                         anchors.verticalCenterOffset: 8
                         anchors.horizontalCenterOffset: -207
                         anchors.centerIn: parent
                        // value: slider.x * 100 / (container.width - 34)

                         Image {
                             id: rpmOverlay
                             x: 123
                             y: 129
                             z: 7
                             opacity: 1
                             source: "pics/overlay_active.png"
                         }
                    }





           // engine start and stop button with flipable property
             Flipable {
                  id: flipable

                  width: 50
                  height: 64
                  z: 7

                  property bool flipped: false
                  x: 620
                  y: 311

                  front: Image { source: "pics/Engine_start_stop_inactive.png"; anchors.centerIn: parent }
                  back: Image { source: "pics/Engine_start_stop_active.png"; anchors.centerIn: parent }

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
//                     NumberAnimation{target: digitRectangle; property: "opacity"; to: 1.0; duration: 1000}
                     NumberAnimation{target: line; property: "opacity"; to: 1.0; duration: 1000}

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
                     NumberAnimation{target: turn_left; property: "opacity"; to: 0.1; duration: 800}
                     NumberAnimation{target: turn_right; property: "opacity"; to: 0.1; duration: 800}
                 }
/**/
                 // decrease active effect of dial
                    ParallelAnimation{
                     id: dialEffectStop
                     running: false
                     NumberAnimation{target: speed_active; property:  "opacity"; to: 0; duration: 1500}
                     NumberAnimation{target: rpm_active; property:  "opacity"; to: 0; duration: 1500}
                     NumberAnimation{target: totalDistance; property: "opacity"; to: 0; duration: 100}
 //                    NumberAnimation{target: digitRectangle; property: "opacity"; to: 0; duration: 1000}
                     NumberAnimation{target: line; property: "opacity"; to: 0; duration: 1000}

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
                    NumberAnimation{target: turn_left; property: "opacity"; to: 1; duration: 800}
                    NumberAnimation{target: turn_right; property: "opacity"; to: 1; duration: 800}

                 }


 /**/
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
