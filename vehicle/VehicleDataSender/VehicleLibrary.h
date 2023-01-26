#ifndef VEHICLELIBRARY_H
#define VEHICLELIBRARY_H

#include <QObject>
#include <QTimer>
#include <QVariant>

class VehicleLibrary : public QObject
{
    Q_OBJECT
public:
    VehicleLibrary(QObject *parent=nullptr);

signals:
    void notifyVehicleSpeed(int speed);
    void notifyEngineRPM(int rpm);
    void notifyOutsideTemp(int temp);
    void notifyFuelLevel(int fuel);
    void totalEngineTime();
    void indicatorBlink();
    void indicatorBlinkOff();

private slots:
    void SpeedTimeout();
    void RPMTimeout();
    void TempTimout();
    void FuelTimeout();
    void EngineTime();
    void Indicatorstart();
    void Indicatorstop();

public slots:
    void startTimers();
    void stopSpeed();
    void stopRPM();
    void stopTemp();
    void stopFuel();
    void indicatorstartfunction();
    void indicatorstopfunction();

private:
    QTimer speedtimer;
    QTimer rpmtimer;
    QTimer temptimer;
    QTimer fueltimer;
    QTimer enginetimer;
    QTimer indicatortimerstart;
    QTimer indicatortimerstop;

};
#endif // QTIMER_INTGRN_H
