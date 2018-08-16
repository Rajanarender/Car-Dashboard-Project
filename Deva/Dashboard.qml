import QtQuick 2.4
import QtQuick.Extras 1.4 //for circular gauge diagram
import QtQuick.Controls 2.3 //for frame layout
import QtQuick.Controls.Styles 1.4
//import QtCanvas3D 1.1  //Since we are not using Canvas
//import QtQuick.Window 2.2
//import "glcode.js" as GLCode

Rectangle{ //This is a Component,the below features are called as property
    id: rectangle //circular gauge and slider should be within Rectangle of formEditor
    width: 640
    height: 360
    visible: true
    color: "black" //to color the Rectangle in black
    radius: 1
    property alias circularGauge: circularGauge //Creating alias for id
    property alias circularGauge1: circularGauge1

    CircularGauge {
        id: circularGauge //Speedometer
        x: 370
        y: 16
        width: 265
        height: 285
        maximumValue: 100
        clip: false
        opacity: 1
        scale: 1
        stepSize: 0
        value: 0

        Image {
            id: image
            x: 87
            y: 221
            width: 92
            height: 61
            source: "Images/fuelmeter.png"
        }
    }

    Frame {
        id: frame1
        x: 367
        y: 8
        width: 271
        height: 293
    }

    CircularGauge {
        id: circularGauge1 //RPM meter
        x: 8
        y: 16
        width: 243
        height: 290
        maximumValue: 50
        clip: false
        opacity: 1
        value: 0
        stepSize: 0
        scale: 1
        property int gear: 0
        property bool manflag: true
        property bool autoflag: true
        Frame {
            id: frame2
            x: -6
            y: -10
            width: 257
            height: 292

            Text { //RPM text
                id: text1
                x: 50
                y: 69
                width: 121
                height: 29
                color: "Red"
                text: qsTr("RPM                                                                              (1/min x 100) ")
                font.bold: true
                font.family: "Verdana"
                fontSizeMode: Text.FixedSize
                lineHeight: 0.8
                textFormat: Text.AutoText
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignBottom
                elide: Text.ElideNone
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                font.pixelSize: 15
            }

            Text { //Speed text
                id: text2
                x: 452
                y: 69
                width: 82
                height: 29
                color: "#ff0000"
                text: qsTr("Speed                                                                                     (km/hr) ")
                font.bold: true
                elide: Text.ElideNone
                font.family: "Verdana"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                verticalAlignment: Text.AlignBottom
                lineHeight: 0.8
                renderType: Text.NativeRendering
                textFormat: Text.AutoText
                fontSizeMode: Text.FixedSize
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
            }

            Frame {
                id: frame
                x: 250
                y: -12
                width: 97
                height: 220
            }
        }
    }

    Text {  //Time Display
        id: text3
        x: 272
        y: 38
        width: 82
        height: 34
        font.pixelSize: 15
        font.family: "Arial"
        color: "White"
        font.bold: true
        lineHeight: 1
        wrapMode: Text.NoWrap
    }


    Text { //Speed Digital
        id: text4
        x: 272
        y: 78
        width: 82
        height: 34
        color: "white"
        wrapMode: Text.NoWrap
        font.bold: true
        lineHeight: 1
        font.family: "Arial"
        font.pixelSize: 30
    }

    Text { //Gear Digital
        id: text5
        x: 272
        y: 155
        width: 82
        height: 34
        color: "White"
        wrapMode: Text.NoWrap
        font.bold: true
        lineHeight: 1
        font.family: "Arial"
        font.pixelSize: 30
    }

    Text { //Date Display
        id: text6
        x: 266
        y: 26
        width: 95
        height: 34
        color: "White"
        wrapMode: Text.NoWrap
        font.bold: true
        lineHeight: 1
        font.family: "Arial"
        font.pixelSize: 12
    }

    Timer {
        interval: 50 //For Time & Date display to appear immediately
        running: true
        repeat: true
        onTriggered: {
            var date = new Date()
            text6.text = date.toDateString()
            text3.text = date.toLocaleTimeString("hh:mm")

        }
    }

    Item {
        id:item1
        data: {
            text4.text = circularGauge.value
            text5.text =circularGauge1.gear
        }
    }

    Text { //Km/Hr text
        id: text7
        x: 272
        y: 108
        width: 82
        height: 25
        color: "Red"
        wrapMode: Text.NoWrap
        font.bold: true
        lineHeight: 1
        font.family: "Arial"
        font.pixelSize: 15
        text: qsTr("Km/Hr")
    }

    Text { //Gear text
        id: text8
        x: 273
        y: 187
        width: 82
        height: 21
        color: "Red"
        wrapMode: Text.NoWrap
        font.bold: true
        lineHeight: 1
        font.family: "Arial"
        font.pixelSize: 15
        text: qsTr("Gear")
    }

}
