#include "VehicleLibrary.h"
#include<QTimer>
#include <QVariant>
#include<QDebug>

VehicleLibrary::VehicleLibrary(QObject *parent):QObject(parent)
{

    connect(&speedtimer,&QTimer::timeout ,this,&VehicleLibrary::SpeedTimeout);

    connect(&rpmtimer,&QTimer::timeout ,this,&VehicleLibrary::RPMTimeout);

    connect(&temptimer,&QTimer::timeout ,this,&VehicleLibrary::TempTimout);

    connect(&fueltimer,&QTimer::timeout ,this,&VehicleLibrary::FuelTimeout);

    connect(&enginetimer,&QTimer::timeout ,this,&VehicleLibrary::EngineTime);

    connect(&indicatortimerstart,&QTimer::timeout,this,&VehicleLibrary::Indicatorstart);

    connect(&indicatortimerstop,&QTimer::timeout,this,&VehicleLibrary::Indicatorstop);


}
void VehicleLibrary::SpeedTimeout()
{
    static int x=0;
    x=x+10;
//    QString s=QString::number(x);
//    emit Not(QVariant(s));
    emit notifyVehicleSpeed(x);
}

void VehicleLibrary::RPMTimeout()
{
    static int r=0;
    r=r+1;
    emit notifyEngineRPM(r);
}

void VehicleLibrary::TempTimout()
{
    static int t=10;
    t=t+1;
    emit notifyOutsideTemp(t);
}

void VehicleLibrary::FuelTimeout()
{
    static int f=50;
    f=f-1;
    emit notifyFuelLevel(f);
}

void VehicleLibrary::EngineTime()
{
    emit totalEngineTime();
}

void VehicleLibrary::Indicatorstart()
{
    emit indicatorBlink();
}
void VehicleLibrary::Indicatorstop()
{
    emit indicatorBlinkOff();
}
void VehicleLibrary::startTimers()
{
    speedtimer.start(500);
    rpmtimer.start(500);
    temptimer.start(2000);
    fueltimer.start(10000);
    enginetimer.start(1000);
    indicatortimerstart.start(5000);
    indicatortimerstop.start(10000);
//    indicatorstartfunction();
//    indicatortimer.setInterval(5000);
}

void VehicleLibrary::stopSpeed()
{
    speedtimer.stop();
}

void VehicleLibrary::stopRPM()
{
    rpmtimer.stop();
}

void VehicleLibrary::stopTemp()
{
    temptimer.stop();
}

void VehicleLibrary::stopFuel()
{
    fueltimer.stop();
}

void VehicleLibrary::indicatorstartfunction()
{
        indicatortimerstart.start(5000);
        indicatortimerstop.start(10000);
}

void VehicleLibrary::indicatorstopfunction()
{
//    indicatortimerstart.stop();
//    indicatortimerstop.stop();
    indicatorstartfunction();
//    indicatortimerstop.start(500);
}

