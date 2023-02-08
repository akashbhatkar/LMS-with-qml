#include "VehicleLibrary.h"
#include<QTimer>
#include <QVariant>
#include<QDebug>
#include <QSqlError>

VehicleLibrary::VehicleLibrary(QObject *parent):QObject(parent)
{

    connect(&speedtimer,&QTimer::timeout ,this,&VehicleLibrary::SpeedTimeout);

    connect(&rpmtimer,&QTimer::timeout ,this,&VehicleLibrary::RPMTimeout);

    connect(&temptimer,&QTimer::timeout ,this,&VehicleLibrary::TempTimout);

    connect(&fueltimer,&QTimer::timeout ,this,&VehicleLibrary::FuelTimeout);

    connect(&enginetimer,&QTimer::timeout ,this,&VehicleLibrary::EngineTime);

//    connect(&indicatortimerstart,&QTimer::timeout,this,&VehicleLibrary::Indicatorstart);

//    connect(&indicatortimerstop,&QTimer::timeout,this,&VehicleLibrary::Indicatorstop);

    connect(&enginestarttimer,&QTimer::timeout,this,&VehicleLibrary::EngineTimerStart);

    connect(&distancetimer,&QTimer::timeout,this,&VehicleLibrary::DistanceTimout);

    QSqlQuery updatehour;
    QSqlQuery updatemin;
    QSqlQuery updatesec;


    updatehour.exec("SELECT hours FROM enginetime");
    updatemin.exec("SELECT minutes FROM enginetime");
    updatesec.exec("SELECT seconds FROM enginetime");

    while (updatehour.next())
    {
        hr=updatehour.value("hours").toInt();
    }
    while (updatemin.next())
    {
        mn=updatemin.value("minutes").toInt();
    }
    while (updatesec.next())
    {
        se=updatesec.value("seconds").toInt();
    }

    QSqlQuery updatekms;
    updatekms.exec("SELECT kms FROM distance");
    while (updatekms.next())
    {
        km=updatekms.value("kms").toInt();


    }
}

VehicleLibrary::VehicleLibrary(QString parent)
{
   dbase =QSqlDatabase::addDatabase("QSQLITE");
   dbase.setDatabaseName(parent);
   if(!dbase.open())
   {
       qDebug()<<"Error! connection with database failed ";
   }
   else
       qDebug()<<"database connection is ok";
}

void VehicleLibrary::SpeedTimeout()
{
    static int x=0;
    x=x+1;
//    QString s=QString::number(x);
//    emit Not(QVariant(s));
    emit notifyVehicleSpeed(x);
}

void VehicleLibrary::RPMTimeout()
{
    static int r=0;
    r=r+100;
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

//void VehicleLibrary::Indicatorstart()
//{
//    emit indicatorBlink();
//}
//void VehicleLibrary::Indicatorstop()
//{
//    emit indicatorBlinkOff();
//}

void VehicleLibrary::EngineTimerStart()
{

    emit enginestarting();
}

void VehicleLibrary::DistanceTimout()
{
    static int k=0;
    k=k+1;
    emit distancesignal(k);
}
void VehicleLibrary::startTimers()
{
    speedtimer.start(500);
    rpmtimer.start(500);
    temptimer.start(2000);
    fueltimer.start(10000);
    enginetimer.start(1000);
    distancetimer.start(45000);
//    indicatortimerstart.start(5000);
//    indicatortimerstop.start(10000);
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
//        indicatortimerstart.start(5000);
//        indicatortimerstop.start(10000);
    emit indicatorBlink();
}

void VehicleLibrary::indicatorstopfunction()
{
    emit indicatorBlinkOff();
}

void VehicleLibrary::rightindicatorstartfunction()
{
    emit rightIndicatorBlink();
}

void VehicleLibrary::rightindicatorstopfunction()
{
    emit rightIndicatorBlinkOff();
}

void VehicleLibrary::startEngine()
{
    enginestarttimer.start(5000);
}
void VehicleLibrary::stopEngine()
{
    enginestarttimer.stop();
}

void VehicleLibrary::senduser(QString u)
{
    emit usersignal(u);
}
/************************************************************************************DATABASE FUNCTIONALITIES *****************************************************************************/
void VehicleLibrary::createtable()
{
        QSqlQuery create;
        create.prepare("CREATE TABLE enginetime(id INTEGER PRIMARY KEY, hours INTEGER, minutes INTEGER, seconds INTEGER);");
        if(!create.exec())
        {
            qDebug()<<"could not create table  enginetime one might already exist";
        }
        else
            qDebug()<<"table created enginetime ";

        QSqlQuery createdistance;
        createdistance.prepare("CREATE TABLE distance(id INTEGER PRIMARY KEY, kms INTEGER);");
        if(!createdistance.exec())
        {
            qDebug()<<"could not create table distance one might already exist";
        }
        else
            qDebug()<<"table created distance ";

        QSqlQuery createtheme;
        createtheme.prepare("CREATE TABLE themes (id INTEGER PRIMARY KEY, users TEXT);");
        if(!createtheme.exec())
        {
            qDebug()<<"could not create table themes one might already exist";
        }
        else
            qDebug()<<"table created themes ";
}

void VehicleLibrary::updateValues(int hour, int minute, int second)
{

    QSqlQuery updatetime;

    updatetime.prepare("INSERT INTO enginetime (hours,minutes,seconds) VALUES (:h,:m,:s)");
    updatetime.bindValue(":h",hour);
    updatetime.bindValue(":m",minute);
    updatetime.bindValue(":s",second);

    if(updatetime.exec())
        qDebug()<<"add time success";
    else
        qDebug()<<"add time failed"<<updatetime.lastError();
}

void VehicleLibrary::updatedistance(int kilometers)
{
    QSqlQuery updatedistance;

    updatedistance.prepare("INSERT INTO distance (kms) VALUES (:kilometers)");
    updatedistance.bindValue(":kilometers",kilometers);
    if(updatedistance.exec())
        qDebug()<<"add kilometers success";
    else
        qDebug()<<"add kilometers failed";
}



int VehicleLibrary::passEngineHour()
{
    return hr;
}

int VehicleLibrary::passEngineMinute()
{
    return mn;
}

int VehicleLibrary::passEngineSecond()
{
    return se;
}

int VehicleLibrary::passkms()
{
    qDebug()<<"previous kilometers"<<km;
    return km;
}


/*************************************************************************  SETTING DATABASE ************************************************************************************************/
void VehicleLibrary::createsettingtable()
{
    QSqlQuery create;
    create.prepare("CREATE TABLE settings (id INTEGER PRIMARY KEY,userId INTEGER, username TEXT, backcolor TEXT,speedocolor TEXT, fontcolor TEXT );");
    if(!create.exec())
    {
        qDebug()<<"create table settings failed one might already exist";
    }
    else
        qDebug()<<"Create table setting success";
}

void VehicleLibrary::insertuserdata(QString userId,QString username,QString backcolor,QString speedocolor,QString fontcolor)
{
    int cnt=0;

    QSqlQuery search;
    QString checkuser;
    search.exec("SELECT userId FROM settings");
    while (search.next())
    {
        checkuser=search.value("userId").toString();
        if(checkuser==userId)
        {
            ++cnt;
            qDebug()<<"user already found ";
            updateuserdata(userId, username, backcolor, speedocolor, fontcolor);
        }
    }

    if(cnt==0)
    {
        QSqlQuery insert;
        insert.prepare("INSERT INTO settings (userId,username,backcolor,speedocolor,fontcolor) VALUES (:userId,:username,:backcolor,:speedocolor,:fontcolor)");
        insert.bindValue(":userId",userId);
        insert.bindValue(":username",username);
        insert.bindValue(":backcolor",backcolor);
        insert.bindValue(":speedocolor",speedocolor);
        insert.bindValue(":fontcolor",fontcolor);

        if(insert.exec())
        {
            qDebug()<<"insert setting success";
        }
        else
            qDebug()<<"insert setting failed ";
    }

}

void VehicleLibrary::updateuserdata(QString userId,QString username,QString backcolor,QString speedocolor,QString fontcolor)
{
    qDebug()<<userId<<username<<backcolor<<speedocolor<<fontcolor;
    QSqlQuery query;
    query.prepare("UPDATE settings SET username= :username, backcolor= :backcolor, speedocolor= :speedocolor, fontcolor= :fontcolor WHERE userId=:userId");
    query.bindValue(":userId",userId);
    query.bindValue(":username",username);
    query.bindValue(":backcolor",backcolor);
    query.bindValue(":speedocolor",speedocolor);
    query.bindValue(":fontcolor",fontcolor);
    if(query.exec())
        qDebug()<<"updated user successfully";
    else
        qDebug()<<"update user failed "<<query.lastError() ;
}

QList<QString> VehicleLibrary::returnusernames()
{
    int i=0;
    QList<QString> user;
    QSqlQuery users;
    users.exec("SELECT username from settings");
    while(users.next())
    {

        QString a=users.value("username").toString();
        user.append(a);
    }
    return user;
}

QList<QString> VehicleLibrary::accesscolors(QString user)
{
    QList<QString> colors;
    QSqlQuery find;
    find.prepare("SELECT backcolor,speedocolor,fontcolor FROM settings WHERE userId=:user");
    find.bindValue(":user",user);
    if(!find.exec())
        qDebug()<<"query failed";
    else
    {
        if(find.first())
        {
            colors.append(find.value("backcolor").toString());
            colors.append(find.value("speedocolor").toString());
            colors.append(find.value("fontcolor").toString());

        }
    }

    return colors;
}

void VehicleLibrary::insertdefaulttheme(QString users)
{
    QSqlQuery updatethemes;

    updatethemes.prepare("INSERT INTO themes (users) VALUES (:u)");
    updatethemes.bindValue(":u",users);
    if(updatethemes.exec())
        qDebug()<<"add themes success";
    else
        qDebug()<<"add themes failed"<<updatethemes.lastError();
}

QString VehicleLibrary::accesstheme()
{
    QSqlQuery access;
    QString t;
    access.prepare("SELECT users FROM themes");
    while (access.next())
    {
        t=access.value("users").toString();
    }
    return t;
}

void VehicleLibrary::applythemestart()
{
    QSqlQuery find;
    QString u;
    find.exec("SELECT * FROM themes");
    while (find.next())
    {
         u=find.value("users").toString();
    }
    emit makedefault(u);

}

