#include "VehicleLibrary.h"
#include<QTimer>
#include <QVariant>
#include<QDebug>

VehicleLibrary::VehicleLibrary(QObject *parent):QObject(parent)
{
    speedtimer.start(500);
    rpmtimer.start(500);
    temptimer.start(2000);
    fueltimer.start(10000);
    connect(&speedtimer,&QTimer::timeout ,this,&VehicleLibrary::SpeedTimeout);

    connect(&rpmtimer,&QTimer::timeout ,this,&VehicleLibrary::RPMTimeout);

    connect(&temptimer,&QTimer::timeout ,this,&VehicleLibrary::TempTimout);

    connect(&fueltimer,&QTimer::timeout ,this,&VehicleLibrary::FuelTimeout);
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
    emit notifyFuelLevel(0);
}

void VehicleLibrary::startTimer()
{
    //    t1.start()
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

