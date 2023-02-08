#ifndef VEHICLELIBRARY_H
#define VEHICLELIBRARY_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include<QSqlDatabase>
#include <QSqlQuery>

class VehicleLibrary : public QObject
{
    Q_OBJECT
public:
    VehicleLibrary(QObject *parent=nullptr);
    VehicleLibrary(QString);

signals:
    void notifyVehicleSpeed(int speed);
    void notifyEngineRPM(int rpm);
    void notifyOutsideTemp(int temp);
    void notifyFuelLevel(int fuel);
    void totalEngineTime();
    void indicatorBlink();
    void indicatorBlinkOff();
    void rightIndicatorBlink();
    void rightIndicatorBlinkOff();
    void enginestarting();
    void distancesignal(int km);

    void usersignal(QString user);
    void makedefault(QString defaultuser);

private slots:
    void SpeedTimeout();
    void RPMTimeout();
    void TempTimout();
    void FuelTimeout();
    void EngineTime();
//    void Indicatorstart();
//    void Indicatorstop();
    void EngineTimerStart();
    void DistanceTimout();


public slots:
    void startTimers();
    void stopSpeed();
    void stopRPM();
    void stopTemp();
    void stopFuel();
    void indicatorstartfunction();
    void indicatorstopfunction();
    void rightindicatorstartfunction();
    void rightindicatorstopfunction();
    void startEngine();
    void stopEngine();
    void senduser(QString);
    /*************************************DATABASE FUNCTIONALITIES************************/

    void createtable();
    void updateValues(int ,int ,int );
    void updatedistance(int);

    int passEngineHour();
    int passEngineMinute();
    int passEngineSecond();
    int passkms();

    /****************************************SETTING DATABASE FUNCTIONS ****************************/

    void createsettingtable();
    void insertuserdata(QString,QString,QString,QString,QString);
    void updateuserdata(QString,QString,QString,QString,QString);
    QList<QString> returnusernames();
    QList<QString> accesscolors(QString);
    void insertdefaulttheme(QString);
    QString accesstheme();
    void applythemestart();

private:
    QTimer speedtimer;
    QTimer rpmtimer;
    QTimer temptimer;
    QTimer fueltimer;
    QTimer enginetimer;
//    QTimer indicatortimerstart;
//    QTimer indicatortimerstop;
    QTimer enginestarttimer;
    QTimer distancetimer;
    QSqlDatabase dbase;
    int hr=0,mn=0,se=0,km=0;
//    int hr1=0,mn1=0,se1=0;


};
#endif // QTIMER_INTGRN_H
