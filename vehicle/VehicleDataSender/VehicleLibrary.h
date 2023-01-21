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
//    void notify(QVariant speed);
    void notifyVehicleSpeed(int speed);
    void notifyEngineRPM(int rpm);
    void notifyOutsideTemp(int temp);
    void notifyFuelLevel(int level);
    void totalEngineTime();

private slots:
    void SpeedTimeout();
    void RPMTimeout();
    void TempTimout();
    void FuelTimeout();

public slots:
    void startTimer();
    void stopSpeed();
    void stopRPM();
    void stopTemp();
    void stopFuel();

private:
    QTimer speedtimer;//t1;
    QTimer rpmtimer;//t2;
    QTimer temptimer;//t3;
    QTimer fueltimer;//t4;

};
#endif // QTIMER_INTGRN_H
