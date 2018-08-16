import QtQuick 2.4
import QtQuick.Extras 1.4 //for circular gauge diagram
import QtQuick.Controls 2.3 //for frame layout
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
//import QtCanvas3D 1.1 //Since we are not using Canvas
//import "glcode.js" as GLCode

Window { //This is parent
    id: window
    title: qsTr("CAR DASHBOARD")
    width: 645
    height: 308
    color: "black"
    visible: true

    //Reading from Test.qml
    Dashboard{ //This is child

        focus:true //for enabling the key events
        Keys.onPressed: {
            if(event.key === Qt.Key_Up) //=== is used for Equal to condition check
            {
                if(circularGauge1.autoflag == true) //Auto Gear
                {
                    circularGauge1.manflag = false
                    if(circularGauge.value%20==0) //for speed 0,20,40,60,80,100
                    {
                        if(circularGauge1.gear < 5) //condition ADDED NEWLY
                        {
                            circularGauge1.gear++ //gear linear decrement
                        }

                        if(circularGauge.value == circularGauge.maximumValue) //maximum speed
                        {
                            circularGauge1.gear =5
                            circularGauge1.value = 44
                        }
                    }

                    if(circularGauge1.value>=45)
                    {
                        circularGauge1.value=5
                    }

                    circularGauge1.value++ //RPM linear increment
                    circularGauge.value++ //speed linear increment
                }
                else  //Manual Gear
                {
                    if(circularGauge1.gear == 0)
                    {
                        circularGauge.value =0 //Speed is Zero
                    }
                    else if(circularGauge1.gear == 1) //0 to 20 speed
                    {
                        circularGauge.value++
                        if(circularGauge.value >20)
                        {
                            circularGauge.value =20
                        }
                    }
                    else if(circularGauge1.gear == 2) //20 to 40 speed
                    {
                        circularGauge.value++
                        if(circularGauge.value >40)
                        {
                            circularGauge.value =40
                        }
                    }
                    else if(circularGauge1.gear == 3) //40 to 60 speed
                    {
                        circularGauge.value++
                        if(circularGauge.value >60)
                        {
                            circularGauge.value =60
                        }
                    }
                    else if(circularGauge1.gear == 4) //60 to 80 speed
                    {
                        circularGauge.value++
                        if(circularGauge.value >80)
                        {
                            circularGauge.value =80
                        }
                    }
                    else if(circularGauge1.gear == 5) //80 to 100 speed
                    {
                        circularGauge.value++
                        if(circularGauge.value >100)
                        {
                            circularGauge.value =100
                        }
                    }

                    circularGauge1.value++ //RPM increments for All Manual gears
                }
            }
            else if(event.key === Qt.Key_Down)
            {
                if(circularGauge1.autoflag == true) //Auto Gear
                {
                    circularGauge.value-- //speed linear decrement
                    if(circularGauge.value%20==0)
                    {
                        if(circularGauge1.gear >0) //condition ADDED NEWLY
                        {
                            circularGauge1.gear-- //gear linear decrement
                        }

                        if (circularGauge.value == circularGauge.minimumValue) //minimum speed
                        {
                            circularGauge1.gear =0
                            circularGauge1.value = 0
                        }
                    }

                    if(circularGauge1.value>0 && circularGauge1.value<=5)
                    {
                        circularGauge1.value=45
                    }

                    circularGauge1.value-- //RPM linear decrement
                }
                else //Manual Gear
                {
                    if(circularGauge1.gear == 0)
                    {
                        circularGauge.value =0
                    }
                    else if(circularGauge1.gear == 1)
                    {
                        circularGauge.value--
                        /*
                        if(circularGauge.value <20)
                        {
                            circularGauge.value =20
                        }
                        */
                    }
                    else if(circularGauge1.gear == 2)
                    {
                        circularGauge.value--
                        if(circularGauge.value <=20)
                        {
                            circularGauge.value =20
                        }
                    }
                    else if(circularGauge1.gear == 3)
                    {
                        circularGauge.value--
                        if(circularGauge.value <=40)
                        {
                            circularGauge.value =40
                        }
                    }
                    else if(circularGauge1.gear == 4)
                    {
                        circularGauge.value--
                        if(circularGauge.value <=60)
                        {
                            circularGauge.value =60
                        }
                    }
                    else if(circularGauge1.gear == 5)
                    {
                        circularGauge.value--
                        if(circularGauge.value <=80)
                        {
                            circularGauge.value =80
                        }
                    }

                    circularGauge1.value-- //RPM decrements for All Manual gears
                }
            }
            else if(event.key === Qt.Key_Left) //Manual Gear Increment
            {
                if(circularGauge1.manflag == true)
                {
                    if(circularGauge1.gear <5)
                    {
                        if(circularGauge1.autoflag == true) //Only for 0th gear
                        {
                            circularGauge1.gear = 0
                            circularGauge1.autoflag = false
                        }
                        else  //For Gears 1,2,3,4,5
                        {
                            circularGauge1.gear++
                            circularGauge1.value =5 //RPM resets due to Gear change
                        }
                    }
                }
            }
            else if(event.key === Qt.Key_Right) //Manual Gear Decrement
            {
                if(circularGauge1.manflag == true)
                {
                    if(circularGauge1.gear >0)
                    {
                        circularGauge1.gear--
                        /*  //Need to discuss with RaghuRam
                       circularGauge1.value =5

                        if(circularGauge1.gear ==0)
                        {
                            circularGauge1.value =5
                        }
                        */
                        circularGauge1.autoflag = false
                    }
                }

            }
        }
    }
}



